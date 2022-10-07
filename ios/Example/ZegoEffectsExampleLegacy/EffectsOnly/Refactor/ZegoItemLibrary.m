//
//  ZegoItemLibrary.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZegoItemLibrary.h"

@interface ZegoItemLibrary ()

@property (nonatomic, strong) ZegoItemSkinSmoothVM                *skinSmoothVM;
@property (nonatomic, strong) ZegoItemSkinWhitenVM                *skinWhitenVM;
@property (nonatomic, strong) ZegoItemSkinSharpenVM               *skinSharpenVM;
@property (nonatomic, strong) ZegoItemSkinRosyVM                  *skinRosyVM;
@property (nonatomic, strong) ZegoItemSkinWrinklesRemovingVM      *skinWrinklesRemovingVM;
@property (nonatomic, strong) ZegoItemSkinDarkCirclesRemovingVM   *skinDarkCirclesRemovingVM;

// 美型
@property (nonatomic, strong) ZegoItemShapeFaceLiftingVM          *faceLiftingVM;
@property (nonatomic, strong) ZegoItemShapeBigEyesVM              *bigEyesVM;
@property (nonatomic, strong) ZegoItemShapeEyesBrighteningVM      *eyesBrighteningVM;
@property (nonatomic, strong) ZegoItemShapeLongChinVM             *longChinVM;
@property (nonatomic, strong) ZegoItemShapeSmallMouthVM           *smallMouthVM;
@property (nonatomic, strong) ZegoItemShapeTeethWhiteningVM       *teethWhiteningVM;
@property (nonatomic, strong) ZegoItemShapeNoseNarrowingVM        *noseNarrowingVM;
@property (nonatomic, strong) ZegoItemShapeNoseLengtheningVM      *noseLengtheningVM;
@property (nonatomic, strong) ZegoItemShapeFaceShorteningVM       *faceShorteningVM;
@property (nonatomic, strong) ZegoItemShapeMandibleSlimmingVM     *mandibleSlimmingVM;
@property (nonatomic, strong) ZegoItemShapeCheekboneSlimmingVM    *cheekboneSlimmingVM;
@property (nonatomic, strong) ZegoItemShapeForeheadShorteningVM   *foreheadShorteningVM;

// 美妆
@property (nonatomic, strong) ZegoItemBlusherBaseVM               *blusherBaseVM;
@property (nonatomic, strong) ZegoItemBlusherNoneVM               *blusherNoneVM;
@property (nonatomic, strong) ZegoItemBlusherDrunkVM              *blusherDrunkVM;
@property (nonatomic, strong) ZegoItemBlusherPeachVM              *blusherPeachVM;
@property (nonatomic, strong) ZegoItemBlusherMilkOrangeVM         *blusherMilkOrangeVM;
@property (nonatomic, strong) ZegoItemBlusherApricotPinkVM        *blusherApricotPinkVM;
@property (nonatomic, strong) ZegoItemBlusherSweetOrangeVM        *blusherSweetOrangeVM;

@property (nonatomic, strong) ZegoItemEyelashesBaseVM             *eyeLashesBaseVM;
@property (nonatomic, strong) ZegoItemEyelashesNoneVM             *eyeLashesNoneVM;
@property (nonatomic, strong) ZegoItemEyelashesNaturalVM          *eyeLashesCreamVM;
@property (nonatomic, strong) ZegoItemEyelashesTenderVM           *eyeLashesYouthVM;
@property (nonatomic, strong) ZegoItemEyelashesCurlVM             *eyeLashesFreshVM;
@property (nonatomic, strong) ZegoItemEyelashesSlenderVM          *eyeLashesAkitaVM;
@property (nonatomic, strong) ZegoItemEyelashesBushyVM            *eyeLashesMonetVM;

@property (nonatomic, strong) ZegoItemEyelinerBaseVM              *eyeLinerBaseVM;
@property (nonatomic, strong) ZegoItemEyelinerNoneVM              *eyeLinerNoneVM;
@property (nonatomic, strong) ZegoItemEyelinerNaturalVM           *eyeLinerNaturalVM;
@property (nonatomic, strong) ZegoItemEyelinerWildCatVM           *eyeLinerWildCatVM;
@property (nonatomic, strong) ZegoItemEyelinerPrettyVM            *eyeLinerPrettyVM;
@property (nonatomic, strong) ZegoItemEyelinerSchemingVM          *eyeLinerSchemingVM;
@property (nonatomic, strong) ZegoItemEyelinerTemperamentVM       *eyeLinerTemperamentVM;

