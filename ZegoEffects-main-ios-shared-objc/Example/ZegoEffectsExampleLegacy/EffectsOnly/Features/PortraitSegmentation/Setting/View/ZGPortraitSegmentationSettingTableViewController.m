//
//  ZGPortraitSegmentationSettingTableViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/26.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPortraitSegmentationSettingTableViewController.h"
#import "ZegoHudManager.h"
#import "ZGEffectsOnlyEngineManager.h"

@interface ZGPortraitSegmentationSettingTableViewController ()
<
UITextFieldDelegate,
ZGPortraitSegSettingViewModelProtocol
>

@property (weak, nonatomic) IBOutlet UISwitch *portraitSegSwitch;
@property (weak, nonatomic) IBOutlet UILabel *resolutionLabel;

@property (weak, nonatomic) IBOutlet UITableViewCell *foregroundCell;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionX;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionY;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionW;
@property (weak, nonatomic) IBOutlet UITextField *foregroundPositionH;

@property (weak, nonatomic) IBOutlet UISegmentedControl *bgSeg;
@property (weak, nonatomic) IBOutlet UILabel *backgroundValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *backgroundSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mosaicSeg;

@property (nonatomic, strong) ZGPortraitSegSettingViewModel *viewModel;

@end

@implementation ZGPortraitSegmentationSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  [self setViewModel:self.viewModel];
}

- (void)setViewModel:(ZGPortraitSegSettingViewModel *)viewModel {
  _viewModel = viewModel;
  viewModel.delegate = self;
  
  self.portraitSegSwitch.on = viewModel.segmentaionEnabled;
  self.resolutionLabel.text = viewModel.resolution;
  self.foregroundPositionX.text = viewModel.foreX;
  self.foregroundPositionY.text = viewModel.foreY;
  self.foregroundPositionW.text = viewModel.foreW;
  self.foregroundPositionH.text = viewModel.foreH;
  
  self.bgSeg.selectedSegmentIndex = viewModel.bgIndex;
  self.backgroundValueLabel.text = [NSString stringWithFormat:@"%d", viewModel.bgSliderValue];
  self.backgroundSlider.value = viewModel.bgSliderValue;
  self.mosaicSeg.selectedSegmentIndex = viewModel.mosaicIndex;
}

- (IBAction)portraitSegSwitchValueChanged:(UISwitch *)sender {
  self.viewModel.segmentaionEnabled = sender.isOn;
}

#pragma mark - Foreground Position
#pragma mark Text Change
- (IBAction)commitForePosition:(UIButton *)sender {
  [self.viewModel commitForegroundPosition];
}

- (IBAction)foreXTextChanged:(UITextField *)sender {
  self.viewModel.foreX = sender.text;
}

- (IBAction)foreYTextChanged:(UITextField *)sender {
  self.viewModel.foreY = sender.text;
}

- (IBAction)foreWTextChanged:(UITextField *)sender {
  self.viewModel.foreW = sender.text;
}

- (IBAction)foreHTextChanged:(UITextField *)sender {
  self.viewModel.foreH = sender.text;
}
#pragma mark Return Hit

- (IBAction)foreXReturn:(UITextField *)sender {
  [self.foregroundPositionY becomeFirstResponder];
}

- (IBAction)foreYReturn:(UITextField *)sender {
  [self.foregroundPositionW becomeFirstResponder];
}

- (IBAction)foreWReturn:(UITextField *)sender {
  [self.foregroundPositionH becomeFirstResponder];
}

- (IBAction)foreHReturn:(UITextField *)sender {
  NSIndexPath *indexPath = [self.tableView indexPathForCell:self.foregroundCell];
  [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - Portrait Background
- (IBAction)backgroundSegmentValueChanged:(UISegmentedControl *)sender {
  self.viewModel.bgIndex = sender.selectedSegmentIndex;
}

- (IBAction)backgroundSliderValueChanged:(UISlider *)sender {
  self.viewModel.bgSliderValue = (int)sender.value;
}

- (IBAction)mosaicShapeSegmentValueChanged:(UISegmentedControl *)sender {
  self.viewModel.mosaicIndex = sender.selectedSegmentIndex;
}

#pragma mark - Protocol
- (void)viewModel:(ZGPortraitSegSettingViewModel *)viewModel updateBgSliderValue:(int)value {
  if (value != self.backgroundSlider.value) {
    self.backgroundSlider.value = value;
  }
  self.backgroundValueLabel.text = [NSString stringWithFormat:@"%d", value];
}

@end
