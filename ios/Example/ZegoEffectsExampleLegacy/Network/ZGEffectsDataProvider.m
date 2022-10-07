//
//  ZegoEffectsDataProvider.m
//  GoEffectsObjc
//
//  Created by Vic on 2021/8/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsDataProvider.h"
#import "ZGLicenseValidationApi.h"

@implementation ZGEffectsDataProvider

@end


@implementation ZGEffectsDataProvider (Network)

+ (void)requestLicenseWithAppID:(NSString *)appID encryptInfo:(NSString *)encryptInfo complete:(void(^)(NSString *license))complete {
  ZGLicenseValidationApi *api = [[ZGLicenseValidationApi alloc] init];
  api.appId = appID;
  api.authInfo = encryptInfo;
  
  [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
    NSDictionary *dict = request.responseJSONObject;
    NSDictionary *data = dict[@"Data"];
    NSString *license = nil;
    if ([data isKindOfClass:[NSDictionary class]]) {
      license = data[@"License"];
    }
    if (complete) {
      complete(license);
    }
  } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    if (complete) {
      complete(nil);
    }
  }];
}

@end