@property (nonatomic, strong) ZegoItemEyeshadowBaseVM             *eyeshadowBaseVM;
@property (nonatomic, strong) ZegoItemEyeshadowNoneVM             *eyeshadowNoneVM;
@property (nonatomic, strong) ZegoItemEyeshadowMistPinkVM         *eyeshadowMistPinkVM;
@property (nonatomic, strong) ZegoItemEyeshadowShimmerPinkVM      *eyeshadowShimmerPinkVM;
@property (nonatomic, strong) ZegoItemEyeshadowMochaBrownVM       *eyeshadowMochaBrownVM;
@property (nonatomic, strong) ZegoItemEyeshadowVitalityOrangeVM   *eyeshadowVitalityOrangeVM;
@property (nonatomic, strong) ZegoItemEyeshadowTeaBrownVM         *eyeshadowTeaBrownVM;

@property (nonatomic, strong) ZegoItemMeiTongBaseVM               *meiTongBaseVM;
@property (nonatomic, strong) ZegoItemMeiTongNoneVM               *meiTongNoneVM ;
@property (nonatomic, strong) ZegoItemMeiTongWaterBlackVM         *meiTongWaterBlackVM;
@property (nonatomic, strong) ZegoItemMeiTongSkyBlueVM            *meiTongSkyBlueVM;
@property (nonatomic, strong) ZegoItemMeiTongBrownGreenVM         *meiTongBrownGreenVM;
@property (nonatomic, strong) ZegoItemMeiTongDifferentPupilVM     *meiTongDifferentPupilVM;
@property (nonatomic, strong) ZegoItemMeiTongCocoBrownVM          *meiTongCocoBrownVM;

@property (nonatomic, strong) ZegoItemLipStickBaseVM              *lipStickBaseVM;
@property (nonatomic, strong) ZegoItemLipStickNoneVM              *lipStickNoneVM;
@property (nonatomic, strong) ZegoItemLipStickBeanPinkVM          *lipStickBeanPinkVM;
@property (nonatomic, strong) ZegoItemLipStickSweetOrangeVM       *lipStickSweetOrangeVM;
@property (nonatomic, strong) ZegoItemLipStickRustyRedVM          *lipStickRustyRedVM;
@property (nonatomic, strong) ZegoItemLipStickCoralVM             *lipStickCoralVM;
@property (nonatomic, strong) ZegoItemLipStickVelvetRedVM         *lipStickVelvetRedVM;

// 滤镜
@property (nonatomic, strong) ZegoItemFilterBaseVM                *filterBaseVM;
@property (nonatomic, strong) ZegoItemFilterNoneVM                *filterNoneVM;
@property (nonatomic, strong) ZegoItemFilterNatureCreamVM         *filterCreamVM;
@property (nonatomic, strong) ZegoItemFilterNatureYouthVM         *filterYouthVM;
@property (nonatomic, strong) ZegoItemFilterNatureFreshVM         *filterFreshVM;
@property (nonatomic, strong) ZegoItemFilterNatureAkitaVM         *filterAkitaVM;
@property (nonatomic, strong) ZegoItemFilterGrayMonetVM           *filterMonetVM;
@property (nonatomic, strong) ZegoItemFilterGrayNightVM           *filterNightVM;
@property (nonatomic, strong) ZegoItemFilterGrayFilmVM            *filterFilmVM;
@property (nonatomic, strong) ZegoItemFilterDreamSunsetVM         *filterSunsetVM;
@property (nonatomic, strong) ZegoItemFilterDreamGlazeVM          *filterGlazeVM;
@property (nonatomic, strong) ZegoItemFilterDreamNebulaVM         *filterNebulaVM;

//风格妆
@property (nonatomic, strong) ZegoItemStyleMakeupBaseVM           *styleMakeupBaseVM;
@property (nonatomic, strong) ZegoItemStyleMakeupNoneVM           *styleMakeupNoneVM;
@property (nonatomic, strong) ZegoItemStyleMakeupEyelidVM         *styleMakeupEyelidVM;
@property (nonatomic, strong) ZegoItemStyleMakeupMilkyWayVM       *styleMakeupMilkyWayVM;
@property (nonatomic, strong) ZegoItemStyleMakeupMilkFierceVM     *styleMakeupMilkFierceVM;
@property (nonatomic, strong) ZegoItemStyleMakeupPureDesireVM     *styleMakeupPureDesireVM;
@property (nonatomic, strong) ZegoItemStyleMakeupGodyanVM         *styleMakeupGodyanVM;



