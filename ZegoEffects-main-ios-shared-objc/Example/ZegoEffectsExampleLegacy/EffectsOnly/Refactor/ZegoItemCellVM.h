//
//  ZegoItemCellVM.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZGEffectsOnlyEngineManager+Beauty.h"
#import "ZGEffectsOnlyEngineManager+Filter.h"
#import "ZGEffectsOnlyEngineManager+AdvancedBeauty.h"
#import "ZGEffectsOnlyEngineManager+StyleMakeup.h"

@interface ZegoItemSliderConfig : NSObject

@property (nonatomic, assign) int sliderValue;
@property (nonatomic, assign) int minValue;
@property (nonatomic, assign) int maxValue;

@end

@interface ZegoItemCellVM : NSObject

@property (nonatomic, strong)             ZegoItemCellVM              *forwardingVM;

@property (nonatomic, readonly, strong)   NSObject                    *effectsParam;
@property (nonatomic, readonly, strong)   Class                       paramCls;

@property (nonatomic, readonly, assign)   ZegoItemType                itemType;
@property (nonatomic, readonly, copy)     NSString                    *title;
@property (nonatomic, readonly, copy)     NSArray<ZegoItemCellVM *>   *childrenVMs;
@property (nonatomic, readonly, strong)   ZegoItemSliderConfig        *sliderConfig;
@property (nonatomic, assign)             BOOL                        enable;

- (void)setSliderValue:(int)value;

- (int)sliderValue;

- (void)reset;  //暂未使用

@end

#pragma mark -
#pragma mark - 美颜 - 美肤
@interface ZegoItemSkinSmoothVM : ZegoItemCellVM

@end

@interface ZegoItemSkinWhitenVM : ZegoItemCellVM

@end

@interface ZegoItemSkinSharpenVM : ZegoItemCellVM

@end

@interface ZegoItemSkinRosyVM : ZegoItemCellVM

@end

@interface ZegoItemSkinWrinklesRemovingVM : ZegoItemCellVM

@end

@interface ZegoItemSkinDarkCirclesRemovingVM : ZegoItemCellVM

@end

#pragma mark -
#pragma mark - 美颜 - 美型
@interface ZegoItemShapeFaceLiftingVM : ZegoItemCellVM

@end

@interface ZegoItemShapeBigEyesVM : ZegoItemCellVM

@end

@interface ZegoItemShapeEyesBrighteningVM : ZegoItemCellVM

@end

@interface ZegoItemShapeLongChinVM : ZegoItemCellVM

@end

@interface ZegoItemShapeSmallMouthVM : ZegoItemCellVM

@end

@interface ZegoItemShapeTeethWhiteningVM : ZegoItemCellVM

@end

@interface ZegoItemShapeNoseNarrowingVM : ZegoItemCellVM

@end

@interface ZegoItemShapeNoseLengtheningVM : ZegoItemCellVM

@end

@interface ZegoItemShapeFaceShorteningVM : ZegoItemCellVM

@end

@interface ZegoItemShapeMandibleSlimmingVM : ZegoItemCellVM

@end

@interface ZegoItemShapeCheekboneSlimmingVM : ZegoItemCellVM

@end

@interface ZegoItemShapeForeheadShorteningVM : ZegoItemCellVM

@end

#pragma mark -
#pragma mark - 美颜 - 美妆
#pragma mark 美颜 - 美妆 - 腮红
@interface ZegoItemBlusherBaseVM : ZegoItemCellVM

@end

@interface ZegoItemBlusherNoneVM : ZegoItemCellVM

@end

@interface ZegoItemBlusherDrunkVM : ZegoItemCellVM

@end

@interface ZegoItemBlusherPeachVM : ZegoItemCellVM

@end

@interface ZegoItemBlusherMilkOrangeVM : ZegoItemCellVM

@end

@interface ZegoItemBlusherApricotPinkVM : ZegoItemCellVM

@end

@interface ZegoItemBlusherSweetOrangeVM : ZegoItemCellVM

@end




#pragma mark 美颜 - 美妆 - 眼睫毛
@interface ZegoItemEyelashesBaseVM : ZegoItemCellVM

@end

@interface ZegoItemEyelashesNoneVM : ZegoItemCellVM

@end

@interface ZegoItemEyelashesNaturalVM : ZegoItemCellVM

@end

@interface ZegoItemEyelashesTenderVM : ZegoItemCellVM

@end

@interface ZegoItemEyelashesCurlVM : ZegoItemCellVM

@end

@interface ZegoItemEyelashesSlenderVM : ZegoItemCellVM

@end

