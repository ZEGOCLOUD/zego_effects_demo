//
//  ZGLicenseValidationApi.m
//  GoEffectsObjc
//
//  Created by Vic on 2021/8/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGLicenseValidationApi.h"

@implementation ZGLicenseValidationApi

- (NSURLRequest *)buildCustomUrlRequest {
  
  NSString *urlString = [NSString stringWithFormat:@"https://aieffects-api.zego.im?Action=DescribeEffectsLicense&AppId=%@&AuthInfo=%@", self.appId, self.authInfo];
  
  NSURL *url = [NSURL URLWithString:urlString];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  return request;
}

@end
