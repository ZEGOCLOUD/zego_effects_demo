//
//  ZGPortraitSegSettingDataSource.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGPortraitSegSettingViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGPortraitSegSettingDataSource : NSObject

@property (nonatomic, strong, nullable) ZGPortraitSegSettingViewModel *data;

+ (instancetype)shared;

- (void)removeModelData;

@end

NS_ASSUME_NONNULL_END
