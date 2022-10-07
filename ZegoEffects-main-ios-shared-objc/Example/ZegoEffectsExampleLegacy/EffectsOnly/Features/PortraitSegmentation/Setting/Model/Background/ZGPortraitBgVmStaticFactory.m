//
//  ZGPortraitBgVmStaticFactory.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/24.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitBgVmStaticFactory.h"

@interface ZGPortraitBgVmStaticFactory ()

@property (nonatomic, strong) ZGPortraitBgNoneViewModel *noneVm;
@property (nonatomic, strong) ZGPortraitBgImageViewModel *imageVm;
@property (nonatomic, strong) ZGPortraitBgBlurViewModel *blurVm;
@property (nonatomic, strong) ZGPortraitBgMosaicViewModel *mosaicVm;

@property (nonatomic, strong) ZGPortraitTriMosaicViewModel *triMosaic;
@property (nonatomic, strong) ZGPortraitRectMosaicViewModel *rectMosaic;
@property (nonatomic, strong) ZGPortraitHexoMosaicViewModel *hexoMosaic;

@end

@implementation ZGPortraitBgVmStaticFactory

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static id _instance;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (ZGPortraitBgViewModel *)bgVmWithType:(ZGPortraitBgType)type {
  switch (type) {
    case ZGPortraitBgTypeNone:
      return self.noneVm;
      break;
    case ZGPortraitBgTypeImage:
      return self.imageVm;
      break;
    case ZGPortraitBgTypeBlur:
      return self.blurVm;
      break;
    case ZGPortraitBgTypeMosaic:
      return self.mosaicVm;
      break;
  }
}

- (ZGPortraitBgNoneViewModel *)noneVm {
  if (!_noneVm) {
    _noneVm = [[ZGPortraitBgNoneViewModel alloc] init];
  }
  return _noneVm;
}

- (ZGPortraitBgImageViewModel *)imageVm {
  if (!_imageVm) {
    _imageVm = [[ZGPortraitBgImageViewModel alloc] init];
  }
  return _imageVm;
}

- (ZGPortraitBgBlurViewModel *)blurVm {
  if (!_blurVm) {
    _blurVm = [[ZGPortraitBgBlurViewModel alloc] init];
  }
  return _blurVm;
}

- (ZGPortraitBgMosaicViewModel *)mosaicVm {
  if (!_mosaicVm) {
    _mosaicVm = [[ZGPortraitBgMosaicViewModel alloc] init];
  }
  return _mosaicVm;
}

#pragma mark - Mosaic

- (ZGPortraitMosaicViewModel *)mosaicVmWithType:(ZGDemoMosaicType)type {
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

- (ZGPortraitTriMosaicViewModel *)triMosaic {
  if (!_triMosaic) {
    _triMosaic = [[ZGPortraitTriMosaicViewModel alloc] init];
  }
  return _triMosaic;
}

- (ZGPortraitRectMosaicViewModel *)rectMosaic {
  if (!_rectMosaic) {
    _rectMosaic = [[ZGPortraitRectMosaicViewModel alloc] init];
  }
  return _rectMosaic;
}

- (ZGPortraitHexoMosaicViewModel *)hexoMosaic {
  if (!_hexoMosaic) {
    _hexoMosaic = [[ZGPortraitHexoMosaicViewModel alloc] init];
  }
  return _hexoMosaic;
}

@end
