//
//  ZegoItemCell.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZegoItemCell.h"

@interface ZegoItemCell ()

@property (nonatomic, strong)   UILabel     *titleLabel;
@property (nonatomic, strong)   UIButton    *selectionButton;
@property (nonatomic, strong)   UISwitch    *enableSwitch;

@property (nonatomic, strong)   UISlider    *intensitySlider;
@property (nonatomic, strong)   UILabel     *intensityLabel;
@property (nonatomic, strong)   UILabel     *intensityMinLabel;
@property (nonatomic, strong)   UILabel     *intensityMaxLabel;

@end

@implementation ZegoItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (void)setupUI {
  self.backgroundColor = UIColor.clearColor;
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  
  [self setupSubviews];
}

- (void)setupSubviews {
  UILabel *titleLabel = [[UILabel alloc] init];
  titleLabel.textColor = UIColor.whiteColor;
  self.titleLabel = titleLabel;
  
  UIButton *selectionButton = [[UIButton alloc] init];
  self.selectionButton = selectionButton;
  [selectionButton addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
  [selectionButton setTitle:@"点击选择" forState:UIControlStateNormal];
  [selectionButton setTitleColor:UIColor.systemYellowColor forState:UIControlStateNormal];

  UISwitch *enableSwitch = [[UISwitch alloc] init];
  enableSwitch.backgroundColor = UIColor.redColor;
  enableSwitch.layer.cornerRadius = 16.0;
  self.enableSwitch = enableSwitch;
  [enableSwitch addTarget:self action:@selector(onSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
  
  UISlider *slider = [[UISlider alloc] init];
  [slider addTarget:self action:@selector(onSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
  slider.tintColor = UIColor.whiteColor;
  self.intensitySlider = slider;
  
  UILabel *intensityLabel = [[UILabel alloc] init];
  intensityLabel.textColor = UIColor.whiteColor;
  self.intensityLabel = intensityLabel;
  
  UILabel *intensityMinLabel = [[UILabel alloc] init];
  intensityMinLabel.textColor = UIColor.whiteColor;
  self.intensityMinLabel = intensityMinLabel;
  
  UILabel *intensityMaxLabel = [[UILabel alloc] init];
  intensityMaxLabel.textColor = UIColor.whiteColor;
  self.intensityMaxLabel = intensityMaxLabel;
  
  [self.contentView addSubview:titleLabel];
  [self.contentView addSubview:selectionButton];
  [self.contentView addSubview:enableSwitch];
  [self.contentView addSubview:slider];
  [self.contentView addSubview:intensityLabel];
  [self.contentView addSubview:intensityMinLabel];
  [self.contentView addSubview:intensityMaxLabel];
  
  // Layout
  UIView *contentView = self.contentView;
  
  [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.top.equalTo(contentView).offset(15);
  }];
  
  [intensityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(titleLabel.mas_right).offset(10);
    make.centerY.equalTo(titleLabel);
  }];
  
  [enableSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(titleLabel);
    make.left.equalTo(intensityLabel).offset(50);
  }];
  
  [selectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(contentView).offset(10);
    make.right.equalTo(contentView).inset(10);
  }];
  
  [intensityMinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(contentView).offset(10);
    make.bottom.equalTo(contentView).inset(10);
  }];
  
  [intensityMaxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.right.equalTo(contentView).inset(10);
    make.centerY.equalTo(intensityMinLabel);
  }];
  
  [slider mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(intensityMinLabel.mas_right).offset(10);
    make.right.equalTo(intensityMaxLabel.mas_left).inset(10);
    make.centerY.equalTo(intensityMinLabel);
  }];
}

- (void)setViewModel:(ZegoItemCellVM *)viewModel {
  _viewModel = viewModel;
  [self updateUIWithCellVM:viewModel updateForwarding:NO];
  [self setForwardingVM:viewModel.forwardingVM];
}

- (void)updateUIWithCellVM:(ZegoItemCellVM *)cellVM updateForwarding:(BOOL)forwarding {
  self.titleLabel.text = cellVM.title;
  
  self.enableSwitch.on = cellVM.enable;
  [cellVM setEnable:cellVM.enable];
  
  if (!forwarding) {
    if (cellVM.childrenVMs.count > 0) {
      // 如果是多选 Cell
      self.enableSwitch.hidden = YES;
      self.selectionButton.hidden = NO;
    } else {
      self.enableSwitch.hidden = NO;
      self.selectionButton.hidden = YES;
    }
  }
  
  // Setup slider data
  if (cellVM.sliderConfig) {
    int sliderVal = [cellVM sliderValue];
    int sliderMinVal = cellVM.sliderConfig.minValue;
    int sliderMaxVal = cellVM.sliderConfig.maxValue;
    
    self.intensitySlider.hidden = NO;
    self.intensityLabel.text = [@(sliderVal) stringValue];
    self.intensityMinLabel.text = [@(sliderMinVal) stringValue];
    self.intensityMaxLabel.text = [@(sliderMaxVal) stringValue];
    
    self.intensitySlider.minimumValue = sliderMinVal;
    self.intensitySlider.maximumValue = sliderMaxVal;
    self.intensitySlider.value = sliderVal;
  }
  self.intensitySlider.hidden = !cellVM.sliderConfig;
}

#pragma mark - Public Methods
- (void)setForwardingVM:(ZegoItemCellVM *)cellVM {
  self.viewModel.forwardingVM = cellVM;
  [self updateUIWithCellVM:cellVM updateForwarding:YES];
}

- (void)reset {
  [self.viewModel reset];
}

#pragma mark - UI Actions
- (void)onSwitchValueChanged:(UISwitch *)aSwitch {
  if (self.viewModel.enable == aSwitch.on) {
    return;
  }
  self.viewModel.enable = aSwitch.on;
  [self.viewModel setSliderValue:[self.viewModel sliderValue]];
}

- (void)onSliderValueChanged:(UISlider *)slider {
  if ([@(slider.value) intValue] == [self.viewModel sliderValue]) {
    return;
  }
  [self.viewModel setSliderValue:slider.value];
  self.intensityLabel.text = [NSString stringWithFormat:@"%d", [@(slider.value) intValue]];
}

- (void)onButtonClick {
  [self.delegate cell:self selectItemVMs:self.viewModel.childrenVMs];
}

@end
