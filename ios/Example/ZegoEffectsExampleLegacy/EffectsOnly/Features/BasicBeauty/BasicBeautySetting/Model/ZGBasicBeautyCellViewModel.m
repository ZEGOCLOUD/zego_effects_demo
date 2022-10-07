//
//  ZGBasicBeautyCellViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautyCellViewModel.h"
#import "ZGBasicBeautyParam.h"
#import "ZGBasicBeautyConstants.h"
#import "ZGBasicBeautyDataSource.h"

@interface ZGBasicBeautyCellViewModel ()
@property (nonatomic, strong) ZGBasicBeautyParam *beautyParam;
@end

@implementation ZGBasicBeautyCellViewModel

- (instancetype)initWithName:(ZGBasicBeautyName)name {
  if (self = [super init]) {
    _name = name;
    
    Class Cls = [ZGBasicBeautyDataSource shared].nameToParamClassMap[name];
    ZGBasicBeautyParam *param = [[Cls alloc] init];
    param.enable = YES;
    param.intensity = 50;
    self.beautyParam = param;
  }
  return self;
}

- (void)setBeautyParam:(ZGBasicBeautyParam *)beautyParam {
  _beautyParam = beautyParam;
  self.enable = beautyParam.enable;
  self.intensity = beautyParam.intensity;
}

- (void)setEnable:(BOOL)enable {
  _enable = enable;
  [self.beautyParam setEnable:enable];
}

- (void)setIntensity:(int)intensity {
  _intensity = intensity;
  [self.beautyParam setIntensity:intensity];
  ZLog(@"设置基础美颜: %@ 参数: %@", self.name, self.beautyParam);
}


@end
