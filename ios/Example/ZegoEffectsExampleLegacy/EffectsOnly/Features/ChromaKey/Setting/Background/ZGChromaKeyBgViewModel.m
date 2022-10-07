//
//  ZGChromaKeyBgViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeyBgViewModel.h"
#import "ZGEffectsOnlyEngineManager+ChromaKey.h"
#import "ZGChromaKeyBgVmStaticFactory.h"

@implementation ZGChromaKeyBgViewModel

+ (instancetype)viewModelWithType:(ZGChromaKeyBgType)type {
  Class clazz = [self classWithType:type];
  return [[clazz alloc] init];
}

+ (Class)classWithType:(ZGChromaKeyBgType)type {
  switch (type) {
    case ZGChromaKeyBgTypeNone:
      return ZGChromaKeyBgNoneViewModel.class;
      break;
    case ZGChromaKeyBgTypeImage:
      return ZGChromaKeyBgImageViewModel.class;
      break;
    case ZGChromaKeyBgTypeMosaic:
      return ZGChromaKeyBgMosaicViewModel.class;
      break;
    case ZGChromaKeyBgTypeBlur:
      return ZGChromaKeyBgBlurViewModel.class;
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

@implementation ZGChromaKeyBgNoneViewModel

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBackground:NO];
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBackgroundMosaic:NO];
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBlur:NO];
}

- (void)setValue:(int)value {
  
}

- (int)value {
  return 0;
}

@end

@implementation ZGChromaKeyBgImageViewModel
@synthesize value = _value1;

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBackground:YES];
  [[ZGEffectsOnlyEngineManager shared] setChromaKeyBackgroundPath:[[NSBundle mainBundle] pathForResource:@"background_big_sur" ofType:@"jpg"]];
}

- (void)setValue:(int)value {
  _value1 = value;
}

- (int)value {
  return _value1;
}

@end

@implementation ZGChromaKeyBgBlurViewModel
@synthesize value = _blurValue;

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBlur:YES];
}

- (void)setValue:(int)value {
  _blurValue = value;
  [[ZGEffectsOnlyEngineManager shared] setChromaKeyBlurIntensity:value];
}

- (int)value {
  return _blurValue;
}

@end


@interface ZGChromaKeyBgMosaicViewModel ()

@property (nonatomic, strong) ZGChromaKeyMosaicViewModel *mosaicVm;

@end

@implementation ZGChromaKeyBgMosaicViewModel
@synthesize value = _mosaicValue;

- (instancetype)init {
  if (self = [super init]) {
    self.mosaicType = ZGDemoMosaicTypeRect;
  }
  return self;
}

- (void)enable {
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBackgroundMosaic:YES];
}

- (void)setValue:(int)value {
  self.mosaicVm.value = value;
}

- (int)value {
  return self.mosaicVm.value;
}

- (void)setMosaicType:(ZGDemoMosaicType)mosaicType {
  _mosaicType = mosaicType;
  ZGChromaKeyMosaicViewModel *mosaicVm = [[ZGChromaKeyBgVmStaticFactory shared] mosaicVmWithType:mosaicType];
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
