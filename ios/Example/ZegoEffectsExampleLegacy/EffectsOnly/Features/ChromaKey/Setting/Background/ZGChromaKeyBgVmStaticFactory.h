//
//  ZGChromaKeyBgVmStaticFactory.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGChromaKeyBgViewModel.h"
#import "ZGChromaKeyMosaicViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGChromaKeyBgVmStaticFactory : NSObject

+ (instancetype)shared;

- (ZGChromaKeyBgViewModel *)bgVmWithType:(ZGChromaKeyBgType)type;

- (ZGChromaKeyMosaicViewModel *)mosaicVmWithType:(ZGDemoMosaicType)type;


@end

NS_ASSUME_NONNULL_END
