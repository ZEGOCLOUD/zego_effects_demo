//
//  ZGHomeViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGHomeViewController.h"
#import "ZGHomeSettingTableViewController.h"
#import "ZGAPITestViewController.h"
#import <ZegoEffects/ZegoEffects.h>

#import "ZegoLicense.h"
#import "ZGEffectsDataProvider.h"
#import "ZegoHudManager.h"


@interface ZGHomeViewController () <UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) UIBarButtonItem *settingButton;

@end

@implementation ZGHomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Setting"] style:UIBarButtonItemStylePlain target:self action:@selector(showSettingController)];
    self.navigationItem.rightBarButtonItem = self.settingButton;
  
  
  [self identifyAuthority]; //申请license
}

- (void)identifyAuthority {
    // Show hud
    [ZegoHudManager showNetworkLoading];
    
    NSUInteger appID = [[ZegoLicense shared] appID];
    NSString *appSign = [[ZegoLicense shared] appSign];
    NSString *encryptInfo = [ZegoEffects getAuthInfo:appSign];
    
    [ZGEffectsDataProvider requestLicenseWithAppID:[NSString stringWithFormat:@"%zd", appID] encryptInfo:encryptInfo complete:^(NSString * _Nonnull license) {
        [ZegoHudManager hideAllHUD];
        
        if (license.length > 0) {
            [ZegoHudManager showMessage:@"License获取成功"];
            ZegoLicense.shared.effectsLicense = license;
        } else {
            [ZegoHudManager showMessage:@"License获取失败"];
        }
    }];
}

- (void)showSettingController {
    ZGHomeSettingTableViewController *vc = [ZGHomeSettingTableViewController instanceFromStoryboard];
    vc.preferredContentSize = CGSizeMake(320.0, 300.0);
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.popoverPresentationController.delegate = self;
    vc.popoverPresentationController.barButtonItem = self.settingButton;
    vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    UINavigationController *navigationVC = self.navigationController;
    vc.onPresentAPITestPage = ^{
        ZGAPITestViewController *vc = [ZGAPITestViewController instanceFromStoryboard];
        [navigationVC pushViewController:vc animated:YES];
    };

    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
