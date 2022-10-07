//
//  ZGPortraitMosaicViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGEffectsOnlyEngineManager+PortraitSeg.h"
#import "ZegoEffectOnlyDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGPortraitMosaicViewModel : NSObject

@property (nonatomic, assign) int value;
@property (nonatomic, strong) ZegoEffectsMosaicParam *param;
@property (nonatomic, assign) ZGDemoMosaicType type;  // read-only

- (void)enable;
- (ZegoEffectsMosaicType)effectsMosaicType;
- (ZGDemoMosaicType)portraitMosaicType;

@end

@interface ZGPortraitTriMosaicViewModel : ZGPortraitMosaicViewModel

@end

@interface ZGPortraitRectMosaicViewModel : ZGPortraitMosaicViewModel

@end

@interface ZGPortraitHexoMosaicViewModel : ZGPortraitMosaicViewModel

@end

NS_ASSUME_NONNULL_END
