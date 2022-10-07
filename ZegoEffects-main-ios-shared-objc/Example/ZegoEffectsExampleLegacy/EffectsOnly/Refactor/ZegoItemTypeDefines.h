//
//  ZegoItemTypeDefines.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#ifndef ZegoItemTypeDefines_h
#define ZegoItemTypeDefines_h

typedef NS_ENUM(NSUInteger, ZegoItemType) {
  
  ZegoItemTypeNone,
  
  /*
   美肤
   */
  ZegoItemTypeSkinSmooth,
  ZegoItemTypeSkinWhiten,
  ZegoItemTypeSkinSharpen,
  ZegoItemTypeSkinRosy,
  ZegoItemTypeSkinWrinklesRemoving,
  ZegoItemTypeSkinDarkCirclesRemoving,

  /*
   美型
   */
  ZegoItemTypeShapeFaceLifting,
  ZegoItemTypeShapeBigEyes,
  ZegoItemTypeShapeEyesBrightening,
  ZegoItemTypeShapeLongChin,
  ZegoItemTypeShapeSmallMouth,
  ZegoItemTypeShapeTeethWhitening,
  ZegoItemTypeShapeNoseNarrowing,
  ZegoItemTypeShapeNoseLengthening,
  ZegoItemTypeShapeFaceShortening,
  ZegoItemTypeShapeMandibleSlimming,
  ZegoItemTypeShapeCheekboneSlimming,
  ZegoItemTypeShapeForeheadShortening,
  
  /*
   美妆
   */
  // 美妆-口红-二级
  ZegoItemTypeLipStickBase,
  ZegoItemTypeLipStickNone,
  ZegoItemTypeLipStickBeanPink,
  ZegoItemTypeLipStickSweetOrange,
  ZegoItemTypeLipStickRustyRed,
  ZegoItemTypeLipStickCoral,
  ZegoItemTypeLipStickVelvetRed,

  // 美妆-腮红-二级
  ZegoItemTypeBlusherBase,
  ZegoItemTypeBlusherNone,
  ZegoItemTypeBlusherDrunk,
  ZegoItemTypeBlusherPeach,
  ZegoItemTypeBlusherMilkOrange,
  ZegoItemTypeBlusherApricotPink,
  ZegoItemTypeBlusherSweetOrange,
  
  // 美妆-眼睫毛-二级
  ZegoItemTypeEyelashesBase,
  ZegoItemTypeEyelashesNone,
  ZegoItemTypeEyelashesNatural,
  ZegoItemTypeEyelashesTender,
  ZegoItemTypeEyelashesCurl,
  ZegoItemTypeEyelashesSlender,
  ZegoItemTypeEyelashesBushy,

  // 美妆-眼线-二级
  ZegoItemTypeEyelinerBase,
  ZegoItemTypeEyelinerNone,
  ZegoItemTypeEyelinerNatural,
  ZegoItemTypeEyelinerWildCat,
  ZegoItemTypeEyelinerPretty,
  ZegoItemTypeEyelinerScheming,
  ZegoItemTypeEyelinerTemperament,

  // 美妆-眼影-二级
  ZegoItemTypeEyeshadowBase,
  ZegoItemTypeEyeshadowNone,
  ZegoItemTypeEyeshadowMistPink,
  ZegoItemTypeEyeshadowShimmerPink,
  ZegoItemTypeEyeshadowMochaBrown,
  ZegoItemTypeEyeshadowVitalityOrange,
  ZegoItemTypeEyeshadowTeaBrown,
  
  // 美妆-美瞳-二级
  ZegoItemTypeMeiTongBase,
  ZegoItemTypeMeiTongNone,
  ZegoItemTypeMeiTongWaterBlack,
  ZegoItemTypeMeiTongSkyBlue,
  ZegoItemTypeMeiTongBrownGreen,
  ZegoItemTypeMeiTongDifferentPupil,
  ZegoItemTypeMeiTongCocoBrown,
  
  /*
   滤镜
   */
  ZegoItemTypeFilterBase,
  ZegoItemTypeFilterNone,
  
  // 滤镜-自然
  ZegoItemTypeFilterNatureCream,
  ZegoItemTypeFilterNatureYouth,
  ZegoItemTypeFilterNatureFresh,
  ZegoItemTypeFilterNatureAkita,
  
  // 滤镜-灰调
  ZegoItemTypeFilterGrayMonet,
  ZegoItemTypeFilterGrayNight,
  ZegoItemTypeFilterGrayFilm,
  
  // 滤镜-梦境
  ZegoItemTypeFilterDreamSunset,
  ZegoItemTypeFilterDreamGlaze,
  ZegoItemTypeFilterDreamNebula,
  
  /*
   风格妆
   */
  ZegoItemTypeStyleMakeupBase,
  ZegoItemTypeStyleMakeupNone,
  
  //眼睑下至
  ZegoItemTypeStyleMakeupEyelid,
  //银河眼妆
  ZegoItemTypeStyleMakeupMilkyWay,
  //奶凶
  ZegoItemTypeStyleMakeupMilkFierce,
  //纯欲
  ZegoItemTypeStyleMakeupPureDesire,
  //神颜
  ZegoItemTypeStyleMakeupGodyan,

};


#endif /* ZegoItemTypeDefines_h */
