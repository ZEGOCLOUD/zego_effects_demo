//
//  ZGFilterModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGFilterModel : NSObject

/**
 * 滤镜名称
 */
@property (nonatomic, copy) NSString *name;

/**
 * 滤镜图标名称
 */
@property (nonatomic, copy) NSString *iconName;

/**
 * 滤镜触发方法名
 */
@property (nonatomic, strong) NSString *selectorName;

/**
 * 启用挂件
 */
- (void)activate:(int)intensity;

@end

NS_ASSUME_NONNULL_END
