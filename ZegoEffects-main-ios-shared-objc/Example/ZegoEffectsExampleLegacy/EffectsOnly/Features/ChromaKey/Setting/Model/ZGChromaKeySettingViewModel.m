//
//  ZGChromaKeySettingViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/18.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeySettingViewModel.h"
#import "ZGChromaKeyBgVmStaticFactory.h"
#import "ZGEffectsOnlyEngineManager+ChromaKey.h"
#import "ZGChromaKeyBgViewModel.h"
//#import <ZegoEffects/ZegoEffects.h>

@interface ZGChromaKeySettingViewModel ()

@property (nonatomic, strong) ZGEffectsOnlyEngineManager *engine;
@property (nonatomic, strong) ZegoEffectsChromaKeyParam *param;
@property (nonatomic, strong) ZegoEffectsMosaicParam *mosaicParam;

@property (nonatomic, strong) ZGChromaKeyBgViewModel *bgViewModel;

@end

@implementation ZGChromaKeySettingViewModel

- (instancetype)init {
  if (self = [super init]) {
    _param = [[ZegoEffectsChromaKeyParam alloc] init];
    _param.similarity = 67;
    _param.smoothness = 80;
    _param.opacity = 100;
    _param.borderSize = 1;
    _param.keyColor = 65280;

    self.chromaKeyEnabled = YES;
    self.similarity = 67;
    self.smoothness = 80;
    self.opacity = 100;
    self.borderSize = 1;
    self.keyColorHex = @"00FF00";
    
    
    _mosaicParam = [[ZegoEffectsMosaicParam alloc] init];
    ZGChromaKeyBgMosaicViewModel *bgMosaicVm = (ZGChromaKeyBgMosaicViewModel *)[[ZGChromaKeyBgVmStaticFactory shared] bgVmWithType:ZGChromaKeyBgTypeMosaic];
    _mosaicIndex = bgMosaicVm.mosaicType;
  }
  return self;
}

- (void)commitForegroundPosition {
  CGFloat x = self.foreX.floatValue;
  CGFloat y = self.foreY.floatValue;
  CGFloat w = self.foreW.floatValue;
  CGFloat h = self.foreH.floatValue;
  CGRect rect = CGRectMake(x, y, w, h);
  
  [self.engine setChromaKeyForegroundPosition:rect];
}

- (ZGEffectsOnlyEngineManager *)engine {
  return [ZGEffectsOnlyEngineManager shared];
}

#pragma mark - Setter
- (void)setChromaKeyEnabled:(BOOL)chromaKeyEnabled {
  _chromaKeyEnabled = chromaKeyEnabled;
  [self.engine enableChromaKey:chromaKeyEnabled];
}

#pragma mark -
- (void)setSimilarity:(int)similarity {
  _similarity = similarity;
  self.param.similarity = similarity;
  [self.engine setChromaKeyParam:self.param];
}

- (void)setSmoothness:(int)smoothness {
  _smoothness = smoothness;
  self.param.smoothness = smoothness;
  [self.engine setChromaKeyParam:self.param];
}

- (void)setOpacity:(int)opacity {
  _opacity = opacity;
  self.param.opacity = opacity;
  [self.engine setChromaKeyParam:self.param];
}

- (void)setKeyColorHex:(NSString *)keyColorHex {
  _keyColorHex = keyColorHex;
  
  unsigned int keyColor;
  NSScanner* scanner = [NSScanner scannerWithString:keyColorHex];
  [scanner scanHexInt:&keyColor];
  if (keyColor < 0 || keyColor >= (256 * 256 * 256)) {
    [self clientObjectHandleErrorWithMessage:@"The key color of ChromaKey only support '000000' ~ 'FFFFFF' (RGB hex string)"];
    return;
  }
  self.param.keyColor = keyColor;
  [self.engine setChromaKeyParam:self.param];
}

#pragma mark - Background

- (void)setBgIndex:(NSUInteger)bgIndex {
  _bgIndex = bgIndex;
  ZGChromaKeyBgViewModel *viewModel = [[ZGChromaKeyBgVmStaticFactory shared] bgVmWithType:bgIndex];
  self.bgViewModel = viewModel;
  [viewModel enable];
  self.bgSliderValue = viewModel.value;
}

- (void)setMosaicIndex:(NSUInteger)mosaicIndex {
  _mosaicIndex = mosaicIndex;
  ZGChromaKeyBgMosaicViewModel *viewModel = (ZGChromaKeyBgMosaicViewModel *)[[ZGChromaKeyBgVmStaticFactory shared] bgVmWithType:ZGChromaKeyBgTypeMosaic];
  [viewModel setMosaicType:mosaicIndex];
  if (self.bgIndex == ZGChromaKeyBgTypeMosaic) {
    self.bgSliderValue = viewModel.value;
  }
}

- (void)setBgSliderValue:(int)bgSliderValue {
  _bgSliderValue = bgSliderValue;
  [self.bgViewModel setValue:bgSliderValue];
  [self.delegate viewModel:self updateBgSliderValue:bgSliderValue];
}


#pragma mark - Delegation
- (void)clientObjectHandleErrorWithMessage:(NSString *)errorMsg {
  if ([self.delegate respondsToSelector:@selector(viewModel:encounterErrorWithMessage:)]) {
    [self.delegate viewModel:self encounterErrorWithMessage:errorMsg];
  }
}

@end
