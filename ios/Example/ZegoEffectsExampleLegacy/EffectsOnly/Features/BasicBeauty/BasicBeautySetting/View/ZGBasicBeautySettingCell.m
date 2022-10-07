//
//  ZGBasicBeautySettingCell.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautySettingCell.h"
#import "ZGBasicBeautyCellViewModel.h"

@interface ZGBasicBeautySettingCell ()

@property (nonatomic, strong) ZGBasicBeautyCellViewModel *viewModel;

@end

@implementation ZGBasicBeautySettingCell

- (void)awakeFromNib {
  [super awakeFromNib];
  
  self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setViewModel:(ZGBasicBeautyCellViewModel *)viewModel {
  _viewModel = viewModel;
  self.nameLabel.text = viewModel.name;
  self.enableSwitch.on = viewModel.enable;
  self.intensityLabel.text = [NSString stringWithFormat:@"%d", (int)viewModel.intensity];
  self.intensitySlider.value = viewModel.intensity;
}

- (IBAction)switchValueChanged:(UISwitch *)sender {
  BOOL isOn = sender.isOn;
  [self.viewModel setEnable:isOn];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
  self.intensityLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
  [self.viewModel setIntensity:sender.value];
}

@end
