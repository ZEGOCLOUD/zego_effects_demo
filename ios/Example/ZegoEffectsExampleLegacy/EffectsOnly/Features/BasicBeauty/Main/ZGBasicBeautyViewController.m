//
//  ZGBasicBeautyViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/5/1.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautyViewController.h"
#import "ZGBasicBeautySettingController.h"
#import "ZGBasicBeautyDataSource.h"

@implementation ZGBasicBeautyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"基础美颜";
}

- (void)willUninitEffect {
    [[ZGEffectsOnlyEngineManager shared] disableEyelash:0];
    [[ZGEffectsOnlyEngineManager shared] disableBlushers:0];
    [[ZGEffectsOnlyEngineManager shared] disableLipstick:0];
    [[ZGEffectsOnlyEngineManager shared] disableEyeliner:0];
    [[ZGEffectsOnlyEngineManager shared] disableEyeshadow:0];
    [[ZGEffectsOnlyEngineManager shared] disableMeiTong:0];
    [[ZGBasicBeautyDataSource shared] removeModelData];
}

#pragma mark - Settings
- (UIViewController *)settingController {
  return [[ZGBasicBeautySettingController alloc] init];
}


@end
