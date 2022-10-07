//
//  ZGPendantViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/13.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPendantViewController.h"
#import "ZGPendantSettingViewController.h"
#import "ZGEffectsOnlyEngineManager+Pendant.h"

@implementation ZGPendantViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.modalPresentationStyle = UIModalPresentationCurrentContext;
  self.providesPresentationContextTransitionStyle = YES;
  self.definesPresentationContext = YES;
  
  self.title = @"贴图挂件";
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