@end

@implementation ZegoItemLibrary

static dispatch_once_t onceToken;
static ZegoItemLibrary *_instance;
+ (instancetype)shared {
  dispatch_once(&onceToken, ^{
    _instance = [[ZegoItemLibrary alloc] init];
  });
  return _instance;
}

+ (void)reset {
//  onceToken = 0;
//  _instance = nil;
}

- (void)dealloc {
  NSLog(@"ZegoItemLibrary dealloc");
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _skinSmoothVM = [[ZegoItemSkinSmoothVM alloc] init];
    _skinWhitenVM = [[ZegoItemSkinWhitenVM alloc] init];
    _skinSharpenVM = [[ZegoItemSkinSharpenVM alloc] init];
    _skinRosyVM = [[ZegoItemSkinRosyVM alloc] init];
    _skinWrinklesRemovingVM = [[ZegoItemSkinWrinklesRemovingVM alloc] init];
    _skinDarkCirclesRemovingVM = [[ZegoItemSkinDarkCirclesRemovingVM alloc] init];
    
    _faceLiftingVM = [[ZegoItemShapeFaceLiftingVM alloc] init];
    _bigEyesVM = [[ZegoItemShapeBigEyesVM alloc] init];
    _eyesBrighteningVM = [[ZegoItemShapeEyesBrighteningVM alloc] init];
    _longChinVM = [[ZegoItemShapeLongChinVM alloc] init];
    _smallMouthVM = [[ZegoItemShapeSmallMouthVM alloc] init];
    _teethWhiteningVM = [[ZegoItemShapeTeethWhiteningVM alloc] init];
    _noseNarrowingVM = [[ZegoItemShapeNoseNarrowingVM alloc] init];
    _noseLengtheningVM = [[ZegoItemShapeNoseLengtheningVM alloc] init];
    _faceShorteningVM = [[ZegoItemShapeFaceShorteningVM alloc] init];
    _mandibleSlimmingVM = [[ZegoItemShapeMandibleSlimmingVM alloc] init];
    _cheekboneSlimmingVM = [[ZegoItemShapeCheekboneSlimmingVM alloc] init];
    _foreheadShorteningVM = [[ZegoItemShapeForeheadShorteningVM alloc] init];
    
    
    _blusherBaseVM          = [[ZegoItemBlusherBaseVM          alloc] init];
    _blusherNoneVM          = [[ZegoItemBlusherNoneVM          alloc] init];
    _blusherDrunkVM         = [[ZegoItemBlusherDrunkVM         alloc] init];
    _blusherPeachVM         = [[ZegoItemBlusherPeachVM         alloc] init];
    _blusherMilkOrangeVM    = [[ZegoItemBlusherMilkOrangeVM    alloc] init];
    _blusherApricotPinkVM   = [[ZegoItemBlusherApricotPinkVM   alloc] init];
    _blusherSweetOrangeVM   = [[ZegoItemBlusherSweetOrangeVM   alloc] init];
    
    _eyeLashesBaseVM        = [[ZegoItemEyelashesBaseVM      alloc] init];
    _eyeLashesNoneVM        = [[ZegoItemEyelashesNoneVM      alloc] init];
    _eyeLashesCreamVM       = [[ZegoItemEyelashesNaturalVM   alloc] init];
    _eyeLashesYouthVM       = [[ZegoItemEyelashesTenderVM    alloc] init];
    _eyeLashesFreshVM       = [[ZegoItemEyelashesCurlVM      alloc] init];
    _eyeLashesAkitaVM       = [[ZegoItemEyelashesSlenderVM   alloc] init];
    _eyeLashesMonetVM       = [[ZegoItemEyelashesBushyVM     alloc] init];
    
    _eyeLinerBaseVM         = [[ZegoItemEyelinerBaseVM         alloc] init];
    _eyeLinerNoneVM         = [[ZegoItemEyelinerNoneVM         alloc] init];
    _eyeLinerNaturalVM      = [[ZegoItemEyelinerNaturalVM      alloc] init];
    _eyeLinerWildCatVM      = [[ZegoItemEyelinerWildCatVM      alloc] init];
    _eyeLinerPrettyVM       = [[ZegoItemEyelinerPrettyVM       alloc] init];
    _eyeLinerSchemingVM     = [[ZegoItemEyelinerSchemingVM     alloc] init];
    _eyeLinerTemperamentVM  = [[ZegoItemEyelinerTemperamentVM  alloc] init];
    
    _eyeshadowBaseVM            = [[ZegoItemEyeshadowBaseVM            alloc] init];
    _eyeshadowNoneVM            = [[ZegoItemEyeshadowNoneVM            alloc] init];
    _eyeshadowMistPinkVM        = [[ZegoItemEyeshadowMistPinkVM        alloc] init];
    _eyeshadowShimmerPinkVM     = [[ZegoItemEyeshadowShimmerPinkVM     alloc] init];
    _eyeshadowMochaBrownVM      = [[ZegoItemEyeshadowMochaBrownVM      alloc] init];
    _eyeshadowVitalityOrangeVM  = [[ZegoItemEyeshadowVitalityOrangeVM  alloc] init];
    _eyeshadowTeaBrownVM        = [[ZegoItemEyeshadowTeaBrownVM        alloc] init];
    
    _meiTongBaseVM = [[ZegoItemMeiTongBaseVM alloc]init];
    _meiTongNoneVM = [[ZegoItemMeiTongNoneVM alloc]init];
    _meiTongWaterBlackVM = [[ZegoItemMeiTongWaterBlackVM alloc]init];
    _meiTongSkyBlueVM = [[ZegoItemMeiTongSkyBlueVM alloc]init];
    _meiTongBrownGreenVM = [[ZegoItemMeiTongBrownGreenVM alloc]init];
    _meiTongDifferentPupilVM = [[ZegoItemMeiTongDifferentPupilVM alloc]init];
    _meiTongCocoBrownVM = [[ZegoItemMeiTongCocoBrownVM alloc]init];
    
    
    _lipStickBaseVM = [[ZegoItemLipStickBaseVM alloc]init];
    _lipStickNoneVM = [[ZegoItemLipStickNoneVM alloc]init];
    _lipStickBeanPinkVM = [[ZegoItemLipStickBeanPinkVM alloc]init];
    _lipStickSweetOrangeVM = [[ZegoItemLipStickSweetOrangeVM alloc]init];
    _lipStickRustyRedVM = [[ZegoItemLipStickRustyRedVM alloc]init];
    _lipStickCoralVM = [[ZegoItemLipStickCoralVM alloc]init];
    _lipStickVelvetRedVM = [[ZegoItemLipStickVelvetRedVM alloc]init];
    
    
    _filterBaseVM = [[ZegoItemFilterBaseVM alloc] init];
    _filterNoneVM = [[ZegoItemFilterNoneVM alloc] init];
    _filterCreamVM = [[ZegoItemFilterNatureCreamVM alloc] init];
    _filterYouthVM = [[ZegoItemFilterNatureYouthVM alloc] init];
    _filterFreshVM = [[ZegoItemFilterNatureFreshVM alloc] init];
    _filterAkitaVM = [[ZegoItemFilterNatureAkitaVM alloc] init];
    _filterMonetVM = [[ZegoItemFilterGrayMonetVM alloc] init];
    _filterNightVM = [[ZegoItemFilterGrayNightVM alloc] init];
    _filterFilmVM = [[ZegoItemFilterGrayFilmVM alloc] init];
    _filterSunsetVM = [[ZegoItemFilterDreamSunsetVM alloc] init];
    _filterGlazeVM = [[ZegoItemFilterDreamGlazeVM alloc] init];
    _filterNebulaVM = [[ZegoItemFilterDreamNebulaVM alloc] init];
      
    _styleMakeupBaseVM = [[ZegoItemStyleMakeupBaseVM alloc]init];
    _styleMakeupNoneVM = [[ZegoItemStyleMakeupNoneVM alloc]init];
    _styleMakeupEyelidVM = [[ZegoItemStyleMakeupEyelidVM alloc]init];
    _styleMakeupMilkyWayVM = [[ZegoItemStyleMakeupMilkyWayVM alloc]init];
    _styleMakeupMilkFierceVM = [[ZegoItemStyleMakeupMilkFierceVM alloc]init];
    _styleMakeupPureDesireVM = [[ZegoItemStyleMakeupPureDesireVM alloc]init];
    _styleMakeupGodyanVM = [[ZegoItemStyleMakeupGodyanVM alloc]init];
    
  }
  return self;
}

