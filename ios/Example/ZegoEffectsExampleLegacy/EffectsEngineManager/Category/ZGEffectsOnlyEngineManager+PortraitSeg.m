//
//  ZGEffectsOnlyEngineManager+PortraitSeg.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+PortraitSeg.h"

@implementation ZGEffectsOnlyEngineManager (PortraitSeg)

- (void)enablePortraitSegmentation:(BOOL)enable {
  ZLog(@"开启人像分割: %d", enable);
  [self.effects enablePortraitSegmentation:enable];
}

- (void)enablePortraitSegmentationBackground:(BOOL)enable {
  ZLog(@"开启人像分割背景: %d", enable);
  [self.effects enablePortraitSegmentationBackground:enable];
}

- (void)setPortraitSegmentationBackgroundPath:(NSString *)path {
  ZLog(@"设置人像分割背景路径: %@", path);
  [self.effects setPortraitSegmentationBackgroundPath:path mode:ZegoEffectsScaleModeAspectFit];
}

- (void)setPortraitSegmentationForegroundPosition:(CGRect)rect {
  ZLog(@"设置人像分割前景位置: %@", NSStringFromCGRect(rect));
  [self.effects setPortraitSegmentationForegroundPosition:rect];
}

- (void)enablePortraitSegmentationBlur:(BOOL)enable {
  ZLog(@"开启人像分割背景模糊功能: %d", enable);
  [self.effects enablePortraitSegmentationBackgroundBlur:enable];
}

- (void)setPortraitSegmentationBlurIntensity:(int)intensity {
  ZLog(@"设置人像分割模糊强度: %d", intensity);
  ZegoEffectsBlurParam *param = [[ZegoEffectsBlurParam alloc] init];
  param.intensity = intensity;
  [self.effects setPortraitSegmentationBackgroundBlurParam:param];
}

- (void)enableProtraitSegBackgroundMosaic:(BOOL)enable {
  ZLog(@"开启人像分割背景马赛克: %d", enable);
  [self.effects enablePortraitSegmentationBackgroundMosaic:enable];
}

- (void)setPortraitSegBackgroundMosaicParam:(ZegoEffectsMosaicParam *)param {
  ZLog(@"设置马赛克参数: type: %lu, intensity: %d", (unsigned long)param.type, param.intensity);
  [self.effects setPortraitSegmentationBackgroundMosaicParam:param];
}

@end
