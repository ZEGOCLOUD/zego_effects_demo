//
//  ZGEffectsOnlyEngineManager+PortraitSeg.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsOnlyEngineManager (PortraitSeg)

/**
 * 开启人像分割
 */
- (void)enablePortraitSegmentation:(BOOL)enable;

/**
 * 开启人像分割背景
 */
- (void)enablePortraitSegmentationBackground:(BOOL)enable;

/**
 * 设置人像分割背景图路径
 */
- (void)setPortraitSegmentationBackgroundPath:(NSString *)path;

/**
 * 设置人像分割前景位置
 */
- (void)setPortraitSegmentationForegroundPosition:(CGRect)rect;

/**
 * 开启人像分割背景模糊功能
 */
- (void)enablePortraitSegmentationBlur:(BOOL)enable;

/**
 * 设置人像分割模糊强度
 */
- (void)setPortraitSegmentationBlurIntensity:(int)intensity;

/**
 * 开启人像分割背景马赛克
 */
- (void)enableProtraitSegBackgroundMosaic:(BOOL)enable;

/**
 * 设置人像分割马赛克类型
 */
- (void)setPortraitSegBackgroundMosaicParam:(ZegoEffectsMosaicParam *)param;

@end

NS_ASSUME_NONNULL_END
