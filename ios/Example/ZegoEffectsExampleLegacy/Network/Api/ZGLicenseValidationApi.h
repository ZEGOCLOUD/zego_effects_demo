//
//  ZGLicenseValidationApi.h
//  GoEffectsObjc
//
//  Created by Vic on 2021/8/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGLicenseValidationApi : ZGEffectsBaseRequest

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *authInfo;

@end

NS_ASSUME_NONNULL_END
