//
//  ZGFaceDetectionSettingTableViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/30.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFaceDetectionSettingTableViewController.h"
#import "ZGEffectsOnlyEngineManager.h"

@interface ZGFaceDetectionSettingTableViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *enableFaceDetectionSwitch;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ZGFaceDetectionSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
  BOOL enable = [[ZGEffectsOnlyEngineManager shared] isFaceDetectionEnabled];
  self.enableFaceDetectionSwitch.on = enable;
  [self.delegate updateFaceDetactionEnabled:enable];
}

- (IBAction)enableFaceDetectionSwitchValueChanged:(UISwitch *)sender {
  [self.delegate updateFaceDetactionEnabled:sender.isOn];
}

- (IBAction)onHighPfmTimeIntervalChange:(UISlider *)sender {
  self.timeLabel.text = [NSString stringWithFormat:@"%.0fms", sender.value];
  [self.delegate updateHighPfmRenderInterval:sender.value];
}

@end
