//
//  ZGPendantModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/13.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPendantModel.h"
#import "ZGEffectsOnlyEngineManager+Pendant.h"

@implementation ZGPendantModel

- (void)activate {
  /// Here, we can easily invoke corresponding method by calling 'performSelector' method, but complier would complain about memory leak in that case
  /// This is a work around to suppress compiler warning
  /// See details at: https://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
  /* [ZGEffectsOnlyEngineManager.shared performSelector:selector]; */
  SEL selector = NSSelectorFromString(self.selectorName);
  id target = ZGEffectsOnlyEngineManager.shared;
  IMP imp = [target methodForSelector:selector];
  void (*func)(id, SEL) = (void *)imp;
  func(target, selector);
}


@end
