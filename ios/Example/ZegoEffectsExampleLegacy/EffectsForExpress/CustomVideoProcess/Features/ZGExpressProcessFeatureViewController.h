//
//  ZGExpressProcessFeatureViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/7/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGCaptureDeviceCamera.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGExpressProcessFeatureViewController : UIViewController

@property (nonatomic, strong) UIView *previewView;
@property (nonatomic, assign) CGSize resolution;
@property (nonatomic, strong) id<ZGCaptureDevice> captureDevice;

- (void)willInitEffect;
- (void)willUninitEffect;
- (void)didUninitEffect;

- (UIViewController *)settingController;
- (UIViewController *)advancedSettingController;
- (void)configureSettingController:(UIViewController *)vc;
- (void)configureAdvancedSettingController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
