//
//  ZGFaceDetectionSettingTableViewController.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/30.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZGFaceDetectionSettingProtocol <NSObject>

- (void)updateFaceDetactionEnabled:(BOOL)enable;
- (void)updateHighPfmRenderInterval:(int)value;

@end

@interface ZGFaceDetectionSettingTableViewController : UITableViewController

@property (nonatomic, weak) id<ZGFaceDetectionSettingProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
