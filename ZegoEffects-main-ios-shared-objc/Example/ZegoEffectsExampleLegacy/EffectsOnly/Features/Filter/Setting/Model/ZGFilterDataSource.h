//
//  ZGFilterDataSource.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGFilterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGFilterDataSource : NSObject

/**
 * 获取滤镜模型
 */
- (NSArray<ZGFilterModel *> *)filters;

/**
 * 滤镜数量
 */
- (NSUInteger)filterCount;

@end

NS_ASSUME_NONNULL_END
