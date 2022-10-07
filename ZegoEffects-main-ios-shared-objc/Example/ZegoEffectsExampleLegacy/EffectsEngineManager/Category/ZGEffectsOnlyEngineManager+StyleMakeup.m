//
//  ZGEffectsOnlyEngineManager+StyleMakeup.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/10/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+StyleMakeup.h"

@implementation ZGEffectsOnlyEngineManager (StyleMakeup)

- (void)disableStyleMakeup:(int)intensity {
  ZLog(@"关闭风格妆");
  [self.effects setMakeup:nil];
}

- (void)setEyelid:(int)intensity {
  ZLog(@"开启眼睑下至");
  [self enableStyleMakeupWithIntensity:intensity bundleName:@"makeupdir_vulnerable_and_innocenteyes"];
}

- (void)setMilkyEyes:(int)intensity {
  ZLog(@"开启银河眼妆");
  [self enableStyleMakeupWithIntensity:intensity bundleName:@"makeupdir_milky_eyes"];
}

- (void)setMilkFierce:(int)intensity {
  ZLog(@"开启奶凶");
  [self enableStyleMakeupWithIntensity:intensity bundleName:@"makeupdir_cutie_and_cool"];
}

- (void)setPureDesire:(int)intensity {
  ZLog(@"开启纯欲");
  [self enableStyleMakeupWithIntensity:intensity bundleName:@"makeupdir_pure_and_sexy"];
}

- (void)setGodyan:(int)intensity {
  ZLog(@"开启神颜");
  [self enableStyleMakeupWithIntensity:intensity bundleName:@"makeupdir_flawless"];
}

- (void)enableStyleMakeupWithIntensity:(int)intensity bundleName:(NSString *)bundleName {
  NSString *bundlePath = [self styleMakeupPathWithBundleName:bundleName];
  ZegoEffectsMakeupParam *param = [self newStyleMakeupParamWithIntensity:intensity];
  [self.effects setMakeup:bundlePath];
  [self.effects setMakeupParam:param];
}

- (NSString *)styleMakeupPathWithBundleName:(NSString *)bundleName {
  NSString *folderPath = [[NSBundle mainBundle] pathForResource:@"MakeupResources" ofType:nil];
  NSString *rscPath = [folderPath stringByAppendingPathComponent:@"makeupdir"];
  rscPath = [rscPath stringByAppendingPathComponent:bundleName];
  NSString *bundlePath = [NSString stringWithFormat:@"%@.bundle/", rscPath];
  return bundlePath;
}

- (ZegoEffectsMakeupParam *)newStyleMakeupParamWithIntensity:(int)intensity {
  ZegoEffectsMakeupParam *param = [[ZegoEffectsMakeupParam alloc] init];
  param.intensity = intensity;
  return param;
}


@end
