//
//  ZGEffectsOnlyEngineManager+ChromaKey.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/19.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsOnlyEngineManager (ChromaKey)

/**
 * 设置绿幕参数
 */
- (void)setChromaKeyParam:(ZegoEffectsChromaKeyParam *)param;

/**
 * 设置绿幕模糊强度
 */
- (void)setChromaKeyBlurIntensity:(int)blurIntensity;

/**
 * 开启绿幕
 */
- (void)enableChromaKey:(BOOL)enable;

/**
 * 开启绿幕背景
 */
- (void)enableChromaKeyBackground:(BOOL)enable;

/**
 * 设置绿幕背景图路径
 */
- (void)setChromaKeyBackgroundPath:(NSString *)path;

/**
 * 设置绿幕前景位置
 */
- (void)setChromaKeyForegroundPosition:(CGRect)rect;

/**
 * 开启绿幕模糊
 */
- (void)enableChromaKeyBlur:(BOOL)enable;

/**
 * 开启绿幕分割背景马赛克
 */
- (void)enableChromaKeyBackgroundMosaic:(BOOL)enable;

/**
 * 设置绿幕分割背景马赛克类型
 */
- (void)setChromaKeyBackgroundMosaicParam:(ZegoEffectsMosaicParam *)param;
@end

NS_ASSUME_NONNULL_END
