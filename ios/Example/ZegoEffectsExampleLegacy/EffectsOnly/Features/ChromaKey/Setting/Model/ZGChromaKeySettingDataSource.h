//
//  ZGChromaKeySettingDataSource.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/18.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGChromaKeySettingViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGChromaKeySettingDataSource : NSObject

@property (nonatomic, strong, nullable) ZGChromaKeySettingViewModel *data;

+ (instancetype)shared;

- (void)removeModelData;

@end

NS_ASSUME_NONNULL_END
