//
//  ZGEffectsOnlyEngineManager+StyleMakeup.h
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/10/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsOnlyEngineManager (StyleMakeup)

// 关闭风格妆
- (void)disableStyleMakeup:(int)intensity;
//眼睑下至
- (void)setEyelid:(int)intensity;
//银河眼妆
- (void)setMilkyEyes:(int)intensity;
//奶凶
- (void)setMilkFierce:(int)intensity;
//纯欲
- (void)setPureDesire:(int)intensity;
//神颜
- (void)setGodyan:(int)intensity;

@end

NS_ASSUME_NONNULL_END
