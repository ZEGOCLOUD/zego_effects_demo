//
//  ZGBasicBeautySettingCell.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZGBasicBeautyCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZGBasicBeautySettingCell : UITableViewCell

/**
 * 用于展示基础美颜功能名称
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/**
 * 用于控制基础美颜功能是否开启
 */
@property (weak, nonatomic) IBOutlet UISwitch *enableSwitch;

/**
 * 用于展示基础美颜功能当前强度
 */
@property (weak, nonatomic) IBOutlet UILabel *intensityLabel;

/**
 * 用于调节基础美颜功能强度
 */
@property (weak, nonatomic) IBOutlet UISlider *intensitySlider;

/**
 * 设置 cell 视图的 ViewModel
 */
- (void)setViewModel:(ZGBasicBeautyCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
