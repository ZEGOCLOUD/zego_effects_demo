//
//  ZGPortraitBgViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/24.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitBgViewModel.h"
#import "ZGEffectsOnlyEngineManager+PortraitSeg.h"
#import "ZGPortraitBgVmStaticFactory.h"

@implementation ZGPortraitBgViewModel

+ (instancetype)viewModelWithType:(ZGPortraitBgType)type {
  Class clazz = [self classWithType:type];
  return [[clazz alloc] init];
}

+ (Class)classWithType:(ZGPortraitBgType)type {
  switch (type) {
    case ZGPortraitBgTypeNone:
      return ZGPortraitBgNoneViewModel.class;
      break;
    case ZGPortraitBgTypeImage:
      return ZGPortraitBgImageViewModel.class;
      break;
    case ZGPortraitBgTypeMosaic:
      return ZGPortraitBgMosaicViewModel.class;
      break;
    case ZGPortraitBgTypeBlur:
      return ZGPortraitBgBlurViewModel.class;
      break;
  }
}

- (void)enable {
  assert(1);
}

- (void)setValue:(int)value {
  assert(1);
}


@end

@implementation ZGPortraitBgNoneViewModel

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentationBackground:NO];
  [[ZGEffectsOnlyEngineManager shared] enableProtraitSegBackgroundMosaic:NO];
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentationBlur:NO];
}

- (void)setValue:(int)value {
  
}

- (int)value {
  return 0;
}

@end

@implementation ZGPortraitBgImageViewModel
@synthesize value = _value1;

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentationBackground:YES];
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"background_big_sur.jpg" ofType:nil];
  [[ZGEffectsOnlyEngineManager shared] setPortraitSegmentationBackgroundPath:path];
}

- (void)setValue:(int)value {
  _value1 = value;
}

- (int)value {
  return _value1;
}

@end

@implementation ZGPortraitBgBlurViewModel
@synthesize value = _blurValue;

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentationBlur:YES];
}

- (void)setValue:(int)value {
  _blurValue = value;
  [[ZGEffectsOnlyEngineManager shared] setPortraitSegmentationBlurIntensity:value];
}

- (int)value {
  return _blurValue;
}

@end


@interface ZGPortraitBgMosaicViewModel ()

@property (nonatomic, strong) ZGPortraitMosaicViewModel *mosaicVm;

@end

@implementation ZGPortraitBgMosaicViewModel
@synthesize value = _mosaicValue;

- (instancetype)init {
  if (self = [super init]) {
    self.mosaicType = ZGDemoMosaicTypeRect;
  }
  return self;
}

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enableProtraitSegBackgroundMosaic:YES];
}

- (void)setValue:(int)value {
  self.mosaicVm.value = value;
}

- (int)value {
  return self.mosaicVm.value;
}

- (void)setMosaicType:(ZGDemoMosaicType)mosaicType {
  _mosaicType = mosaicType;
  ZGPortraitMosaicViewModel *mosaicVm = [[ZGPortraitBgVmStaticFactory shared] mosaicVmWithType:mosaicType];
  self.mosaicVm = mosaicVm;
  [self.mosaicVm enable];
}

- (ZegoEffectsMosaicType)effectsMosaicTypeFromType:(ZGDemoMosaicType)type {
  switch (type) {
    case ZGDemoMosaicTypeTri:
      return ZegoEffectsMosaicTypeTriangle;
      break;
    case ZGDemoMosaicTypeRect:
      return ZegoEffectsMosaicTypeSquare;
      break;
    case ZGDemoMosaicTypeHexo:
      return ZegoEffectsMosaicTypeHexagon;
      break;
  }
}

@end

