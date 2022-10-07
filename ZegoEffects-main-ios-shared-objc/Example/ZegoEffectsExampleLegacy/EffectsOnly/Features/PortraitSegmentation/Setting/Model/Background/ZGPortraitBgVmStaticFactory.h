//
//  ZGPortraitBgVmStaticFactory.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/24.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGPortraitBgViewModel.h"
#import "ZGPortraitMosaicViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGPortraitBgVmStaticFactory : NSObject

+ (instancetype)shared;

- (ZGPortraitBgViewModel *)bgVmWithType:(ZGPortraitBgType)type;

// 给 bgMosaicViewModel 调用
- (ZGPortraitMosaicViewModel *)mosaicVmWithType:(ZGDemoMosaicType)type;

@end

NS_ASSUME_NONNULL_END
