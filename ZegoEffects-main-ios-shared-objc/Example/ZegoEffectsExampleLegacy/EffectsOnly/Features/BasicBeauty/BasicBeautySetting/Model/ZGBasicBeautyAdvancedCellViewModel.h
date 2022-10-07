//
//  ZGBasicBeautyAdvancedCellViewModel.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/22.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBasicBeautyAdvancedModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZGBasicBeautyAdvancedCellViewModelProtocol <NSObject>

- (void)invokeMethodWithName:(NSString *)actionName;

@end

@interface ZGBasicBeautyAdvancedCellViewModel : NSObject

@property (nonatomic, copy) NSString *buttonTitle;

@property (nonatomic, copy) NSString *featureTitle;

@property (nonatomic, assign) int sliderValue;

@property (nonatomic, copy) NSString *buttonActionName;

@property (nonatomic, copy) NSArray<ZGBasicBeautyAdvancedModel *> *models;

@property (nonatomic, strong) ZGBasicBeautyAdvancedModel *hotModel;

@property (nonatomic, weak) id<ZGBasicBeautyAdvancedCellViewModelProtocol> delegate;

- (void)buttonOnClick;

- (void)activate;

@end

NS_ASSUME_NONNULL_END
