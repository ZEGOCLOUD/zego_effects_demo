//
//  ZGEffectsOnlyEngineManager+ChromaKey.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+ChromaKey.h"

@implementation ZGEffectsOnlyEngineManager (ChromaKey)

- (void)setChromaKeyParam:(ZegoEffectsChromaKeyParam *)param {
  NSString *log = [NSString stringWithFormat:@"颜色容差: %f, 边缘平滑指数: %f, 透明度: %d, 替换颜色: %d, 边缘像素采样半径, %d", param.similarity, param.smoothness, param.opacity, param.keyColor, param.borderSize];
  ZLog(@"设置绿幕参数... %@", log);
  
  [self.effects setChromaKeyParam:param];
}

- (void)setChromaKeyBlurIntensity:(int)blurIntensity {
  ZLog(@"设置绿幕模糊强度: %d", blurIntensity);
  ZegoEffectsBlurParam *param = [[ZegoEffectsBlurParam alloc] init];
  param.intensity = blurIntensity;
  [self.effects setChromaKeyBackgroundBlurParam:param];
}

- (void)enableChromaKey:(BOOL)enable {
  ZLog(@"开启绿幕: %d", enable)
  [self.effects enableChromaKey:enable];
}

- (void)enableChromaKeyBackground:(BOOL)enable {
  ZLog(@"开启绿幕背景: %d", enable);
  [self.effects enableChromaKeyBackground:enable];
}

- (void)setChromaKeyBackgroundPath:(NSString *)path {
  ZLog(@"设置绿幕背景图路径: %@", path);
  [self.effects setChromaKeyBackgroundPath:path mode:ZegoEffectsScaleModeAspectFit];
}

- (void)setChromaKeyForegroundPosition:(CGRect)rect {
  ZLog(@"设置绿幕前景位置: %@", NSStringFromCGRect(rect));
  [self.effects setChromaKeyForegroundPosition:rect];
}

- (void)enableChromaKeyBlur:(BOOL)enable {
  ZLog(@"开启绿幕模糊: %d", enable);
  [self.effects enableChromaKeyBackgroundBlur:enable];
}

- (void)enableChromaKeyBackgroundMosaic:(BOOL)enable {
  ZLog(@"开启绿幕分割背景马赛克: %d", enable);
  [self.effects enableChromaKeyBackgroundMosaic:enable];
}

- (void)setChromaKeyBackgroundMosaicParam:(ZegoEffectsMosaicParam *)param {
  ZLog(@"设置绿幕分割背景马赛克: type: %lu, intensity: %d", (unsigned long)param.type, param.intensity);
  [self.effects setChromaKeyBackgroundMosaicParam:param];
}

@end
