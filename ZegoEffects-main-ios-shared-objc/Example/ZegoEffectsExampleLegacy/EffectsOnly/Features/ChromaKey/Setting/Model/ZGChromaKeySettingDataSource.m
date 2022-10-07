//
//  ZGChromaKeySettingDataSource.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/18.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeySettingDataSource.h"

@implementation ZGChromaKeySettingDataSource

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
