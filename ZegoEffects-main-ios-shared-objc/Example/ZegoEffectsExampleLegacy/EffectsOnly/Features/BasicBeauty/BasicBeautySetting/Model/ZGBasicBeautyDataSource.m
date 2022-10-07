//
//  ZGBasicBeautyDataStorage.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautyDataSource.h"

@implementation ZGBasicBeautyDataSource

#pragma mark - Public
+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static id _instance;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (NSUInteger)featureCount {
  return self.beautyFeatureNames.count;
}

- (void)removeModelData {
  [self.data removeAllObjects];
  self.data = nil;
}

#pragma mark - Lazy
- (NSArray *)beautyFeatureNames {
  if (!_beautyFeatureNames) {
    _beautyFeatureNames = @[
      ZGBasicBeautyNameWhiten,
      ZGBasicBeautyNameSmooth,
      ZGBasicBeautyNameSharpen,
      ZGBasicBeautyNameRosy,
      ZGBasicBeautyNameBigEyes,
      ZGBasicBeautyNameFaceLifting,
      ZGBasicBeautyNameEyesBrightening,
      ZGBasicBeautyNameThinChin,
      ZGBasicBeautyNameSmallMouth,
      ZGBasicBeautyNameTeethWhitening,
      ZGBasicBeautyNameNoseNarrowing
    ];
  }
  return _beautyFeatureNames;
}

- (NSDictionary *)nameToParamClassMap {
  if (!_nameToParamClassMap) {
    _nameToParamClassMap = @{
      ZGBasicBeautyNameWhiten: ZGBasicBeautyWhitenParam.class,
      ZGBasicBeautyNameSmooth: ZGBasicBeautySmoothParam.class,
      ZGBasicBeautyNameSharpen: ZGBasicBeautySharpenParam.class,
      ZGBasicBeautyNameRosy: ZGBasicBeautyRosyParam.class,
      ZGBasicBeautyNameBigEyes: ZGBasicBeautyBigEyesParam.class,
      ZGBasicBeautyNameFaceLifting: ZGBasicBeautyFaceLiftingParam.class,
      ZGBasicBeautyNameEyesBrightening: ZGBasicBeautyEyesBrighteningParam.class,
      ZGBasicBeautyNameThinChin: ZGBasicBeautyLongChinParam.class,
      ZGBasicBeautyNameSmallMouth: ZGBasicBeautySmallMouthParam.class,
      ZGBasicBeautyNameTeethWhitening: ZGBasicBeautyTeethWhiteningParam.class,
      ZGBasicBeautyNameNoseNarrowing: ZGBasicBeautyNoseNarrowingParam.class,
    };
  }
  return _nameToParamClassMap;
}

@end
