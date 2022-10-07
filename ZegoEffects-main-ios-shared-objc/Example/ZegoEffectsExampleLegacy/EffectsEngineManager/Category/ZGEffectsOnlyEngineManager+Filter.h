//
//  ZGEffectsOnlyEngineManager+Filter.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsOnlyEngineManager (Filter)

/**
 * 关闭滤镜
 */
- (void)disableFilter:(int)intensity;

/**
 * 奶油
 */
- (void)enableFilterCream:(int)intensity;

/**
 * 青春
 */
- (void)enableFilterYouth:(int)intensity;

/**
 * 清新
 */
- (void)enableFilterFresh:(int)intensity;

/**
 * 秋田
 */
- (void)enableFilterAkita:(int)intensity;

/**
 * 莫奈
 */
- (void)enableFilterMonet:(int)intensity;

/**
 * 暗夜
 */
- (void)enableFilterNight:(int)intensity;

/**
 * 胶片
 */
- (void)enableFilterFilm:(int)intensity;

/**
 * 落日
 */
- (void)enableFilterSunset:(int)intensity;

/**
 * 琉璃
 */
- (void)enableFilterGlaze:(int)intensity;

/**
 * 星云
 */
- (void)enableFilterNebula:(int)intensity;

@end

NS_ASSUME_NONNULL_END
