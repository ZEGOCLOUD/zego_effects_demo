//
//  ZegoLicense.h
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZegoLicense : NSObject

@property (nonatomic, copy) NSString *effectsLicense;

+ (instancetype)shared;

- (NSUInteger)appID;
- (NSString *)appSign;

@end

NS_ASSUME_NONNULL_END
