//
//  ZGPortraitSegSettingDataSource.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitSegSettingDataSource.h"

@implementation ZGPortraitSegSettingDataSource

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static id _instance;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (void)removeModelData {
  self.data = nil;
}

@end
