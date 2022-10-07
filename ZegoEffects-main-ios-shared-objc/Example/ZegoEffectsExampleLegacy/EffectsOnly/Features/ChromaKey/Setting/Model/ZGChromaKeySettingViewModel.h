//
//  ZGChromaKeySettingViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/18.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZGChromaKeySettingViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol ZGChromaKeySettingViewModelProtocol <NSObject>

- (void)viewModel:(ZGChromaKeySettingViewModel *)viewModel encounterErrorWithMessage:(NSString *)errorMsg;

- (void)viewModel:(ZGChromaKeySettingViewModel *)viewModel updateBgSliderValue:(int)value;

@end

@interface ZGChromaKeySettingViewModel : NSObject

@property (nonatomic, weak) id<ZGChromaKeySettingViewModelProtocol> delegate;

@property (nonatomic, assign) BOOL chromaKeyEnabled;
@property (nonatomic, copy) NSString *resolution;

@property (nonatomic, copy) NSString *foreX;
@property (nonatomic, copy) NSString *foreY;
@property (nonatomic, copy) NSString *foreW;
@property (nonatomic, copy) NSString *foreH;

@property (nonatomic, assign) int similarity;
@property (nonatomic, assign) int smoothness;
@property (nonatomic, assign) int opacity;
@property (nonatomic, assign) int borderSize;
@property (nonatomic, copy) NSString *keyColorHex;

@property (nonatomic, assign) NSUInteger bgIndex;
@property (nonatomic, assign) int bgSliderValue;
@property (nonatomic, assign) NSUInteger mosaicIndex;

- (void)commitForegroundPosition;

@end

NS_ASSUME_NONNULL_END
