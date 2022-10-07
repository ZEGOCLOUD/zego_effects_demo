//
//  ZGBasicBeautyDataStorage.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBasicBeautyConstants.h"
#import "ZGBasicBeautyParam.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 基础美颜数据源
 */
@interface ZGBasicBeautyDataSource : NSObject

/**
 * 目前用于存储 cellViewModel, 保存各功能参数
 */
@property (nonatomic, strong, nullable) NSMutableArray *data;

/**
 * 基础美颜所有功能名称数组, 决定了 tableView 中功能 cell 的顺序
 */
@property (nonatomic, copy) NSArray<ZGBasicBeautyName> *beautyFeatureNames;

/**
 * 基础美颜功能名称与 `ZGBasicBeautyParam` 具体类的映射
 */
@property (nonatomic, copy) NSDictionary<ZGBasicBeautyName, Class> *nameToParamClassMap;


+ (instancetype)shared;

/**
 *  基础美颜功能数量
 */
- (NSUInteger)featureCount;

/**
 * 移除 data 数据
 */
- (void)removeModelData;

@end

NS_ASSUME_NONNULL_END
