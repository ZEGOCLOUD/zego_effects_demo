//
//  ZGEffectsOnlyEngineManager+Pendant.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/13.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+Pendant.h"

@implementation ZGEffectsOnlyEngineManager (Pendant)

- (void)disablePendant {
  ZLog(@"设置挂件: 关闭");
  [self.effects setPendant:@""];
}

- (void)enableFairMaiden {
  ZLog(@"设置挂件: 美少女");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantGirl" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableDollMachine {
  ZLog(@"设置挂件: 娃娃机");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantBaby" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableFaceFilm {
  ZLog(@"设置挂件: 炫酷脸膜");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantFacefilm" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableClown {
  ZLog(@"设置挂件: 小丑");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantClown" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableDeer {
  ZLog(@"设置挂件: 小鹿");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantDeer" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableCatHead {
  ZLog(@"设置挂件: 猫头");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantCat" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableThreeAnimals {
  ZLog(@"设置挂件: 三只动物");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantAnimal" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableWatermelon {
  ZLog(@"设置挂件: 西瓜");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantWatermelon" ofType:@"bundle"];
  [self.effects setPendant:path];
}

- (void)enableDivingGoggle {
  ZLog(@"设置挂件: 潜水镜");
  NSString *path = [[NSBundle mainBundle] pathForResource:@"pendantDive" ofType:@"bundle"];
  [self.effects setPendant:path];
}


@end
