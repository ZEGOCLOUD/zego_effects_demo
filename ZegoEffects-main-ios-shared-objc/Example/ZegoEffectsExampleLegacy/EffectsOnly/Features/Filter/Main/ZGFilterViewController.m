//
//  ZGFilterViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFilterViewController.h"
#import "ZGFilterSettingViewController.h"
#import "ZGEffectsOnlyEngineManager+Filter.h"

@interface ZGFilterViewController ()

@property (nonatomic, strong) ZGFilterSettingViewController *filterSettingVC;

@end

@implementation ZGFilterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"风格滤镜";
}

- (void)willUninitEffect {
  [[ZGEffectsOnlyEngineManager shared] disableFilter:0];
}

#pragma mark - Actions

- (UIViewController *)settingController {
  ZGFilterSettingViewController *vc = self.filterSettingVC;
  vc.shouldPopUpActionSheet = ^(UIAlertController * _Nonnull alert) {
    [self presentViewController:alert animated:YES completion:nil];
  };
  return vc;
}

- (ZGFilterSettingViewController *)filterSettingVC {
  if (!_filterSettingVC) {
    _filterSettingVC = [[ZGFilterSettingViewController alloc] init];
  }
  return _filterSettingVC;
}


@end
