//
//  ZegoEffectsDataProvider.h
//  GoEffectsObjc
//
//  Created by Vic on 2021/8/10.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGEffectsDataProvider : NSObject

@end


@interface ZGEffectsDataProvider (Network)

+ (void)requestLicenseWithAppID:(NSString *)appID
                    encryptInfo:(NSString *)encryptInfo
                       complete:(void(^)(NSString *license))complete;

@end

NS_ASSUME_NONNULL_END
