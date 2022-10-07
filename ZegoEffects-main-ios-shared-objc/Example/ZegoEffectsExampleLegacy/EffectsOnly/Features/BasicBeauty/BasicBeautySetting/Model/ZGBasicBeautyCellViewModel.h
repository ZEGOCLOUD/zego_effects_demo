//
//  ZGBasicBeautyCellViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGBasicBeautyConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGBasicBeautyCellViewModel : NSObject

/**
 * 功能名称
 */
@property (nonatomic, copy) NSString *name;

/**
 * 功能是否开启
 */
@property (nonatomic, assign) BOOL enable;

/**
 * 功能强度数值
 */
@property (nonatomic, assign) int intensity;

/**
 * 根据 `ZGBasicBeautyName` 进行初始化
 */
- (instancetype)initWithName:(ZGBasicBeautyName)name;

@end

NS_ASSUME_NONNULL_END
