//
//  ZegoLicense.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZegoLicense.h"

@implementation ZegoLicense

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  static id _instance;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

- (NSString *)effectsLicense {
  if (_effectsLicense.length > 0) {
    return _effectsLicense;
  }
  return [self defaultEffectsLicense];
}

/// Apply license from Zego
- (NSString *)defaultEffectsLicense {

// for example:
//    return @"1234567890ABCDEF";
    return @"";
}

- (NSUInteger)appID {
  return 0;
}

- (NSString *)appSign {
  return @"";
}

@end
