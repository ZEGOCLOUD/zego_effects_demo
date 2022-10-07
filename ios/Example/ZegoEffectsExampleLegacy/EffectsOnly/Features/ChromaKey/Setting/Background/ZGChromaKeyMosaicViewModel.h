//
//  ZGChromaKeyMosaicViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGEffectsOnlyEngineManager+ChromaKey.h"
#import "ZegoEffectOnlyDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGChromaKeyMosaicViewModel : NSObject

@property (nonatomic, assign) int value;
@property (nonatomic, strong) ZegoEffectsMosaicParam *param;
@property (nonatomic, assign) ZGDemoMosaicType type;  // read-only

- (void)enable;
- (ZegoEffectsMosaicType)effectsMosaicType;
- (ZGDemoMosaicType)demoMosaicType;

@end

@interface ZGChromaKeyTriMosaicViewModel : ZGChromaKeyMosaicViewModel

@end

@interface ZGChromaKeyRectMosaicViewModel : ZGChromaKeyMosaicViewModel

@end

@interface ZGChromaKeyHexoMosaicViewModel : ZGChromaKeyMosaicViewModel

@end

NS_ASSUME_NONNULL_END
