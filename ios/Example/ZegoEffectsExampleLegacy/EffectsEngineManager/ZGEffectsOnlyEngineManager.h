//
//  ZGEffectsOnlyEngineManager.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZegoEffects/ZegoEffects.h>

typedef NS_ENUM(NSUInteger, ZGEffectsOnlyMosaicType) {
  ZGEffectsOnlyMosaicTypeRectangle  = 0,
  ZGEffectsOnlyMosaicTypeTriangle   = 1,
  ZGEffectsOnlyMosaicTypeHexagon    = 2
};

NS_ASSUME_NONNULL_BEGIN

/// Relay effects onError callback
@protocol ZGEffectsErrorDelegate <NSObject>
- (void)onError:(int)errorCode desc:(NSString *)desc;
@end

/// Relay effects onFaceDetectionResults callback
@protocol ZGEffectsFaceDetectionDelegate <NSObject>
- (void)onFaceDetectionResults:(NSArray<ZegoEffectsFaceDetectionResult *> *)results;
@end

@interface ZGEffectsOnlyEngineManager : NSObject

@property (nonatomic, strong, nullable) ZegoEffects *effects;

#pragma mark - Main

+ (ZGEffectsOnlyEngineManager *)shared;

- (void)createEffectsWithConfig:(nullable ZegoEffectsAdvancedConfig *)config;

- (void)destroyEffects;

- (void)setErrorDelegate:(nullable id<ZGEffectsErrorDelegate>)delegate;

- (void)setFaceDetectionDelegate:(nullable id<ZGEffectsFaceDetectionDelegate>)delegate;

- (void)initEnv:(CGSize)size;

- (void)uninitEnv;

#pragma mark - Process

/// In-place processing
- (void)processImageBuffer:(CVPixelBufferRef)buffer;

#pragma mark - FaceDetection

@property (nonatomic, assign, readonly) BOOL isFaceDetectionEnabled;

- (void)enableFaceDetection:(BOOL)enable;

#pragma mark - Mosaic

- (NSString *)mosaicShapeForMosaicType:(ZGEffectsOnlyMosaicType)type;

- (ZegoEffectsMosaicType)effectsMosaicTypeForMosaicType:(ZGEffectsOnlyMosaicType)type;

@end

NS_ASSUME_NONNULL_END
