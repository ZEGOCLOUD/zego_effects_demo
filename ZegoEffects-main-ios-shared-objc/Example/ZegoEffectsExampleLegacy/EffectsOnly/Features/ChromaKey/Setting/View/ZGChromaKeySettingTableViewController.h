//
//  ZGChromaKeySettingTableViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/27.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGChromaKeySettingViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGChromaKeySettingTableViewController : UITableViewController

@property (nonatomic, strong) ZGChromaKeySettingViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
