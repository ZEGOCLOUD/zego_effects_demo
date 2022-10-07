//
//  ZGBasicBeautyAdvancedCellViewModel.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/22.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautyAdvancedCellViewModel.h"

@implementation ZGBasicBeautyAdvancedCellViewModel

- (void)buttonOnClick {
  [self.delegate invokeMethodWithName:self.buttonActionName];
}

- (void)activate {
  
}

@end
