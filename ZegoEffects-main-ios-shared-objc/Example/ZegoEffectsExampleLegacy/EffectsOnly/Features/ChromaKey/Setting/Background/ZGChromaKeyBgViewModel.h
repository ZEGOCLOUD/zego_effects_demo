//
//  ZGChromaKeyBgViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGChromaKeyMosaicViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZGChromaKeyBgType) {
  ZGChromaKeyBgTypeNone,
  ZGChromaKeyBgTypeImage,
  ZGChromaKeyBgTypeBlur,
  ZGChromaKeyBgTypeMosaic,
};

@interface ZGChromaKeyBgViewModel : NSObject

@property (nonatomic, assign) int value;

+ (instancetype)viewModelWithType:(ZGChromaKeyBgType)type;

- (void)enable;
- (void)setValue:(int)value;

@end

@interface ZGChromaKeyBgNoneViewModel : ZGChromaKeyBgViewModel

@end

@interface ZGChromaKeyBgImageViewModel : ZGChromaKeyBgViewModel

@end

@interface ZGChromaKeyBgBlurViewModel : ZGChromaKeyBgViewModel

@end

@interface ZGChromaKeyBgMosaicViewModel : ZGChromaKeyBgViewModel

@property (nonatomic, assign) ZGDemoMosaicType mosaicType;

@end

NS_ASSUME_NONNULL_END
