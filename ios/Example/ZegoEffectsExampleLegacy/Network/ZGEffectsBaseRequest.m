//
//  ZegoEffectsBaseRequest.m
//  GoEffectsObjc
//
//  Created by Vic on 2021/8/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsBaseRequest.h"

@implementation ZGEffectsBaseRequest

- (NSString *)baseUrl {
  return @"http://106.14.207.58:8124";
}

- (NSTimeInterval)requestTimeoutInterval {
  return 15.f;
}

@end
