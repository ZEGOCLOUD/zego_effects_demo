//
//  ZGChromaKeySettingTableViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/27.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGChromaKeySettingTableViewController.h"
#import "ZegoHudManager.h"
#import "ZGEffectsOnlyEngineManager.h"

@interface ZGChromaKeySettingTableViewController () <ZGChromaKeySettingViewModelProtocol>

@property (weak, nonatomic) IBOutlet UITableViewCell *foregroundCell;

@property (weak, nonatomic) IBOutlet UISwitch *chromaKeySwitch;
@property (weak, nonatomic) IBOutlet UILabel *resolutionLabel;

@property (weak, nonatomic) IBOutlet UITextField *forePositionXTf;
@property (weak, nonatomic) IBOutlet UITextField *forePositionYTf;
@property (weak, nonatomic) IBOutlet UITextField *forePositionWTf;
@property (weak, nonatomic) IBOutlet UITextField *forePositionHTf;

@property (weak, nonatomic) IBOutlet UILabel *similarityLabel;
@property (weak, nonatomic) IBOutlet UISlider *similaritySlider;

@property (weak, nonatomic) IBOutlet UILabel *smoothnessLabel;
@property (weak, nonatomic) IBOutlet UISlider *smoothnessSlider;

@property (weak, nonatomic) IBOutlet UILabel *opacityLabel;
@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;

@property (weak, nonatomic) IBOutlet UILabel *borderSizeLabel;
@property (weak, nonatomic) IBOutlet UISlider *borderSizeSlider;

@property (weak, nonatomic) IBOutlet UILabel *keyColorLabel;
@property (weak, nonatomic) IBOutlet UITextField *keyColorTextField;


@property (weak, nonatomic) IBOutlet UISegmentedControl *bgSeg;
@property (weak, nonatomic) IBOutlet UILabel *backgroundValueLabel;
@property (weak, nonatomic) IBOutlet UISlider *backgroundSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mosaicSeg;


@end

@implementation ZGChromaKeySettingTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setViewModel:self.viewModel];
}

- (void)setViewModel:(ZGChromaKeySettingViewModel *)viewModel {
  _viewModel = viewModel;
  viewModel.delegate = self;
  
  self.chromaKeySwitch.on = viewModel.chromaKeyEnabled;
  self.resolutionLabel.text = viewModel.resolution;
  
  self.forePositionXTf.text = viewModel.foreX;
  self.forePositionYTf.text = viewModel.foreY;
  self.forePositionWTf.text = viewModel.foreW;
  self.forePositionHTf.text = viewModel.foreH;
  
  self.similarityLabel.text = [NSString stringWithFormat:@"Similarity\n%d", viewModel.similarity];
  self.similaritySlider.value = viewModel.similarity;
  
  self.smoothnessLabel.text = [NSString stringWithFormat:@"Smoothness\n%d", viewModel.smoothness];
  self.smoothnessSlider.value = viewModel.smoothness;
  
  self.opacityLabel.text = [NSString stringWithFormat:@"Opacity\n%d", viewModel.opacity];
  self.opacitySlider.value = viewModel.opacity;
  
  self.borderSizeLabel.text = [NSString stringWithFormat:@"BorderSize\n%d", viewModel.borderSize];
  self.borderSizeSlider.value = viewModel.borderSize;
  
  self.keyColorLabel.text = [NSString stringWithFormat:@"KeyColor\n%@", viewModel.keyColorHex];
  self.keyColorTextField.text = viewModel.keyColorHex;
  
  
  self.bgSeg.selectedSegmentIndex = viewModel.bgIndex;
  self.backgroundValueLabel.text = [NSString stringWithFormat:@"%d", viewModel.bgSliderValue];
  self.backgroundSlider.value = viewModel.bgSliderValue;
  self.mosaicSeg.selectedSegmentIndex = viewModel.mosaicIndex;
}

#pragma mark - UI Actions

- (IBAction)chromaKeySwitchValueChanged:(UISwitch *)sender {
  self.viewModel.chromaKeyEnabled = sender.isOn;
}

#pragma mark - Foreground Position
#pragma mark Text Change
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
  [self.forePositionYTf becomeFirstResponder];
}

- (IBAction)foreYReturn:(UITextField *)sender {
  [self.forePositionWTf becomeFirstResponder];
}

- (IBAction)foreWReturn:(UITextField *)sender {
  [self.forePositionHTf becomeFirstResponder];
}

- (IBAction)foreHReturn:(UITextField *)sender {
  NSIndexPath *indexPath = [self.tableView indexPathForCell:self.foregroundCell];
  [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (IBAction)forePositionCommit:(UIButton *)sender {
  [self.viewModel commitForegroundPosition];
}

#pragma mark - Chroma Key Param
- (IBAction)similaritySliderValueChanged:(UISlider *)sender {
  self.similarityLabel.text = [NSString stringWithFormat:@"Similarity\n%d", (int)sender.value];
  self.viewModel.similarity = sender.value;
}

- (IBAction)smoothnessSliderValueChanged:(UISlider *)sender {
  self.smoothnessLabel.text = [NSString stringWithFormat:@"Smoothness\n%d", (int)sender.value];
  self.viewModel.smoothness = sender.value;
}

- (IBAction)opacitySliderValueChanged:(UISlider *)sender {
  self.opacityLabel.text = [NSString stringWithFormat:@"Opacity\n%d", (int)sender.value];
  self.viewModel.opacity = sender.value;
}

- (IBAction)borderSizeSliderValueChanged:(UISlider *)sender {
  self.borderSizeLabel.text = [NSString stringWithFormat:@"BorderSize\n%d", (int)sender.value];
  self.viewModel.borderSize = sender.value;
}

- (IBAction)keyColorTextFieldDidReturn:(UITextField *)sender {
  self.keyColorLabel.text = [NSString stringWithFormat:@"KeyColor\n%@", sender.text];
  self.viewModel.keyColorHex = sender.text;
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

#pragma mark - ViewModel Delegation
- (void)viewModel:(ZGChromaKeySettingViewModel *)viewModel encounterErrorWithMessage:(NSString *)errorMsg {
  [ZegoHudManager showMessage:errorMsg];
}

- (void)viewModel:(ZGChromaKeySettingViewModel *)viewModel updateBgSliderValue:(int)value {
  if (value != self.backgroundSlider.value) {
    self.backgroundSlider.value = value;
  }
  self.backgroundValueLabel.text = [NSString stringWithFormat:@"%d", value];
}

@end
