//
//  ZGPendantDataSource.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/18.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGPendantModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGPendantDataSource : NSObject

/**
 * 单例对象
 */
+ (instancetype)shared;

/**
 * 获取挂件模型
 */
- (NSArray<ZGPendantModel *> *)pendants;

/**
 * 挂件数量
 */
- (NSUInteger)pendantCount;

@end

NS_ASSUME_NONNULL_END
