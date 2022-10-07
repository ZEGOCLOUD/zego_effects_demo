//
//  ZGPortraitSegSettingViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZGPortraitSegSettingViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol ZGPortraitSegSettingViewModelProtocol

- (void)viewModel:(ZGPortraitSegSettingViewModel *)viewModel encounterErrorWithMessage:(NSString *)errorMsg;

- (void)viewModel:(ZGPortraitSegSettingViewModel *)viewModel updateBgSliderValue:(int)value;

@end


@interface ZGPortraitSegSettingViewModel : NSObject

@property (nonatomic, weak) id<ZGPortraitSegSettingViewModelProtocol> delegate;

@property (nonatomic, assign) BOOL segmentaionEnabled;
@property (nonatomic, copy) NSString *resolution;

@property (nonatomic, copy) NSString *foreX;
@property (nonatomic, copy) NSString *foreY;
@property (nonatomic, copy) NSString *foreW;
@property (nonatomic, copy) NSString *foreH;

@property (nonatomic, assign) NSUInteger bgIndex;
@property (nonatomic, assign) int bgSliderValue;
@property (nonatomic, assign) NSUInteger mosaicIndex;

- (void)commitForegroundPosition;

@end

NS_ASSUME_NONNULL_END
