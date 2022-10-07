//
//  ZGBasicBeautyParam.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautyParam.h"
#import "ZGEffectsOnlyEngineManager.h"

@implementation ZGBasicBeautyParam

- (NSString *)description {
  return [NSString stringWithFormat:@"是否开启: %d, 强度: %d", self.enable, self.intensity];
}

@end

/**
 * 美白
 */
@implementation ZGBasicBeautyWhitenParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableWhiten:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsWhitenParam *param = [[ZegoEffectsWhitenParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setWhitenParam:param];
}

@end

/**
 * 磨皮
 */
@implementation ZGBasicBeautySmoothParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableSmooth:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsSmoothParam *param = [[ZegoEffectsSmoothParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setSmoothParam:param];
}

@end

/**
 * 锐化
 */
@implementation ZGBasicBeautySharpenParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableSharpen:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsSharpenParam *param = [[ZegoEffectsSharpenParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setSharpenParam:param];
}

@end

/**
 * 红润
 */
@implementation ZGBasicBeautyRosyParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableRosy:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsRosyParam *param = [[ZegoEffectsRosyParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setRosyParam:param];
}

@end

/**
 * 瘦脸
 */
@implementation ZGBasicBeautyFaceLiftingParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableFaceLifting:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsFaceLiftingParam *param = [[ZegoEffectsFaceLiftingParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setFaceLiftingParam:param];
}

@end

/**
 * 大眼
 */
@implementation ZGBasicBeautyBigEyesParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableBigEyes:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsBigEyesParam *param = [[ZegoEffectsBigEyesParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setBigEyesParam:param];
}

@end

/**
 * 亮眼
 */
@implementation ZGBasicBeautyEyesBrighteningParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableEyesBrightening:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsEyesBrighteningParam *param = [[ZegoEffectsEyesBrighteningParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setEyesBrighteningParam:param];
}

@end

/**
 * 小嘴
 */
@implementation ZGBasicBeautySmallMouthParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableSmallMouth:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsSmallMouthParam *param = [[ZegoEffectsSmallMouthParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setSmallMouthParam:param];
}

@end

/**
 * 收下巴
 */
@implementation ZGBasicBeautyLongChinParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableLongChin:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsLongChinParam *param = [[ZegoEffectsLongChinParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setLongChinParam:param];
}

@end

/**
 * 白牙
 */
@implementation ZGBasicBeautyTeethWhiteningParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableTeethWhitening:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsTeethWhiteningParam *param = [[ZegoEffectsTeethWhiteningParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setTeethWhiteningParam:param];
}

@end

/**
 * 瘦鼻
 */
@implementation ZGBasicBeautyNoseNarrowingParam

- (void)setEnable:(BOOL)enable {
  [super setEnable:enable];
  [[ZGEffectsOnlyEngineManager shared].effects enableNoseNarrowing:enable];
}

- (void)setIntensity:(int)intensity {
  [super setIntensity:intensity];
  ZegoEffectsNoseNarrowingParam *param = [[ZegoEffectsNoseNarrowingParam alloc] init];
  param.intensity = self.intensity;
  [[ZGEffectsOnlyEngineManager shared].effects setNoseNarrowingParam:param];
}

@end
