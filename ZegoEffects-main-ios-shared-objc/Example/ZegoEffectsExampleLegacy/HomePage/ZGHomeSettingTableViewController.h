//
//  ZGHomeSettingTableViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/5/7.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGHomeSettingTableViewController : UITableViewController

+ (instancetype)instanceFromStoryboard;

@property (nonatomic, copy) void (^onPresentAPITestPage)(void);

@end

NS_ASSUME_NONNULL_END
