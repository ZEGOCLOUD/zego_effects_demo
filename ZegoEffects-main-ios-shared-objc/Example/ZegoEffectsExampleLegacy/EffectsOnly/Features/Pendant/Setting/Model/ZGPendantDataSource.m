//
//  ZGPendantDataSource.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/18.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPendantDataSource.h"
#import "ZGPendantConstants.h"

@interface ZGPendantDataSource ()

/**
 * 挂件名称, 与对应的 icon 名称保持一致
 */
@property (nonatomic, copy) NSArray<ZGPendantName> *pendantNames;

/**
 * 挂件名称对应执行方法名的映射字典
 */
@property (nonatomic, copy) NSDictionary<ZGPendantName, NSString *> *nameToSelectorMap;

/**
 * 挂件模型数组
 */
@property (nonatomic, copy) NSArray<ZGPendantModel *> *pendants;

@end

@implementation ZGPendantDataSource

#pragma mark - Public
+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static id _instance;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (NSUInteger)pendantCount {
  return self.pendantNames.count;
}

- (NSArray<ZGPendantModel *> *)pendants {
  if (!_pendants) {
    NSMutableArray *mArr = [NSMutableArray array];
    for (ZGPendantName name in self.pendantNames) {
      ZGPendantModel *pendant = [[ZGPendantModel alloc] init];
      pendant.name = name;
      pendant.iconName = name;
      pendant.selectorName = self.nameToSelectorMap[name];
      [mArr addObject:pendant];
    }
    _pendants = mArr.copy;
  }
  return _pendants;
}

#pragma mark - Lazy
- (NSArray<ZGPendantName> *)pendantNames {
  if (!_pendantNames) {
    _pendantNames = @[
      ZGPendantNameNone,
      ZGPendantNameFairMaiden,
      ZGPendantNameDollMachine,
      ZGPendantNameFaceFilm,
      ZGPendantNameClown,
      ZGPendantNameDeer,
      ZGPendantNameCatHead,
      ZGPendantNameThreeAnimals,
      ZGPendantNameWatermelon,
      ZGPendantNameDivingGoggle,
    ];
  }
  return _pendantNames;
}

- (NSDictionary<ZGPendantName,NSString *> *)nameToSelectorMap {
  if (!_nameToSelectorMap) {
    _nameToSelectorMap = @{
      ZGPendantNameNone:            @"disablePendant",
      ZGPendantNameFairMaiden:      @"enableFairMaiden",
      ZGPendantNameDollMachine:     @"enableDollMachine",
      ZGPendantNameFaceFilm:        @"enableFaceFilm",
      ZGPendantNameClown:           @"enableClown",
      ZGPendantNameDeer:            @"enableDeer",
      ZGPendantNameCatHead:         @"enableCatHead",
      ZGPendantNameThreeAnimals:    @"enableThreeAnimals",
      ZGPendantNameWatermelon:      @"enableWatermelon",
      ZGPendantNameDivingGoggle:    @"enableDivingGoggle",
    };
  }
  return _nameToSelectorMap;
}



@end
