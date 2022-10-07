//
//  ZGBasicBeautyParam.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 基础美颜桥接参数基类
 */
@interface ZGBasicBeautyParam : NSObject

@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) int intensity;

@end

#pragma mark -
/**
 * 美白
 */
@interface ZGBasicBeautyWhitenParam : ZGBasicBeautyParam

@end

/**
 * 磨皮
 */
@interface ZGBasicBeautySmoothParam : ZGBasicBeautyParam

@end

/**
 * 锐化
 */
@interface ZGBasicBeautySharpenParam : ZGBasicBeautyParam

@end

/**
 * 红润
 */
@interface ZGBasicBeautyRosyParam : ZGBasicBeautyParam

@end

/**
 * 瘦脸
 */
@interface ZGBasicBeautyFaceLiftingParam : ZGBasicBeautyParam

@end

/**
 * 大眼
 */
@interface ZGBasicBeautyBigEyesParam : ZGBasicBeautyParam

@end

/**
 * 亮眼
 */
@interface ZGBasicBeautyEyesBrighteningParam : ZGBasicBeautyParam

@end

/**
 * 小嘴
 */
@interface ZGBasicBeautySmallMouthParam : ZGBasicBeautyParam

@end

/**
 * 收下巴
 */
@interface ZGBasicBeautyLongChinParam : ZGBasicBeautyParam

@end

/**
 * 白牙
 */
@interface ZGBasicBeautyTeethWhiteningParam : ZGBasicBeautyParam

@end

/**
 * 瘦鼻
 */
@interface ZGBasicBeautyNoseNarrowingParam : ZGBasicBeautyParam

@end



NS_ASSUME_NONNULL_END