+ (ZegoItemCellVM *)itemWithItemType:(ZegoItemType)itemType {
  
  ZegoItemLibrary *lib = [self shared];
  
  switch (itemType) {
    
    case ZegoItemTypeNone:
      return nil;
      
    case ZegoItemTypeSkinSmooth:
      return lib.skinSmoothVM;
      
    case ZegoItemTypeSkinWhiten:
      return lib.skinWhitenVM;
      
    case ZegoItemTypeSkinSharpen:
      return lib.skinSharpenVM;
      
    case ZegoItemTypeSkinRosy:
      return lib.skinRosyVM;
      
    case ZegoItemTypeSkinWrinklesRemoving:
      return lib.skinWrinklesRemovingVM;
      
    case ZegoItemTypeSkinDarkCirclesRemoving:
      return lib.skinDarkCirclesRemovingVM;
      
      
    case ZegoItemTypeShapeFaceLifting:
      return lib.faceLiftingVM;
      
    case ZegoItemTypeShapeBigEyes:
      return lib.bigEyesVM;
      
    case ZegoItemTypeShapeEyesBrightening:
      return lib.eyesBrighteningVM;
      
    case ZegoItemTypeShapeLongChin:
      return lib.longChinVM;
      
    case ZegoItemTypeShapeSmallMouth:
      return lib.smallMouthVM;
      
    case ZegoItemTypeShapeTeethWhitening:
      return lib.teethWhiteningVM;
      
    case ZegoItemTypeShapeNoseNarrowing:
      return lib.noseNarrowingVM;
      
    case ZegoItemTypeShapeNoseLengthening:
      return lib.noseLengtheningVM;
      
    case ZegoItemTypeShapeFaceShortening:
      return lib.faceShorteningVM;
      
    case ZegoItemTypeShapeMandibleSlimming:
      return lib.mandibleSlimmingVM;
      
    case ZegoItemTypeShapeCheekboneSlimming:
      return lib.cheekboneSlimmingVM;
      
    case ZegoItemTypeShapeForeheadShortening:
      return lib.foreheadShorteningVM;
      
      
    case ZegoItemTypeBlusherBase:
      return lib.blusherBaseVM;
      
    case ZegoItemTypeBlusherNone:
      return lib.blusherNoneVM;
      
    case ZegoItemTypeBlusherDrunk:
      return lib.blusherDrunkVM;
      
    case ZegoItemTypeBlusherPeach:
      return lib.blusherPeachVM;
      
    case ZegoItemTypeBlusherMilkOrange:
      return lib.blusherMilkOrangeVM;
      
    case ZegoItemTypeBlusherApricotPink:
      return lib.blusherApricotPinkVM;
      
    case ZegoItemTypeBlusherSweetOrange:
      return lib.blusherSweetOrangeVM;
      
      
      
    case ZegoItemTypeEyelashesBase:
      return lib.eyeLashesBaseVM;
      
    case ZegoItemTypeEyelashesNone:
      return lib.eyeLashesNoneVM;
      
    case ZegoItemTypeEyelashesNatural:
      return lib.eyeLashesCreamVM;
      
    case ZegoItemTypeEyelashesTender:
      return lib.eyeLashesYouthVM;
      
    case ZegoItemTypeEyelashesCurl:
      return lib.eyeLashesFreshVM;
      
    case ZegoItemTypeEyelashesSlender:
      return lib.eyeLashesAkitaVM;
      
    case ZegoItemTypeEyelashesBushy:
      return lib.eyeLashesMonetVM;
      
      
      
    case ZegoItemTypeEyelinerBase:
      return lib.eyeLinerBaseVM;
      
    case ZegoItemTypeEyelinerNone:
      return lib.eyeLinerNoneVM;
      
    case ZegoItemTypeEyelinerNatural:
      return lib.eyeLinerNaturalVM;
      
    case ZegoItemTypeEyelinerWildCat:
      return lib.eyeLinerWildCatVM;
      
    case ZegoItemTypeEyelinerPretty:
      return lib.eyeLinerPrettyVM;
      
    case ZegoItemTypeEyelinerScheming:
      return lib.eyeLinerSchemingVM;
      
    case ZegoItemTypeEyelinerTemperament:
      return lib.eyeLinerTemperamentVM;
      
      
      
    case ZegoItemTypeEyeshadowBase:
      return lib.eyeshadowBaseVM;
      
    case ZegoItemTypeEyeshadowNone:
      return lib.eyeshadowNoneVM;
      
    case ZegoItemTypeEyeshadowMistPink:
      return lib.eyeshadowMistPinkVM;
      
    case ZegoItemTypeEyeshadowShimmerPink:
      return lib.eyeshadowShimmerPinkVM;
      
    case ZegoItemTypeEyeshadowMochaBrown:
      return lib.eyeshadowMochaBrownVM;
      
    case ZegoItemTypeEyeshadowVitalityOrange:
      return lib.eyeshadowVitalityOrangeVM;
      
    case ZegoItemTypeEyeshadowTeaBrown:
      return lib.eyeshadowTeaBrownVM;
      
      
      
    case ZegoItemTypeFilterBase:
      return lib.filterBaseVM;
      
    case ZegoItemTypeFilterNone:
      return lib.filterNoneVM;
      
    case ZegoItemTypeFilterNatureCream:
      return lib.filterCreamVM;
      
    case ZegoItemTypeFilterNatureYouth:
      return lib.filterYouthVM;
      
    case ZegoItemTypeFilterNatureFresh:
      return lib.filterFreshVM;
      
    case ZegoItemTypeFilterNatureAkita:
      return lib.filterAkitaVM;
      
    case ZegoItemTypeFilterGrayMonet:
      return lib.filterMonetVM;
      
    case ZegoItemTypeFilterGrayNight:
      return lib.filterNightVM;
      
    case ZegoItemTypeFilterGrayFilm:
      return lib.filterFilmVM;
      
    case ZegoItemTypeFilterDreamSunset:
      return lib.filterSunsetVM;
      
    case ZegoItemTypeFilterDreamGlaze:
      return lib.filterGlazeVM;
      
    case ZegoItemTypeFilterDreamNebula:
      return lib.filterNebulaVM;
    
    case ZegoItemTypeStyleMakeupBase:
      return lib.styleMakeupBaseVM;
    
    case ZegoItemTypeStyleMakeupNone:
      return lib.styleMakeupNoneVM;
      
    case ZegoItemTypeStyleMakeupEyelid:
      return lib.styleMakeupEyelidVM;
      
    case ZegoItemTypeStyleMakeupMilkyWay:
      return lib.styleMakeupMilkyWayVM;
      
    case ZegoItemTypeStyleMakeupMilkFierce:
      return lib.styleMakeupMilkFierceVM;
      
    case ZegoItemTypeStyleMakeupPureDesire:
      return lib.styleMakeupPureDesireVM;
    
    case ZegoItemTypeStyleMakeupGodyan:
      return lib.styleMakeupGodyanVM;
      
    case ZegoItemTypeMeiTongBase:
      return lib.meiTongBaseVM;
      
    case ZegoItemTypeMeiTongNone:
      return lib.meiTongNoneVM;
      
    case ZegoItemTypeMeiTongWaterBlack:
      return lib.meiTongWaterBlackVM;
      
    case ZegoItemTypeMeiTongSkyBlue:
      return lib.meiTongSkyBlueVM;
      
    case ZegoItemTypeMeiTongBrownGreen:
      return lib.meiTongBrownGreenVM;
      
    case ZegoItemTypeMeiTongDifferentPupil:
      return lib.meiTongDifferentPupilVM;
      
    case ZegoItemTypeMeiTongCocoBrown:
      return lib.meiTongCocoBrownVM;
      
      
    case ZegoItemTypeLipStickBase:
      return lib.lipStickBaseVM;
    
    case ZegoItemTypeLipStickNone:
      return lib.lipStickNoneVM;
      
    case ZegoItemTypeLipStickBeanPink:
      return lib.lipStickBeanPinkVM;
      
    case ZegoItemTypeLipStickSweetOrange:
      return lib.lipStickSweetOrangeVM;
      
    case ZegoItemTypeLipStickRustyRed:
      return lib.lipStickRustyRedVM;
    
    case ZegoItemTypeLipStickCoral:
      return lib.lipStickCoralVM;
      
    case ZegoItemTypeLipStickVelvetRed:
      return lib.lipStickVelvetRedVM;
  }
  
  
  return nil;
}

@end
