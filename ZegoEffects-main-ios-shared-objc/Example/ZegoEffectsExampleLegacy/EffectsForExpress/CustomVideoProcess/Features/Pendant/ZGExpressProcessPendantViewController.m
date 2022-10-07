//
//  ZGExpressProcessPendantViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/7/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGExpressProcessPendantViewController.h"

#import "ZGPendantSettingViewController.h"
#import "ZGEffectsOnlyEngineManager+Pendant.h"

@implementation ZGExpressProcessPendantViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.modalPresentationStyle = UIModalPresentationCurrentContext;
  self.providesPresentationContextTransitionStyle = YES;
  self.definesPresentationContext = YES;
  
  self.title = @"贴图挂件 - custom video process";
}

- (void)willUninitEffect {
  [[ZGEffectsOnlyEngineManager shared] disablePendant];
}

#pragma mark - Actions

- (UIViewController *)settingController {
  UIViewController *vc = [[ZGPendantSettingViewController alloc] init];
  [vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
  return vc;
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
  return UIModalPresentationCurrentContext;
}

@end
