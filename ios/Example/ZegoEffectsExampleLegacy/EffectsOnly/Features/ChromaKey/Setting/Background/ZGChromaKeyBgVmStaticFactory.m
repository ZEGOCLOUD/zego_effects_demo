//
//  ZGChromaKeyBgVmStaticFactory.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeyBgVmStaticFactory.h"

@interface ZGChromaKeyBgVmStaticFactory ()

@property (nonatomic, strong) ZGChromaKeyBgNoneViewModel *noneVm;
@property (nonatomic, strong) ZGChromaKeyBgImageViewModel *imageVm;
@property (nonatomic, strong) ZGChromaKeyBgBlurViewModel *blurVm;
@property (nonatomic, strong) ZGChromaKeyBgMosaicViewModel *mosaicVm;

@property (nonatomic, strong) ZGChromaKeyTriMosaicViewModel *triMosaic;
@property (nonatomic, strong) ZGChromaKeyRectMosaicViewModel *rectMosaic;
@property (nonatomic, strong) ZGChromaKeyHexoMosaicViewModel *hexoMosaic;

@end

@implementation ZGChromaKeyBgVmStaticFactory

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static id _instance;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (ZGChromaKeyBgViewModel *)bgVmWithType:(ZGChromaKeyBgType)type {
  switch (type) {
    case ZGChromaKeyBgTypeNone:
      return self.noneVm;
      break;
    case ZGChromaKeyBgTypeImage:
      return self.imageVm;
      break;
    case ZGChromaKeyBgTypeBlur:
      return self.blurVm;
      break;
    case ZGChromaKeyBgTypeMosaic:
      return self.mosaicVm;
      break;
  }
}

- (ZGChromaKeyBgNoneViewModel *)noneVm {
  if (!_noneVm) {
    _noneVm = [[ZGChromaKeyBgNoneViewModel alloc] init];
  }
  return _noneVm;
}

- (ZGChromaKeyBgImageViewModel *)imageVm {
  if (!_imageVm) {
    _imageVm = [[ZGChromaKeyBgImageViewModel alloc] init];
  }
  return _imageVm;
}

- (ZGChromaKeyBgBlurViewModel *)blurVm {
  if (!_blurVm) {
    _blurVm = [[ZGChromaKeyBgBlurViewModel alloc] init];
  }
  return _blurVm;
}

- (ZGChromaKeyBgMosaicViewModel *)mosaicVm {
  if (!_mosaicVm) {
    _mosaicVm = [[ZGChromaKeyBgMosaicViewModel alloc] init];
  }
  return _mosaicVm;
}

#pragma mark - Mosaic

- (ZGChromaKeyMosaicViewModel *)mosaicVmWithType:(ZGDemoMosaicType)type {
  switch (type) {
    case ZGDemoMosaicTypeTri:
      return self.triMosaic;
      break;
    case ZGDemoMosaicTypeRect:
      return self.rectMosaic;
      break;
    case ZGDemoMosaicTypeHexo:
      return self.hexoMosaic;
      break;
  }
}

- (ZGChromaKeyTriMosaicViewModel *)triMosaic {
  if (!_triMosaic) {
    _triMosaic = [[ZGChromaKeyTriMosaicViewModel alloc] init];
  }
  return _triMosaic;
}

- (ZGChromaKeyRectMosaicViewModel *)rectMosaic {
  if (!_rectMosaic) {
    _rectMosaic = [[ZGChromaKeyRectMosaicViewModel alloc] init];
  }
  return _rectMosaic;
}

- (ZGChromaKeyHexoMosaicViewModel *)hexoMosaic {
  if (!_hexoMosaic) {
    _hexoMosaic = [[ZGChromaKeyHexoMosaicViewModel alloc] init];
  }
  return _hexoMosaic;
}

@end
