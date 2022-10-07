//
//  ZGEffectsOnlyEngineManager+Beauty.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsOnlyEngineManager (Beauty)


#pragma mark -
#pragma mark - SKIN

#pragma mark Smooth

/// 开启磨皮
- (void)enableSmooth:(BOOL)enable;

/// 设置磨皮参数
- (void)setSmoothParam:(ZegoEffectsSmoothParam *)param;

#pragma mark Whiten

/// 开启美白
- (void)enableWhiten:(BOOL)enable;

/// 设置美白参数
- (void)setWhitenParam:(ZegoEffectsWhitenParam *)param;

#pragma mark Sharpen

/// 开启锐化
- (void)enableSharpen:(BOOL)enable;

/// 设置锐化参数
- (void)setSharpenParam:(ZegoEffectsSharpenParam *)param;

#pragma mark Rosy

/// 开启红润
- (void)enableRosy:(BOOL)enable;

/// 设置红润参数
- (void)setRosyParam:(ZegoEffectsRosyParam *)param;

#pragma mark Dark Circles Removing

/// 开启去除黑眼圈
- (void)enableDarkCirclesRemoving:(BOOL)enable;

/// 设置去除黑眼圈参数
- (void)setDarkCirclesRemovingParam:(ZegoEffectsDarkCirclesRemovingParam *)param;

#pragma mark Wrinkles Removing

/// 开启去除法令纹
- (void)enableWrinklesRemoving:(BOOL)enable;

/// 设置去除法令纹参数
- (void)setWrinklesRemovingParam:(ZegoEffectsWrinklesRemovingParam *)param;





#pragma mark -
#pragma mark - SHAPE

#pragma mark Face Lifting

/// 开启瘦脸
- (void)enableFaceLifting:(BOOL)enable;

/// 设置瘦脸参数
- (void)setFaceLiftingParam:(ZegoEffectsFaceLiftingParam *)param;

#pragma mark Big Eyes

/// 开启大眼
- (void)enableBigEyes:(BOOL)enable;

/// 设置大眼参数
- (void)setBigEyesParam:(ZegoEffectsBigEyesParam *)param;

#pragma mark Small Mouth

/// 开启小嘴
- (void)enableSmallMouth:(BOOL)enable;

/// 设置小嘴参数
- (void)setSmallMouthParam:(ZegoEffectsSmallMouthParam *)param;

#pragma mark Long Chin

/// 开启长下巴
- (void)enableLongChin:(BOOL)enable;

/// 设置长下巴参数
- (void)setLongChinParam:(ZegoEffectsLongChinParam *)param;

#pragma mark Nose Narrowing

/// 开启瘦鼻
- (void)enableNoseNarrowing:(BOOL)enable;

/// 设置瘦鼻参数
- (void)setNoseNarrowingParam:(ZegoEffectsNoseNarrowingParam *)param;

#pragma mark Teeth Whitening

/// 开启白牙
- (void)enableTeethWhitening:(BOOL)enable;

/// 设置白牙参数
- (void)setTeethWhiteningParam:(ZegoEffectsTeethWhiteningParam *)param;

#pragma mark Eye Brightening

/// 开启亮眼
- (void)enableEyesBrightening:(BOOL)enable;

/// 设置亮眼参数
- (void)setEyesBrighteningParam:(ZegoEffectsEyesBrighteningParam *)param;

#pragma mark Forehead Shortening

/// 开启缩额头
- (void)enableForeheadShortening:(BOOL)enable;

/// 设置缩额头参数
- (void)setForeheadShorteningParam:(ZegoEffectsForeheadShorteningParam *)param;

#pragma mark Mandible Slimming

/// 开启瘦下颌骨
- (void)enableMandibleSlimming:(BOOL)enable;

/// 设置瘦下颌骨参数
- (void)setMandibleSlimmingParam:(ZegoEffectsMandibleSlimmingParam *)param;

#pragma mark Cheekbone Slimming

/// 开启瘦颧骨
- (void)enableCheekboneSlimming:(BOOL)enable;

/// 设置瘦颧骨参数
- (void)setCheekboneSlimmingParam:(ZegoEffectsCheekboneSlimmingParam *)param;

#pragma mark Face Shortening

/// 开启小脸
- (void)enableFaceShortening:(BOOL)enable;

/// 设置小脸参数
- (void)setFaceShorteningParam:(ZegoEffectsFaceShorteningParam *)param;

#pragma mark Nose Lengthening

/// 开启长鼻
- (void)enableNoseLengthening:(BOOL)enable;

/// 设置长鼻参数
- (void)setNoseLengtheningParam:(ZegoEffectsNoseLengtheningParam *)param;


@end

NS_ASSUME_NONNULL_END
