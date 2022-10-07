//
//  ZGStyleMakeupViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/10/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGStyleMakeupViewController.h"
#import "ZGStyleMakeupStttingViewController.h"

@interface ZGStyleMakeupViewController ()

@property (nonatomic,strong)ZGStyleMakeupStttingViewController *styleMakeupSettingVC;

@end

@implementation ZGStyleMakeupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"风格妆";
}

- (void)willUninitEffect {
  [[ZGEffectsOnlyEngineManager shared] disableStyleMakeup:0];
}

#pragma mark - Actions

- (UIViewController *)settingController {
  ZGStyleMakeupStttingViewController *vc = self.styleMakeupSettingVC;
  __weak __typeof(self)weakSelf = self;
  vc.shouldPopUpActionSheet = ^(UIAlertController * _Nonnull alert) {
    [weakSelf presentViewController:alert animated:YES completion:nil];
  };
  return vc;
}

- (ZGStyleMakeupStttingViewController *)styleMakeupSettingVC {
  if (!_styleMakeupSettingVC) {
      _styleMakeupSettingVC = [[ZGStyleMakeupStttingViewController alloc] init];
  }
  return _styleMakeupSettingVC;
}

@end
