//
//  ZGEffectsOnlyEngineManager+AdvancedBeauty.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/22.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+AdvancedBeauty.h"

@implementation ZGEffectsOnlyEngineManager (AdvancedBeauty)

#pragma mark - 口红

- (void)disableLipstick:(int)intensity {
  ZLog(@"关闭口红");
  [self.effects setLipstick:nil];
}

- (void)setLipstickBeanPink:(int)intensity {
  ZLog(@"开启口红: 豆沙粉");
  [self enableLipstickWithIntensity:intensity bundleName:@"lipstickdir_bean_paste_pink"];
}

- (void)setLipstickCoral:(int)intensity {
  ZLog(@"开启口红: 珊瑚色");
  [self enableLipstickWithIntensity:intensity bundleName:@"lipstickdir_coral"];
}

- (void)setLipstickRustRed:(int)intensity {
  ZLog(@"开启口红: 铁锈红");
  [self enableLipstickWithIntensity:intensity bundleName:@"lipstickdir_rust_red"];
}

- (void)setLipstickSweetOrange:(int)intensity {
  ZLog(@"开启口红: 甜橘色");
  [self enableLipstickWithIntensity:intensity bundleName:@"lipstickdir_sweet_orange"];
}

- (void)setLipstickVelvetRed:(int)intensity {
  ZLog(@"开启口红: 丝绒红");
  [self enableLipstickWithIntensity:intensity bundleName:@"lipstickdir_velvet_red"];
}

- (void)enableLipstickWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
    NSString *bundlePath = [self lipstickPathWithBundleName:bundleName];
    ZegoEffectsLipstickParam *param = [self newLipstickParamWithIntensity:intensity];
    [self.effects setLipstick:bundlePath];
    [self.effects setLipstickParam:param];
}

- (NSString *)lipstickPathWithBundleName:(NSString *)bundleName {
  return [self makeUpBundlePathWithSubDirName:@"lipstickdir" bundleName:bundleName];
}

#pragma mark - 腮红

- (void)disableBlushers:(int)intentsity {
  ZLog(@"关闭腮红");
  [self.effects setBlusher:nil];
}

- (void)setBlushersApricotPink:(int)intentsity {
  ZLog(@"开启腮红：杏粉");
  [self enableBlusherWithIntensity:intentsity bundleName:@"blusherdir_apricot_pink"];
}

- (void)setBlushersMilkOrange:(int)intentsity {
  ZLog(@"开启腮红：奶橘");
  [self enableBlusherWithIntensity:intentsity bundleName:@"blusherdir_milk_orange"];
}

- (void)setBlushersPeach:(int)intentsity {
  ZLog(@"开启腮红：蜜桃");
  [self enableBlusherWithIntensity:intentsity bundleName:@"blusherdir_peach"];
}

- (void)setBlushersSlightlyDrunk:(int)intentsity {
  ZLog(@"开启腮红：微醺");
  [self enableBlusherWithIntensity:intentsity bundleName:@"blusherdir_slightly_drunk"];
}

- (void)setBlushersSweetOrange:(int)intentsity {
  ZLog(@"开启腮红：甜橙");
  [self enableBlusherWithIntensity:intentsity bundleName:@"blusherdir_sweet_orange"];
}

- (void)enableBlusherWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
  NSString *bundlePath = [self blusherPathWithBundleName:bundleName];
  ZegoEffectsBlusherParam *param = [self newBlusherParamWithIntensity:intensity];
  [self.effects setBlusher:bundlePath];
  [self.effects setBlusherParam:param];
}

- (NSString *)blusherPathWithBundleName:(NSString *)bundleName {
  return [self makeUpBundlePathWithSubDirName:@"blusherdir" bundleName:bundleName];
}

#pragma mark - 眼睫毛

- (void)disableEyelash:(int)intensity {
  ZLog(@"关闭眼睫毛");
  [self.effects setEyelashes:nil];
}

- (void)setEyelashBushy:(int)intensity {
  ZLog(@"开启眼睫毛：浓密");
  [self enableEyelashesWithIntensity:intensity bundleName:@"eyelashesdir_bushy"];
}

- (void)setEyelashCurl:(int)intensity {
  ZLog(@"开启眼睫毛：卷翘");
  [self enableEyelashesWithIntensity:intensity bundleName:@"eyelashesdir_curl"];
}