@interface ZegoItemEyelashesBushyVM : ZegoItemCellVM

@end


#pragma mark 美颜 - 美妆 - 眼线
@interface ZegoItemEyelinerBaseVM : ZegoItemCellVM

@end

@interface ZegoItemEyelinerNoneVM : ZegoItemCellVM

@end

@interface ZegoItemEyelinerNaturalVM : ZegoItemCellVM

@end

@interface ZegoItemEyelinerWildCatVM : ZegoItemCellVM

@end

@interface ZegoItemEyelinerPrettyVM : ZegoItemCellVM

@end

@interface ZegoItemEyelinerSchemingVM : ZegoItemCellVM

@end

@interface ZegoItemEyelinerTemperamentVM : ZegoItemCellVM

@end

#pragma mark 美颜 - 美妆 - 眼影
@interface ZegoItemEyeshadowBaseVM : ZegoItemCellVM

@end

@interface ZegoItemEyeshadowNoneVM : ZegoItemCellVM

@end

@interface ZegoItemEyeshadowMistPinkVM : ZegoItemCellVM

@end

@interface ZegoItemEyeshadowShimmerPinkVM : ZegoItemCellVM

@end

@interface ZegoItemEyeshadowMochaBrownVM : ZegoItemCellVM

@end

@interface ZegoItemEyeshadowVitalityOrangeVM : ZegoItemCellVM

@end

@interface ZegoItemEyeshadowTeaBrownVM : ZegoItemCellVM

@end

#pragma mark 美颜 - 美妆 - 美瞳
@interface ZegoItemMeiTongBaseVM : ZegoItemCellVM

@end


@interface ZegoItemMeiTongNoneVM : ZegoItemCellVM

@end

@interface ZegoItemMeiTongWaterBlackVM : ZegoItemCellVM

@end

@interface ZegoItemMeiTongSkyBlueVM : ZegoItemCellVM

@end

@interface ZegoItemMeiTongBrownGreenVM : ZegoItemCellVM

@end

@interface ZegoItemMeiTongDifferentPupilVM : ZegoItemCellVM

@end

@interface ZegoItemMeiTongCocoBrownVM : ZegoItemCellVM

@end

#pragma mark 美颜 - 美妆 - 口红
@interface ZegoItemLipStickBaseVM : ZegoItemCellVM

@end

@interface ZegoItemLipStickNoneVM : ZegoItemCellVM

@end

@interface ZegoItemLipStickBeanPinkVM : ZegoItemCellVM

@end

@interface ZegoItemLipStickSweetOrangeVM : ZegoItemCellVM

@end

@interface ZegoItemLipStickRustyRedVM : ZegoItemCellVM

@end

@interface ZegoItemLipStickCoralVM : ZegoItemCellVM

@end

@interface ZegoItemLipStickVelvetRedVM : ZegoItemCellVM

@end


#pragma mark -
#pragma mark - 滤镜

@interface ZegoItemFilterBaseVM : ZegoItemCellVM

@end

@interface ZegoItemFilterNoneVM : ZegoItemCellVM

@end

@interface ZegoItemFilterNatureCreamVM : ZegoItemCellVM

@end

@interface ZegoItemFilterNatureYouthVM : ZegoItemCellVM

@end

@interface ZegoItemFilterNatureFreshVM : ZegoItemCellVM

@end

@interface ZegoItemFilterNatureAkitaVM : ZegoItemCellVM

@end

@interface ZegoItemFilterGrayMonetVM : ZegoItemCellVM

@end

@interface ZegoItemFilterGrayNightVM : ZegoItemCellVM

@end

@interface ZegoItemFilterGrayFilmVM : ZegoItemCellVM

@end

@interface ZegoItemFilterDreamSunsetVM : ZegoItemCellVM

@end

@interface ZegoItemFilterDreamGlazeVM : ZegoItemCellVM

@end

@interface ZegoItemFilterDreamNebulaVM : ZegoItemCellVM

@end

#pragma mark - 风格妆
@interface ZegoItemStyleMakeupBaseVM : ZegoItemCellVM

@end

@interface ZegoItemStyleMakeupNoneVM : ZegoItemCellVM

@end

@interface ZegoItemStyleMakeupEyelidVM : ZegoItemCellVM

@end

@interface ZegoItemStyleMakeupMilkyWayVM : ZegoItemCellVM

@end

@interface ZegoItemStyleMakeupMilkFierceVM : ZegoItemCellVM

@end

@interface ZegoItemStyleMakeupPureDesireVM : ZegoItemCellVM

@end

@interface ZegoItemStyleMakeupGodyanVM : ZegoItemCellVM

@end
