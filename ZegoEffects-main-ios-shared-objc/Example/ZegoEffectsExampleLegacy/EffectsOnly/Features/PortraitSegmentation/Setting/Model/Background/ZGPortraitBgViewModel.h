//
//  ZGPortraitBgViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/24.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGPortraitMosaicViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZGPortraitBgType) {
  ZGPortraitBgTypeNone,
  ZGPortraitBgTypeImage,
  ZGPortraitBgTypeBlur,
  ZGPortraitBgTypeMosaic,
};

@interface ZGPortraitBgViewModel : NSObject

@property (nonatomic, assign) int value;

+ (instancetype)viewModelWithType:(ZGPortraitBgType)type;

- (void)enable;
- (void)setValue:(int)value;

@end

@interface ZGPortraitBgNoneViewModel : ZGPortraitBgViewModel

@end

@interface ZGPortraitBgImageViewModel : ZGPortraitBgViewModel

@end

@interface ZGPortraitBgBlurViewModel : ZGPortraitBgViewModel

@end

@interface ZGPortraitBgMosaicViewModel : ZGPortraitBgViewModel

@property (nonatomic, assign) ZGDemoMosaicType mosaicType;

@end

NS_ASSUME_NONNULL_END
