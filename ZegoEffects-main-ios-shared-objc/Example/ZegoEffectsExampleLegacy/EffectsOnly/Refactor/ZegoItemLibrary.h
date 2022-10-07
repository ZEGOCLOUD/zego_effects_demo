//
//  ZegoItemLibrary.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZegoItemCellVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZegoItemLibrary : NSObject

+ (ZegoItemCellVM *)itemWithItemType:(ZegoItemType)itemType;

+ (void)reset;

@end

NS_ASSUME_NONNULL_END
