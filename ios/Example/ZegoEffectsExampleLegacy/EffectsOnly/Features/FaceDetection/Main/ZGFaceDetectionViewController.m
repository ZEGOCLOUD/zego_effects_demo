//
//  ZGFaceDetectionViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/30.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFaceDetectionViewController.h"
#import "ZGFaceDetectionSettingTableViewController.h"
#import "ZGEffectsOnlyEngineManager.h"

@interface ZGFaceDetectionViewController ()
<
ZGEffectsFaceDetectionDelegate,
ZGFaceDetectionSettingProtocol
>

@property (nonatomic, strong) CAShapeLayer *faceDetectionLayer;
@end

@implementation ZGFaceDetectionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"人脸检测";
}

- (void)willInitEffect {
  [[ZGEffectsOnlyEngineManager shared] enableFaceDetection:YES];
  [[ZGEffectsOnlyEngineManager shared] setFaceDetectionDelegate:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Add a layer to display face detection result's rectangle
    if (![[self.previewView.layer sublayers] containsObject:self.faceDetectionLayer]) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = [[UIColor clearColor] CGColor];
        layer.strokeColor = [[UIColor orangeColor] CGColor];
        layer.lineWidth = 3.0;
        self.faceDetectionLayer = layer;
        [self.previewView.layer addSublayer:layer];
    }
}

- (void)didUninitEffect {
  [[ZGEffectsOnlyEngineManager shared] setFaceDetectionDelegate:nil];
  [[ZGEffectsOnlyEngineManager shared] enableFaceDetection:NO];
}

#pragma mark - Settings
- (UIViewController *)settingController {
  return [[UIStoryboard storyboardWithName:@"FaceDetection" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ZGFaceDetectionSettingTableViewController class])];;
}

- (void)configureSettingController:(ZGFaceDetectionSettingTableViewController *)vc {
  vc.delegate = self;
}

#pragma mark - ZGFaceDetectionSettingProtocol
- (void)updateFaceDetactionEnabled:(BOOL)enable {
  [[ZGEffectsOnlyEngineManager shared] enableFaceDetection:enable];
  if (!enable) {
    // Clear last result's rectangle
    self.faceDetectionLayer.path = nil;
  }
}

- (void)updateHighPfmRenderInterval:(int)value {
  self.renderingInterval = value;
}

#pragma mark - ZGEffectsFaceDetectionDelegate
- (void)onFaceDetectionResults:(nonnull NSArray<ZegoEffectsFaceDetectionResult *> *)results {
    // MARK: This callback is not on the main thread
    // So if you need to perform some UI operations, please switch to the main thread

    if ([results count] == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.faceDetectionLayer.path = nil;
        });
        return;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        CGSize viewSize = self.previewView.frame.size;
        CGSize bufferSize = self.previewView.image.size;

        CGFloat heightRatio = viewSize.height / bufferSize.height;
        CGFloat widthRatio = viewSize.width / bufferSize.width;

        CGMutablePathRef paths = CGPathCreateMutable();
        for (ZegoEffectsFaceDetectionResult *result in results) {
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(result.rect.origin.x * widthRatio, result.rect.origin.y * heightRatio, result.rect.size.width * widthRatio, result.rect.size.height * heightRatio)];
            CGPathAddPath(paths, NULL, path.CGPath);
        }

        self.faceDetectionLayer.path = paths;
    });
}

@end
