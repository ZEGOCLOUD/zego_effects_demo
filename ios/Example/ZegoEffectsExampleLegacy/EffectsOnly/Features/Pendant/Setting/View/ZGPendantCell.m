//
//  ZGPendantCell.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/13.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPendantCell.h"

@interface ZGPendantCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation ZGPendantCell

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self setupUI];
  }
  return self;
}

- (void)setupUI {
  UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
  [self.contentView addSubview:iconView];
  self.iconView = iconView;
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 60, 15)];
  label.font = [UIFont systemFontOfSize:11];
  label.textAlignment = NSTextAlignmentCenter;
  [self.contentView addSubview:label];
  self.nameLabel = label;
}

- (void)setPendant:(ZGPendantModel *)pendant {
  _pendant = pendant;
  self.nameLabel.text = pendant.name;
  UIImage *image = [UIImage imageNamed:pendant.iconName];
  [self.iconView setImage:image];
}

@end
