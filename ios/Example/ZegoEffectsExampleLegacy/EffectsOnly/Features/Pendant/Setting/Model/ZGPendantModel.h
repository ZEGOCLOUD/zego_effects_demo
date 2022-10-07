//
//  ZGPendantModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/13.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGPendantModel : NSObject

/**
 * 挂件名称
 */
@property (nonatomic, copy) NSString *name;

/**
 * 挂件图标名称
 */
@property (nonatomic, copy) NSString *iconName;

/**
 * 挂件触发方法名
 */
@property (nonatomic, strong) NSString *selectorName;

/**
 * 启用挂件
 */
- (void)activate;

@end

NS_ASSUME_NONNULL_END
