//
//  ZGEffectsOnlyEngineManager.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"
#import "ZegoLicense.h"
#import "ZegoHudManager.h"

static ZGEffectsOnlyEngineManager *_sharedManager = nil;

@interface ZGEffectsOnlyEngineManager () <ZegoEffectsEventHandler>

@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, assign) BOOL isEffectsCreated;

@property (nonatomic, weak) id<ZGEffectsErrorDelegate> errorDelegate;
@property (nonatomic, weak) id<ZGEffectsFaceDetectionDelegate> faceDetectionDelegate;


@property (nonatomic, assign, readwrite) BOOL isFaceDetectionEnabled;

@end

@implementation ZGEffectsOnlyEngineManager

#pragma mark - Main

+ (ZGEffectsOnlyEngineManager *)shared {
    if (!_sharedManager) {
        @synchronized (self) {
            if (!_sharedManager) {
                _sharedManager = [[self alloc] init];
                _sharedManager.lock = [[NSLock alloc] init];
                _sharedManager.isEffectsCreated = NO;
            }
        }
    }
    return _sharedManager;
}

- (void)createEffectsWithConfig:(ZegoEffectsAdvancedConfig *)config {
  [self.lock lock];
  if (!self.isEffectsCreated) {
    NSString *faceDetectionModelPath = [[NSBundle mainBundle] pathForResource:@"FaceDetectionModel" ofType:@"model"];
    NSString *segmentationModelPath = [[NSBundle mainBundle] pathForResource:@"SegmentationModel" ofType:@"model"];
    
    NSString *whitenBundlePath = [[NSBundle mainBundle] pathForResource:@"FaceWhiteningResources" ofType:@"bundle"];
    NSString *rosyBundlePath = [[NSBundle mainBundle] pathForResource:@"RosyResources" ofType:@"bundle"];
    NSString *teethWhiteningBundlePath = [[NSBundle mainBundle] pathForResource:@"TeethWhiteningResources" ofType:@"bundle"];
    NSString *pendantBundlePath = [[NSBundle mainBundle] pathForResource:@"PendantResources" ofType:@"bundle"];
    NSString *commonBundlePath = [[NSBundle mainBundle] pathForResource:@"CommonResources" ofType:@"bundle"];
    
    if (!faceDetectionModelPath || !segmentationModelPath) {
      NSException *e = [NSException exceptionWithName:NSInvalidArgumentException reason:@"Cannot find models" userInfo:nil];
      [e raise];
    }
    
    NSLog(@"⚙️ [ZGEffectsOnlyEngineManager] set models");
    
    [ZegoEffects setResources:@[
      whitenBundlePath,
      rosyBundlePath,
      teethWhiteningBundlePath,
      pendantBundlePath,
      faceDetectionModelPath,
      segmentationModelPath,
      commonBundlePath
    ]];
    
    NSLog(@"🚀 [ZGEffectsOnlyEngineManager] create effects");
    NSString *license = [ZegoLicense shared].effectsLicense;
    if (config) {
      [ZegoEffects setAdvancedConfig:config];
    }
    self.effects = [ZegoEffects create:license];
    [self.effects setEventHandler:self];
    self.isEffectsCreated = YES;
    
    // Initialize default state
    [self setupDefaultState];
    
  }
  [self.lock unlock];
}

- (void)destroyEffects {
    [self.lock lock];
    if (self.isEffectsCreated) {
        NSLog(@"🏳️ [ZGEffectsOnlyEngineManager] destroy effects");
      ZegoEffectsAdvancedConfig *config = [[ZegoEffectsAdvancedConfig alloc] init];
      [ZegoEffects setAdvancedConfig:config];
        [self.effects destroy];
        self.effects = nil;
        self.isEffectsCreated = NO;
    }
    [self.lock unlock];
}

- (void)setErrorDelegate:(nullable id<ZGEffectsErrorDelegate>)delegate {
    _errorDelegate = delegate;
}

- (void)setFaceDetectionDelegate:(nullable id<ZGEffectsFaceDetectionDelegate>)delegate {
    _faceDetectionDelegate = delegate;
}

- (void)initEnv:(CGSize)size {
    [self.effects initEnv:size];
}

- (void)uninitEnv {
    [self.effects uninitEnv];
}

// MARK: Private: Setup Default State
- (void)setupDefaultState {
  // Initialize effects state
  [self setupFaceDetectionDefault];
}

- (void)setupFaceDetectionDefault {
  [self enableFaceDetection:NO];
}

#pragma mark - Process

- (void)processImageBuffer:(CVPixelBufferRef)buffer {
    // In-place processing
    [self.effects processImageBuffer:buffer];
}

#pragma mark - FaceDetection

- (void)enableFaceDetection:(BOOL)enable {
    self.isFaceDetectionEnabled = enable;
    [self.effects enableFaceDetection:enable];
}

#pragma mark - Mosaic

- (NSString *)mosaicShapeForMosaicType:(ZGEffectsOnlyMosaicType)type {
  NSString *shape = nil;
  switch (type) {
    case ZGEffectsOnlyMosaicTypeRectangle:
      shape = @"四边形";
      break;
    case ZGEffectsOnlyMosaicTypeTriangle:
      shape = @"三角形";
      break;
    case ZGEffectsOnlyMosaicTypeHexagon:
      shape = @"六边形";
      break;
  }
  return shape;
}

- (ZegoEffectsMosaicType)effectsMosaicTypeForMosaicType:(ZGEffectsOnlyMosaicType)type {
  ZegoEffectsMosaicType effectMosaicType = 0;
  switch (type) {
    case ZGEffectsOnlyMosaicTypeRectangle:
      effectMosaicType = ZegoEffectsMosaicTypeSquare;
      break;
    case ZGEffectsOnlyMosaicTypeTriangle:
      effectMosaicType = ZegoEffectsMosaicTypeTriangle;
      break;
    case ZGEffectsOnlyMosaicTypeHexagon:
      effectMosaicType = ZegoEffectsMosaicTypeHexagon;
      break;
  }
  return effectMosaicType;
}

#pragma mark - Effects Event Handler

- (void)effects:(ZegoEffects *)effects errorCode:(int)errorCode desc:(NSString *)desc {
  if (errorCode != 0) {    
    NSLog(@"[ZGEffectsOnlyEngineManager] onError: %d, desc: %@", errorCode, desc);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSString *msg = [NSString stringWithFormat:@"Effects error:%d\n%@", errorCode, desc];
      [ZegoHudManager showMessage:msg];
    });
  }
}

- (void)effects:(ZegoEffects *)effects faceDetectionResults:(NSArray<ZegoEffectsFaceDetectionResult *> *)results {
    if (self.faceDetectionDelegate && [self.faceDetectionDelegate respondsToSelector:@selector(onFaceDetectionResults:)]) {
        [self.faceDetectionDelegate onFaceDetectionResults:results];
    }
}

@end
