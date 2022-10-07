//
//  ZGExpressCaptureBasicBeautyViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/7/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGExpressCaptureBasicBeautyViewController.h"
#import "ZGBasicBeautySettingController.h"
#import "ZGBasicBeautyDataSource.h"

@implementation ZGExpressCaptureBasicBeautyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"基础美颜 - custom video capture";
}

- (void)willUninitEffect {
  [[ZGBasicBeautyDataSource shared] removeModelData];
}

#pragma mark - Settings
- (UIViewController *)settingController {
  return [[ZGBasicBeautySettingController alloc] init];
}

@end
