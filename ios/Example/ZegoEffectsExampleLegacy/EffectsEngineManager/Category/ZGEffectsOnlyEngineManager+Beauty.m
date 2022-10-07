//
//  ZGEffectsOnlyEngineManager+Beauty.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+Beauty.h"

@implementation ZGEffectsOnlyEngineManager (Beauty)

#pragma mark -
#pragma mark - SKIN

#pragma mark Smooth

/// 开启磨皮
- (void)enableSmooth:(BOOL)enable {
  [self.effects enableSmooth:enable];
}

/// 设置磨皮参数
- (void)setSmoothParam:(ZegoEffectsSmoothParam *)param {
  [self.effects setSmoothParam:param];
}

#pragma mark Whiten

/// 开启美白
- (void)enableWhiten:(BOOL)enable {
  [self.effects enableWhiten:enable];
}

/// 设置美白参数
- (void)setWhitenParam:(ZegoEffectsWhitenParam *)param {
  [self.effects setWhitenParam:param];
}

#pragma mark Sharpen

/// 开启锐化
- (void)enableSharpen:(BOOL)enable {
  [self.effects enableSharpen:enable];
}

/// 设置锐化参数
- (void)setSharpenParam:(ZegoEffectsSharpenParam *)param {
  [self.effects setSharpenParam:param];
}

#pragma mark Rosy

/// 开启红润
- (void)enableRosy:(BOOL)enable {
  [self.effects enableRosy:enable];
}

/// 设置红润参数
- (void)setRosyParam:(ZegoEffectsRosyParam *)param {
  [self.effects setRosyParam:param];
}

#pragma mark Dark Circles Removing

/// 开启去除黑眼圈
- (void)enableDarkCirclesRemoving:(BOOL)enable {
  [self.effects enableDarkCirclesRemoving:enable];
}

/// 设置去除黑眼圈参数
- (void)setDarkCirclesRemovingParam:(ZegoEffectsDarkCirclesRemovingParam *)param {
  [self.effects setDarkCirclesRemovingParam:param];
}

#pragma mark Wrinkles Removing

/// 开启去除法令纹
- (void)enableWrinklesRemoving:(BOOL)enable {
  [self.effects enableWrinklesRemoving:enable];
}

/// 设置去除法令纹参数
- (void)setWrinklesRemovingParam:(ZegoEffectsWrinklesRemovingParam *)param {
  [self.effects setWrinklesRemovingParam:param];
}





#pragma mark -
#pragma mark - SHAPE

#pragma mark Face Lifting

/// 开启瘦脸
- (void)enableFaceLifting:(BOOL)enable {
  [self.effects enableFaceLifting:enable];
}

/// 设置瘦脸参数
- (void)setFaceLiftingParam:(ZegoEffectsFaceLiftingParam *)param {
  [self.effects setFaceLiftingParam:param];
}

#pragma mark Big Eyes

/// 开启大眼
- (void)enableBigEyes:(BOOL)enable {
  [self.effects enableBigEyes:enable];
}

/// 设置大眼参数
- (void)setBigEyesParam:(ZegoEffectsBigEyesParam *)param {
  [self.effects setBigEyesParam:param];
}

#pragma mark Small Mouth

/// 开启小嘴
- (void)enableSmallMouth:(BOOL)enable {
  [self.effects enableSmallMouth:enable];
}

/// 设置小嘴参数
- (void)setSmallMouthParam:(ZegoEffectsSmallMouthParam *)param {
  [self.effects setSmallMouthParam:param];
}

#pragma mark Long Chin

/// 开启长下巴
- (void)enableLongChin:(BOOL)enable {
  [self.effects enableLongChin:enable];
}

/// 设置长下巴参数
- (void)setLongChinParam:(ZegoEffectsLongChinParam *)param {
  [self.effects setLongChinParam:param];
}

#pragma mark Nose Narrowing

/// 开启瘦鼻
- (void)enableNoseNarrowing:(BOOL)enable {
  [self.effects enableNoseNarrowing:enable];
}

/// 设置瘦鼻参数
- (void)setNoseNarrowingParam:(ZegoEffectsNoseNarrowingParam *)param {
  [self.effects setNoseNarrowingParam:param];
}

#pragma mark Teeth Whitening

/// 开启白牙
- (void)enableTeethWhitening:(BOOL)enable {
  [self.effects enableTeethWhitening:enable];
}

/// 设置白牙参数
- (void)setTeethWhiteningParam:(ZegoEffectsTeethWhiteningParam *)param {
  [self.effects setTeethWhiteningParam:param];
}

#pragma mark Eye Brightening

/// 开启亮眼
- (void)enableEyesBrightening:(BOOL)enable {
  [self.effects enableEyesBrightening:enable];
}

/// 设置亮眼参数
- (void)setEyesBrighteningParam:(ZegoEffectsEyesBrighteningParam *)param {
  [self.effects setEyesBrighteningParam:param];
}

#pragma mark Forehead Shortening

/// 开启缩额头
- (void)enableForeheadShortening:(BOOL)enable {
  [self.effects enableForeheadShortening:enable];
}

/// 设置缩额头参数
- (void)setForeheadShorteningParam:(ZegoEffectsForeheadShorteningParam *)param {
  [self.effects setForeheadShorteningParam:param];
}

#pragma mark Mandible Slimming

/// 开启瘦下颌骨
- (void)enableMandibleSlimming:(BOOL)enable {
  [self.effects enableMandibleSlimming:enable];
}

/// 设置瘦下颌骨参数
- (void)setMandibleSlimmingParam:(ZegoEffectsMandibleSlimmingParam *)param {
  [self.effects setMandibleSlimmingParam:param];
}

#pragma mark Cheekbone Slimming

/// 开启瘦颧骨
- (void)enableCheekboneSlimming:(BOOL)enable {
  [self.effects enableCheekboneSlimming:enable];
}

/// 设置瘦颧骨参数
- (void)setCheekboneSlimmingParam:(ZegoEffectsCheekboneSlimmingParam *)param {
  [self.effects setCheekboneSlimmingParam:param];
}

#pragma mark Face Shortening

/// 开启小脸
- (void)enableFaceShortening:(BOOL)enable {
  [self.effects enableFaceShortening:enable];
}

/// 设置小脸参数
- (void)setFaceShorteningParam:(ZegoEffectsFaceShorteningParam *)param {
  [self.effects setFaceShorteningParam:param];
}

#pragma mark Nose Lengthening

/// 开启长鼻
- (void)enableNoseLengthening:(BOOL)enable {
  [self.effects enableNoseLengthening:enable];
}

/// 设置长鼻参数
- (void)setNoseLengtheningParam:(ZegoEffectsNoseLengtheningParam *)param {
  [self.effects setNoseLengtheningParam:param];
}

@end
