//
//  ZGHomeSettingTableViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/5/7.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGHomeSettingTableViewController.h"
#import "ZegoHudManager.h"
#import "ZegoLicense.h"
#import <ZegoEffects/ZegoEffects.h>

@interface ZGHomeSettingTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *effectsSdkVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *demoVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *demoBuildNumberLabel;
@property (weak, nonatomic) IBOutlet UITextField *licenseTextField;
@property (weak, nonatomic) IBOutlet UILabel *bundleIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *appIDLabel;

@end

@implementation ZGHomeSettingTableViewController

+ (instancetype)instanceFromStoryboard {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:NSStringFromClass([ZGHomeSettingTableViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.effectsSdkVersionLabel.text = [ZegoEffects getVersion];

    self.demoVersionLabel.text = [NSString stringWithFormat:@"Demo Version: %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    self.demoBuildNumberLabel.text = [NSString stringWithFormat:@"Demo Build Number: %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];

  self.bundleIdLabel.text = [NSString stringWithFormat:@"Bundle ID: %@", [[NSBundle mainBundle] bundleIdentifier]];
  self.appIDLabel.text = [NSString stringWithFormat:@"AppID: %lu", [ZegoLicense shared].appID];
}

- (IBAction)onCopySdkVersion:(UIButton *)sender {
    [[UIPasteboard generalPasteboard] setString:[ZegoEffects getVersion]];
    [ZegoHudManager showMessage:@"SDK version has been copied to the pasteboard"];
}

- (IBAction)setLicense:(UIButton *)sender {
  NSString *license = [self.licenseTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  [[ZegoLicense shared] setEffectsLicense:license];
}

- (IBAction)onPresentAPITestViewController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        self.onPresentAPITestPage();
    }];
}

@end
