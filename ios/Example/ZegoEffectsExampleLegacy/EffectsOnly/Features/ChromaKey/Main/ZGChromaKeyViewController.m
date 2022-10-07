//
//  ZGChromaKeyViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/27.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeyViewController.h"
#import "ZGChromaKeySettingTableViewController.h"
#import "ZGEffectsOnlyEngineManager+ChromaKey.h"
#import "ZGChromaKeySettingDataSource.h"

@implementation ZGChromaKeyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"绿幕分割";
}

- (void)willInitEffect {
  [[ZGEffectsOnlyEngineManager shared] enableChromaKey:YES];
  [[ZGEffectsOnlyEngineManager shared] setChromaKeyBackgroundPath:[[NSBundle mainBundle] pathForResource:@"background_big_sur" ofType:@"jpg"]];
}

- (void)didUninitEffect {
  [[ZGEffectsOnlyEngineManager shared] enableChromaKey:NO];
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBackground:NO];
  [[ZGEffectsOnlyEngineManager shared] enableChromaKeyBlur:NO];
  
  [[ZGChromaKeySettingDataSource shared] removeModelData];
}

#pragma mark - Settings
- (UIViewController *)settingController {
  return [[UIStoryboard storyboardWithName:@"ChromaKey" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ZGChromaKeySettingTableViewController class])];
}

- (void)configureSettingController:(ZGChromaKeySettingTableViewController *)vc {
  ZGChromaKeySettingViewModel *viewModel = [ZGChromaKeySettingDataSource shared].data;
  if (!viewModel) {
    viewModel = [[ZGChromaKeySettingViewModel alloc] init];
    viewModel.resolution = [NSString stringWithFormat:@"%d × %d", (int)self.resolution.width, (int)self.resolution.height];
    [ZGChromaKeySettingDataSource shared].data = viewModel;
  }
  vc.viewModel = viewModel;
}

@end
