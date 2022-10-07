//
//  ZGChromaKeyMosaicViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeyMosaicViewModel.h"

@implementation ZGChromaKeyMosaicViewModel

- (void)enable {
  self.type = [self demoMosaicType];
  [[ZGEffectsOnlyEngineManager shared] setChromaKeyBackgroundMosaicParam:self.param];
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

@implementation ZGChromaKeyTriMosaicViewModel

- (ZegoEffectsMosaicType)effectsMosaicType {
  return ZegoEffectsMosaicTypeTriangle;
}

- (ZGDemoMosaicType)demoMosaicType {
  return ZGDemoMosaicTypeTri;
}

@end

@implementation ZGChromaKeyRectMosaicViewModel

- (ZegoEffectsMosaicType)effectsMosaicType {
  return ZegoEffectsMosaicTypeSquare;
}

- (ZGDemoMosaicType)demoMosaicType {
  return ZGDemoMosaicTypeRect;
}

@end

@implementation ZGChromaKeyHexoMosaicViewModel

- (ZegoEffectsMosaicType)effectsMosaicType {
  return ZegoEffectsMosaicTypeHexagon;
}

- (ZGDemoMosaicType)demoMosaicType {
  return ZGDemoMosaicTypeHexo;
}

@end
