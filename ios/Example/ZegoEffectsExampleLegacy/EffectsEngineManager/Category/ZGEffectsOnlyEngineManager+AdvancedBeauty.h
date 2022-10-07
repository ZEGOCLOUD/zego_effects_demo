//
//  ZGEffectsOnlyEngineManager+AdvancedBeauty.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/22.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsOnlyEngineManager (AdvancedBeauty)

#pragma mark - 口红
- (void)disableLipstick:(int)intensity;

- (void)setLipstickBeanPink:(int)intensity;

- (void)setLipstickCoral:(int)intensity;

- (void)setLipstickRustRed:(int)intensity;

- (void)setLipstickSweetOrange:(int)intensity;

- (void)setLipstickVelvetRed:(int)intensity;

#pragma mark - 腮红
- (void)disableBlushers:(int)intentsity;

- (void)setBlushersApricotPink:(int)intentsity;

- (void)setBlushersMilkOrange:(int)intentsity;

- (void)setBlushersPeach:(int)intentsity;

- (void)setBlushersSlightlyDrunk:(int)intentsity;

- (void)setBlushersSweetOrange:(int)intentsity;

#pragma mark - 眼睫毛

- (void)disableEyelash:(int)intensity;

- (void)setEyelashBushy:(int)intensity;

- (void)setEyelashCurl:(int)intensity;

- (void)setEyelashNatural:(int)intensity;

- (void)setEyelashSlender:(int)intensity;

- (void)setEyelashTender:(int)intensity;

#pragma mark - 眼线

- (void)disableEyeliner:(int)intensity;

- (void)setEyelinerNatural:(int)intensity;

- (void)setEyelinerPretty:(int)intensity;

- (void)setEyelinerScheming:(int)intensity;

- (void)setEyelinerTemperament:(int)intensity;

- (void)setEyelinerWildcat:(int)intensity;

#pragma mark - 眼影

- (void)disableEyeshadow:(int)intensity;

- (void)setEyeshadowMistPink:(int)intensity;

- (void)setEyeshadowMochaBrown:(int)intensity;

- (void)setEyeshadowShimmerPink:(int)intensity;

- (void)setEyeshadowTeaBrown:(int)intensity;

- (void)setEyeshadowVitalityOrange:(int)intensity;


#pragma mark - 美瞳

- (void)disableMeiTong:(int)intensity;

- (void)setMeiTongWaterBlack:(int)intensity;

- (void)setMeiTongSkyBrown:(int)intensity;

- (void)setMeiTongBrownGreen:(int)intensity;

- (void)setMeiTongDifferentPupil:(int)intensity;

- (void)setMeiTongCocoBrown:(int)intensity;

@end

NS_ASSUME_NONNULL_END

