//
//  ZGStyleMakeupStttingViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/10/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGStyleMakeupStttingViewController : UIViewController

@property (nonatomic, strong) void(^shouldPopUpActionSheet)(UIAlertController *alert);

@end

NS_ASSUME_NONNULL_END
