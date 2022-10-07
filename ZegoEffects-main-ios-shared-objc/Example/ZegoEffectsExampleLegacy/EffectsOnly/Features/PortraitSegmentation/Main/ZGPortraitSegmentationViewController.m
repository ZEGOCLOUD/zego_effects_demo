//
//  ZGPortraitSegmentationViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitSegmentationViewController.h"
#import "ZGPortraitSegmentationSettingTableViewController.h"
#import "ZGEffectsOnlyEngineManager+PortraitSeg.h"
#import "ZGPortraitSegSettingDataSource.h"

@implementation ZGPortraitSegmentationViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"人像分割";
}

- (void)willInitEffect {
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentation:YES];
  [[ZGEffectsOnlyEngineManager shared] setPortraitSegmentationBackgroundPath:[[NSBundle mainBundle] pathForResource:@"background_big_sur" ofType:@"jpg"]];
}

- (void)didUninitEffect {
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentation:NO];
  [[ZGEffectsOnlyEngineManager shared] enablePortraitSegmentationBackground:NO];
 
  [[ZGPortraitSegSettingDataSource shared] removeModelData];
}

#pragma mark - Settings
- (UIViewController *)settingController {
  return [[UIStoryboard storyboardWithName:@"PortraitSegmentation" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ZGPortraitSegmentationSettingTableViewController class])];
}

- (void)configureSettingController:(ZGPortraitSegmentationSettingTableViewController *)vc {
  ZGPortraitSegSettingViewModel *viewModel = [ZGPortraitSegSettingDataSource shared].data;
  if (!viewModel) {
    viewModel = [[ZGPortraitSegSettingViewModel alloc] init];
    viewModel.resolution = [NSString stringWithFormat:@"%d × %d", (int)self.resolution.width, (int)self.resolution.height];
    [ZGPortraitSegSettingDataSource shared].data = viewModel;
  }
  [vc setViewModel:viewModel];
}


@end
