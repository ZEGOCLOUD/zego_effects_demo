//
//  ZGPortraitSegmentationSettingTableViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/26.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGPortraitSegSettingViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGPortraitSegmentationSettingTableViewController : UITableViewController

- (void)setViewModel:(ZGPortraitSegSettingViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