- (void)setEyelashNatural:(int)intensity {
  ZLog(@"开启眼睫毛：自然");
  [self enableEyelashesWithIntensity:intensity bundleName:@"eyelashesdir_natural"];
}

- (void)setEyelashSlender:(int)intensity {
  ZLog(@"开启眼睫毛：纤长");
  [self enableEyelashesWithIntensity:intensity bundleName:@"eyelashesdir_slender"];
}

- (void)setEyelashTender:(int)intensity {
  ZLog(@"开启眼睫毛：温柔");
  [self enableEyelashesWithIntensity:intensity bundleName:@"eyelashesdir_tender"];
}

- (void)enableEyelashesWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
  NSString *bundlePath = [self eyeLashesPathWithBundleName:bundleName];
  ZegoEffectsEyelashesParam *param = [self newEyelashParamWithIntensity:intensity];
  [self.effects setEyelashes:bundlePath];
  [self.effects setEyelashesParam:param];
}

- (NSString *)eyeLashesPathWithBundleName:(NSString *)bundleName {
  return [self makeUpBundlePathWithSubDirName:@"eyelashesdir" bundleName:bundleName];
}

#pragma mark - 眼线

- (void)disableEyeliner:(int)intensity {
  ZLog(@"关闭眼线");
  [self.effects setEyeliner:nil];
}

- (void)setEyelinerNatural:(int)intensity {
  ZLog(@"开启眼线：自然");
  [self enableEyelinerWithIntensity:intensity bundleName:@"eyelinerdir_natural"];
}

- (void)setEyelinerPretty:(int)intensity {
  ZLog(@"开启眼线：俏皮");
  [self enableEyelinerWithIntensity:intensity bundleName:@"eyelinerdir_pretty"];
}

- (void)setEyelinerScheming:(int)intensity {
  ZLog(@"开启眼线：心机");
  [self enableEyelinerWithIntensity:intensity bundleName:@"eyelinerdir_scheming"];
}

- (void)setEyelinerTemperament:(int)intensity {
  ZLog(@"开启眼线：气质");
  [self enableEyelinerWithIntensity:intensity bundleName:@"eyelinerdir_temperament"];
}

- (void)setEyelinerWildcat:(int)intensity {
  ZLog(@"开启眼线：野猫");
  [self enableEyelinerWithIntensity:intensity bundleName:@"eyelinerdir_wildcat"];
}

- (void)enableEyelinerWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
  NSString *bundlePath = [self eyelinerPathWithBundleName:bundleName];
  ZegoEffectsEyelinerParam *param = [self newEyelinerParamWithIntensity:intensity];
  [self.effects setEyeliner:bundlePath];
  [self.effects setEyelinerParam:param];
}

- (NSString *)eyelinerPathWithBundleName:(NSString *)bundleName {
  return [self makeUpBundlePathWithSubDirName:@"eyelinerdir" bundleName:bundleName];
}

#pragma mark - 眼影


- (void)disableEyeshadow:(int)intensity {
  ZLog(@"关闭眼影");
  [self.effects setEyeshadow:nil];
}

- (void)setEyeshadowMistPink:(int)intensity {
  ZLog(@"开启眼影：粉雾海");
  [self enableEyeShadowWithIntensity:intensity bundleName:@"eyeshadowdir_mist_pink"];
}

- (void)setEyeshadowMochaBrown:(int)intensity {
  ZLog(@"开启眼影：摩卡棕");
  [self enableEyeShadowWithIntensity:intensity bundleName:@"eyeshadowdir_mocha_brown"];
}

- (void)setEyeshadowShimmerPink:(int)intensity {
  ZLog(@"开启眼影：微光蜜");
  [self enableEyeShadowWithIntensity:intensity bundleName:@"eyeshadowdir_shimmer_pink"];
}

- (void)setEyeshadowTeaBrown:(int)intensity {
  ZLog(@"开启眼影：暖茶棕");
  [self enableEyeShadowWithIntensity:intensity bundleName:@"eyeshadowdir_tea_brown"];
}

- (void)setEyeshadowVitalityOrange:(int)intensity {
  ZLog(@"开启眼影：元气橙");
  [self enableEyeShadowWithIntensity:intensity bundleName:@"eyeshadowdir_vitality_orange"];
}

- (void)enableEyeShadowWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
  NSString *bundlePath = [self eyeShadowPathWithBundleName:bundleName];
  ZegoEffectsEyeshadowParam *param = [self newEyeShadowParamWithIntensity:intensity];
  [self.effects setEyeshadow:bundlePath];
  [self.effects setEyeshadowParam:param];
}

