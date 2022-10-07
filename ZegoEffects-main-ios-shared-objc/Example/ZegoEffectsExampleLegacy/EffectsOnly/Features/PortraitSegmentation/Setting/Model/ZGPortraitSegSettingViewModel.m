//
//  ZGPortraitSegSettingViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitSegSettingViewModel.h"
#import "ZGPortraitBgVmStaticFactory.h"
#import "ZGEffectsOnlyEngineManager+PortraitSeg.h"
#import "ZGPortraitBgViewModel.h"

@interface ZGPortraitSegSettingViewModel ()

@property (nonatomic, strong) ZGEffectsOnlyEngineManager *engine;
@property (nonatomic, strong) ZegoEffectsMosaicParam *mosaicParam;

@property (nonatomic, strong) ZGPortraitBgViewModel *bgViewModel;
 
@end

@implementation ZGPortraitSegSettingViewModel

- (instancetype)init {
  if (self = [super init]) {
    [self setSegmentaionEnabled:YES];
    _mosaicParam = [[ZegoEffectsMosaicParam alloc] init];
    
    ZGPortraitBgMosaicViewModel *bgMosaicVm = (ZGPortraitBgMosaicViewModel *)[[ZGPortraitBgVmStaticFactory shared] bgVmWithType:ZGPortraitBgTypeMosaic];
    _mosaicIndex = bgMosaicVm.mosaicType;
  }
  return self;
}

- (ZGEffectsOnlyEngineManager *)engine {
  return [ZGEffectsOnlyEngineManager shared];
}

- (void)setSegmentaionEnabled:(BOOL)enable {
  _segmentaionEnabled = enable;
  [self.engine enablePortraitSegmentation:enable];
}

- (void)setBgIndex:(NSUInteger)bgIndex {
  _bgIndex = bgIndex;
  ZGPortraitBgViewModel *viewModel = [[ZGPortraitBgVmStaticFactory shared] bgVmWithType:bgIndex];
  self.bgViewModel = viewModel;
  [viewModel enable];
  self.bgSliderValue = viewModel.value;
}

- (void)setMosaicIndex:(NSUInteger)mosaicIndex {
  _mosaicIndex = mosaicIndex;
  ZGPortraitBgMosaicViewModel *viewModel = (ZGPortraitBgMosaicViewModel *)[[ZGPortraitBgVmStaticFactory shared] bgVmWithType:ZGPortraitBgTypeMosaic];
  [viewModel setMosaicType:mosaicIndex];
  if (self.bgIndex == ZGPortraitBgTypeMosaic) {
    self.bgSliderValue = viewModel.value;
  }
}

- (void)setBgSliderValue:(int)bgSliderValue {
  _bgSliderValue = bgSliderValue;
  [self.bgViewModel setValue:bgSliderValue];
  [self.delegate viewModel:self updateBgSliderValue:bgSliderValue];
}

#pragma mark -
- (void)commitForegroundPosition {
  CGFloat x = self.foreX.floatValue;
  CGFloat y = self.foreY.floatValue;
  CGFloat w = self.foreW.floatValue;
  CGFloat h = self.foreH.floatValue;
  CGRect rect = CGRectMake(x, y, w, h);
  
  [[ZGEffectsOnlyEngineManager shared] setPortraitSegmentationForegroundPosition:rect];
}

@end
