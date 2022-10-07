//
//  ZGHighPfmFaceDetectionVC.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/15.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGHighPfmFaceDetectionVC.h"

@interface ZGHighPfmFaceDetectionVC ()

@end

@implementation ZGHighPfmFaceDetectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.title = @"高性能人脸检测";
}

- (void)setupEffect {
  [super willInitEffect];
  
  ZegoEffectsAdvancedConfig *config = [[ZegoEffectsAdvancedConfig alloc] init];
  [config setAdvancedConfig:@{
    @"performance": @"true",
  }];
  
  self.resolution = CGSizeMake(720, 1280);
  [[ZGEffectsOnlyEngineManager shared] createEffectsWithConfig:config];
  [[ZGEffectsOnlyEngineManager shared] initEnv:self.resolution];
}

- (BOOL)shouldRenderOnInterval {
  return YES;
}

@end
