//
//  ZGFilterModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFilterModel.h"
#import "ZGEffectsOnlyEngineManager+Filter.h"

@implementation ZGFilterModel

- (void)activate:(int)intensity {
  SEL selector = NSSelectorFromString(self.selectorName);
  id target = ZGEffectsOnlyEngineManager.shared;
  IMP imp = [target methodForSelector:selector];
  void (*func)(id, SEL, int) = (void *)imp;
  func(target, selector, intensity);
}

@end
