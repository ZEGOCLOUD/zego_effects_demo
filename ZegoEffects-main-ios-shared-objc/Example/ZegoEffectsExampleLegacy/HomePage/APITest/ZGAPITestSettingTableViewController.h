//
//  ZGAPITestSettingTableViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/5/7.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGAPITestSettingTableViewController : UITableViewController

@property (nonatomic, assign) CGSize currentResolution;

+ (instancetype)instanceFromStoryboard;

@end

NS_ASSUME_NONNULL_END
