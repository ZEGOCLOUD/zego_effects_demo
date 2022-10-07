//
//  ZGFilterSettingViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGFilterSettingViewController : UIViewController

@property (nonatomic, strong) void(^shouldPopUpActionSheet)(UIAlertController *alert);

@end

NS_ASSUME_NONNULL_END
