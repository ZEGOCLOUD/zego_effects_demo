//
//  ZGFeatureViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGCaptureDeviceCamera.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGFeatureViewController : UIViewController

@property (nonatomic, strong) UIImageView *previewView;
@property (nonatomic, assign) CGSize resolution;
@property (nonatomic, strong) id<ZGCaptureDevice> captureDevice;

@property (nonatomic, assign) NSTimeInterval renderingInterval; // ms


- (void)willInitEffect;
- (void)setupEffect;
- (void)willUninitEffect;
- (void)didUninitEffect;

- (UIViewController *)settingController;
- (void)configureSettingController:(UIViewController *)vc;
- (BOOL)shouldRenderOnInterval;

@end

NS_ASSUME_NONNULL_END