- (NSString *)eyeShadowPathWithBundleName:(NSString *)bundleName {
  return [self makeUpBundlePathWithSubDirName:@"eyeshadowdir" bundleName:bundleName];
}

#pragma mark - 美瞳

- (void)disableMeiTong:(int)intensity {
  ZLog(@"关闭美瞳");
  [self.effects setColoredcontacts:nil];
}

- (void)setMeiTongWaterBlack:(int)intensity {
  ZLog(@"开启美瞳：水光黑");
  [self enableMeiTongWithIntensity:intensity bundleName:@"coloredcontactsdir_darknight_black"];
}

- (void)setMeiTongSkyBrown:(int)intensity {
  ZLog(@"开启美瞳：星空蓝");
  [self enableMeiTongWithIntensity:intensity bundleName:@"coloredcontactsdir_starry_blue"];
}

- (void)setMeiTongBrownGreen:(int)intensity {
  ZLog(@"开启美瞳：仙棕绿");
  [self enableMeiTongWithIntensity:intensity bundleName:@"coloredcontactsdir_mystery_brown_green"];
}

- (void)setMeiTongDifferentPupil:(int)intensity {
  ZLog(@"开启美瞳：异瞳棕");
  [self enableMeiTongWithIntensity:intensity bundleName:@"coloredcontactsdir_polar_lights_brown"];
}

- (void)setMeiTongCocoBrown:(int)intensity {
  ZLog(@"开启美瞳：可可棕");
  [self enableMeiTongWithIntensity:intensity bundleName:@"coloredcontactsdir_chocolate_brown"];
}


- (void)enableMeiTongWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
  NSString *bundlePath = [self meiTongPathWithBundleName:bundleName];
  ZegoEffectsColoredcontactsParam *param = [self newMeiTongParamWithIntensity:intensity];
  [self.effects setColoredcontacts:bundlePath];
  [self.effects setColoredcontactsParam:param];
}

- (NSString *)meiTongPathWithBundleName:(NSString *)bundleName {
  return [self makeUpBundlePathWithSubDirName:@"coloredcontactsdir" bundleName:bundleName];
}


#pragma mark - Private
- (NSString *)makeUpBundlePathWithSubDirName:(NSString *)subDirName bundleName:(NSString *)bundleName {
  NSString *folderPath = [[NSBundle mainBundle] pathForResource:@"MakeupResources" ofType:nil];
  NSString *rscPath = [folderPath stringByAppendingPathComponent:subDirName];
  rscPath = [rscPath stringByAppendingPathComponent:bundleName];
  NSString *bundlePath = [NSString stringWithFormat:@"%@.bundle/", rscPath];
  return bundlePath;
}

#pragma mark - Create Param
- (ZegoEffectsLipstickParam *)newLipstickParamWithIntensity:(int)intensity {
  ZegoEffectsLipstickParam *param = [[ZegoEffectsLipstickParam alloc] init];
  param.intensity = intensity;
  return param;
}

- (ZegoEffectsBlusherParam *)newBlusherParamWithIntensity:(int)intensity {
  ZegoEffectsBlusherParam *param = [[ZegoEffectsBlusherParam alloc] init];
  param.intensity = intensity;
  return param;
}

- (ZegoEffectsEyelashesParam *)newEyelashParamWithIntensity:(int)intensity {
  ZegoEffectsEyelashesParam *param = [[ZegoEffectsEyelashesParam alloc] init];
  param.intensity = intensity;
  return param;
}

- (ZegoEffectsEyelinerParam *)newEyelinerParamWithIntensity:(int)intensity {
  ZegoEffectsEyelinerParam *param = [[ZegoEffectsEyelinerParam alloc] init];
  param.intensity = intensity;
  return param;
}

- (ZegoEffectsEyeshadowParam *)newEyeShadowParamWithIntensity:(int)intensity {
  ZegoEffectsEyeshadowParam *param = [[ZegoEffectsEyeshadowParam alloc] init];
  param.intensity = intensity;
  return param;
}

- (ZegoEffectsColoredcontactsParam *)newMeiTongParamWithIntensity:(int)intensity {
  ZegoEffectsColoredcontactsParam *param = [[ZegoEffectsColoredcontactsParam alloc] init];
  param.intensity = intensity;
  return param;
}

@end
