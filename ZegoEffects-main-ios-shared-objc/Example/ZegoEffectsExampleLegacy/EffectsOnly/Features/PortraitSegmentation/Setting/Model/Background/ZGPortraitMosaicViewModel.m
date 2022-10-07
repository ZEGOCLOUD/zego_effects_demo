//
//  ZGPortraitMosaicViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitMosaicViewModel.h"

@implementation ZGPortraitMosaicViewModel

- (void)enable {
  self.type = [self portraitMosaicType];
  [[ZGEffectsOnlyEngineManager shared] setPortraitSegBackgroundMosaicParam:self.param];
}

- (void)setValue:(int)value {
  _value = value;
  self.param.intensity = value;
  [self enable];
}

- (ZegoEffectsMosaicParam *)param {
  if (!_param) {
    _param = [[ZegoEffectsMosaicParam alloc] init];
    _param.type = [self effectsMosaicType];
  }
  return _param;
}

@end

@implementation ZGPortraitTriMosaicViewModel

- (ZegoEffectsMosaicType)effectsMosaicType {
  return ZegoEffectsMosaicTypeTriangle;
}

- (ZGDemoMosaicType)portraitMosaicType {
  return ZGDemoMosaicTypeTri;
}

@end

@implementation ZGPortraitRectMosaicViewModel

- (ZegoEffectsMosaicType)effectsMosaicType {
  return ZegoEffectsMosaicTypeSquare;
}

- (ZGDemoMosaicType)portraitMosaicType {
  return ZGDemoMosaicTypeRect;
}

@end

@implementation ZGPortraitHexoMosaicViewModel

- (ZegoEffectsMosaicType)effectsMosaicType {
  return ZegoEffectsMosaicTypeHexagon;
}

- (ZGDemoMosaicType)portraitMosaicType {
  return ZGDemoMosaicTypeHexo;
}

@end
