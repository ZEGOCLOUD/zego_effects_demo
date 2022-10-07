//
//  ZegoItemCellVM.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZegoItemCellVM.h"

#define em _em()

NS_INLINE ZGEffectsOnlyEngineManager * _em() {
  return [ZGEffectsOnlyEngineManager shared];
}

@implementation ZegoItemSliderConfig

- (instancetype)init
{
  self = [super init];
  if (self) {
    _sliderValue = 50;
    _minValue = 0;
    _maxValue = 100;
  }
  return self;
}

@end

@interface ZegoItemCellVM ()

@property (nonatomic, strong) ZegoItemSliderConfig *internal_sliderConfig;

- (void)internal_setSliderValue:(int)value;
- (int)internal_sliderValue;
- (void)internal_enable:(BOOL)enable;

@end

@implementation ZegoItemCellVM
@synthesize forwardingVM = _forwardingVM;

- (instancetype)init
{
  self = [super init];
  if (self) {
//    [self setEnable:self.enable];
  }
  return self;
}

#pragma mark - Public Methods
- (void)setSliderValue:(int)value {
  [self.forwardingVM internal_setSliderValue:value];
}

- (int)sliderValue {
  return [self.forwardingVM internal_sliderValue];
}

- (void)reset {
  if (self.childrenVMs.count > 0) {
    for (ZegoItemCellVM *vm in self.childrenVMs) {
      [vm reset];
    }
  }
  self.forwardingVM = nil;
}

#pragma mark - Private

- (ZegoItemSliderConfig *)internal_sliderConfig {
  if (!_internal_sliderConfig) {
    _internal_sliderConfig = [[ZegoItemSliderConfig alloc] init];
  }
  return _internal_sliderConfig;
}

- (void)internal_setSliderValue:(int)value {
  ZLog(@"[DEMO_EFFECTS] %@强度: %d", self.title, value);
  [self.sliderConfig setSliderValue:value];
}

- (int)internal_sliderValue {
  return self.sliderConfig.sliderValue;
}

- (void)internal_enable:(BOOL)enable {
  ZLog(@"[DEMO_EFFECTS] 开启%@: %d", self.title, enable);
  if (enable) {
    [self internal_setSliderValue:self.sliderValue];
  }
}

#pragma mark - Setters
- (void)setForwardingVM:(ZegoItemCellVM *)forwardingVM {
  _forwardingVM = forwardingVM;
  if (self.forwardingVM != self) {
    forwardingVM.enable = YES;
  }
}

- (void)setEnable:(BOOL)enable {
  _enable = enable;
  [self.forwardingVM internal_enable:enable];
}

#pragma mark - Readonly getters
- (ZegoItemCellVM *)forwardingVM {
  if (_forwardingVM) {
    return _forwardingVM;
  }
  if (self.childrenVMs.count > 0) {
    return self.childrenVMs.firstObject;
  }
  return self;
}

- (NSObject *)effectsParam {
  return [[self paramCls] new];
}

- (Class)paramCls {
  return Nil;
}

- (ZegoItemType)itemType {
  return self.forwardingVM.itemType;
}

- (NSString *)title {
  return self.forwardingVM.title;
}

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return nil;
}

- (ZegoItemSliderConfig *)sliderConfig {
  return self.forwardingVM.internal_sliderConfig;
}

@end

#pragma mark -
#pragma mark - Concrete Subclasses
#pragma mark - 美颜 - 美肤
#pragma mark - 磨皮
@implementation ZegoItemSkinSmoothVM

- (Class)paramCls {
  return [ZegoEffectsSmoothParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeSkinSmooth;
}

- (NSString *)title {
  return @"磨皮";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableSmooth:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsSmoothParam *param = (ZegoEffectsSmoothParam *)self.effectsParam;
  param.intensity = value;
  [em setSmoothParam:param];
}

@end

#pragma mark - 美白
@implementation ZegoItemSkinWhitenVM

- (Class)paramCls {
  return [ZegoEffectsWhitenParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeSkinWhiten;
}

- (NSString *)title {
  return @"美白";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableWhiten:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsWhitenParam *param = (ZegoEffectsWhitenParam *)self.effectsParam;
  param.intensity = value;
  [em setWhitenParam:param];
}

@end

#pragma mark - 锐化
@implementation ZegoItemSkinSharpenVM

- (Class)paramCls {
  return [ZegoEffectsSharpenParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeSkinSharpen;
}

- (NSString *)title {
  return @"锐化";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableSharpen:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsSharpenParam *param = (ZegoEffectsSharpenParam *)self.effectsParam;
  param.intensity = value;
  [em setSharpenParam:param];
}

@end

#pragma mark - 红润
@implementation ZegoItemSkinRosyVM

- (Class)paramCls {
  return [ZegoEffectsRosyParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeSkinRosy;
}

- (NSString *)title {
  return @"红润";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableRosy:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsRosyParam *param = (ZegoEffectsRosyParam *)self.effectsParam;
  param.intensity = value;
  [em setRosyParam:param];
}

@end

#pragma mark - 去法令纹
@implementation ZegoItemSkinWrinklesRemovingVM

- (Class)paramCls {
  return [ZegoEffectsWrinklesRemovingParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeSkinWrinklesRemoving;
}

- (NSString *)title {
  return @"去法令纹";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableWrinklesRemoving:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsWrinklesRemovingParam *param = (ZegoEffectsWrinklesRemovingParam *)self.effectsParam;
  param.intensity = value;
  [em setWrinklesRemovingParam:param];
}

@end

#pragma mark - 去黑眼圈
@implementation ZegoItemSkinDarkCirclesRemovingVM

- (Class)paramCls {
  return [ZegoEffectsDarkCirclesRemovingParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeSkinDarkCirclesRemoving;
}

- (NSString *)title {
  return @"去黑眼圈";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableDarkCirclesRemoving:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsDarkCirclesRemovingParam *param = (ZegoEffectsDarkCirclesRemovingParam *)self.effectsParam;
  param.intensity = value;
  [em setDarkCirclesRemovingParam:param];
}

@end

#pragma mark -
#pragma mark - 美颜 - 美型
#pragma mark - 瘦脸
@implementation ZegoItemShapeFaceLiftingVM

- (Class)paramCls {
  return [ZegoEffectsFaceLiftingParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeFaceLifting;
}

- (NSString *)title {
  return @"瘦脸";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableFaceLifting:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsFaceLiftingParam *param = (ZegoEffectsFaceLiftingParam *)self.effectsParam;
  param.intensity = value;
  [em setFaceLiftingParam:param];
}

@end

#pragma mark - 大眼
@implementation ZegoItemShapeBigEyesVM

- (Class)paramCls {
  return [ZegoEffectsBigEyesParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeBigEyes;
}

- (NSString *)title {
  return @"大眼";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableBigEyes:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsBigEyesParam *param = (ZegoEffectsBigEyesParam *)self.effectsParam;
  param.intensity = value;
  [em setBigEyesParam:param];
}

@end

#pragma mark - 亮眼
@implementation ZegoItemShapeEyesBrighteningVM

- (Class)paramCls {
  return [ZegoEffectsEyesBrighteningParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeEyesBrightening;
}

- (NSString *)title {
  return @"亮眼";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableEyesBrightening:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsEyesBrighteningParam *param = (ZegoEffectsEyesBrighteningParam *)self.effectsParam;
  param.intensity = value;
  [em setEyesBrighteningParam:param];
}

@end

#pragma mark - 收下巴
@implementation ZegoItemShapeLongChinVM
@synthesize sliderConfig = _sliderConfig;

- (Class)paramCls {
  return [ZegoEffectsLongChinParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeLongChin;
}

- (NSString *)title {
  return @"收下巴";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableLongChin:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsLongChinParam *param = (ZegoEffectsLongChinParam *)self.effectsParam;
  param.intensity = value;
  [em setLongChinParam:param];
}

- (ZegoItemSliderConfig *)sliderConfig {
  if (!_sliderConfig) {
    _sliderConfig = [[ZegoItemSliderConfig alloc] init];
    _sliderConfig.sliderValue = 0;
    _sliderConfig.minValue = -100;
    _sliderConfig.maxValue = 100;
  }
  return _sliderConfig;
}

@end

#pragma mark - 小嘴
@implementation ZegoItemShapeSmallMouthVM
@synthesize sliderConfig = _sliderConfig;

- (Class)paramCls {
  return [ZegoEffectsSmallMouthParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeSmallMouth;
}

- (NSString *)title {
  return @"小嘴";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableSmallMouth:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsSmallMouthParam *param = (ZegoEffectsSmallMouthParam *)self.effectsParam;
  param.intensity = value;
  [em setSmallMouthParam:param];
}

- (ZegoItemSliderConfig *)sliderConfig {
  if (!_sliderConfig) {
    _sliderConfig = [[ZegoItemSliderConfig alloc] init];
    _sliderConfig.sliderValue = 0;
    _sliderConfig.minValue = -100;
    _sliderConfig.maxValue = 100;
  }
  return _sliderConfig;
}

@end

#pragma mark - 白牙
@implementation ZegoItemShapeTeethWhiteningVM

- (Class)paramCls {
  return [ZegoEffectsTeethWhiteningParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeTeethWhitening;
}

- (NSString *)title {
  return @"白牙";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableTeethWhitening:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsTeethWhiteningParam *param = (ZegoEffectsTeethWhiteningParam *)self.effectsParam;
  param.intensity = value;
  [em setTeethWhiteningParam:param];
}

@end

#pragma mark - 瘦鼻
@implementation ZegoItemShapeNoseNarrowingVM

- (Class)paramCls {
  return [ZegoEffectsNoseNarrowingParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeNoseNarrowing;
}

- (NSString *)title {
  return @"瘦鼻";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableNoseNarrowing:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsNoseNarrowingParam *param = (ZegoEffectsNoseNarrowingParam *)self.effectsParam;
  param.intensity = value;
  [em setNoseNarrowingParam:param];
}

@end

#pragma mark - 长鼻
@implementation ZegoItemShapeNoseLengtheningVM
@synthesize sliderConfig = _sliderConfig;

- (Class)paramCls {
  return [ZegoEffectsNoseLengtheningParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeNoseLengthening;
}

- (NSString *)title {
  return @"长鼻";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableNoseLengthening:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsNoseLengtheningParam *param = (ZegoEffectsNoseLengtheningParam *)self.effectsParam;
  param.intensity = value;
  [em setNoseLengtheningParam:param];
}

- (ZegoItemSliderConfig *)sliderConfig {
  if (!_sliderConfig) {
    _sliderConfig = [[ZegoItemSliderConfig alloc] init];
    _sliderConfig.sliderValue = 0;
    _sliderConfig.minValue = -100;
    _sliderConfig.maxValue = 100;
  }
  return _sliderConfig;
}

@end

#pragma mark - 小脸
@implementation ZegoItemShapeFaceShorteningVM

- (Class)paramCls {
  return [ZegoEffectsFaceShorteningParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeFaceShortening;
}

- (NSString *)title {
  return @"小脸";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableFaceShortening:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsFaceShorteningParam *param = (ZegoEffectsFaceShorteningParam *)self.effectsParam;
  param.intensity = value;
  [em setFaceShorteningParam:param];
}

@end

#pragma mark - 瘦下颚骨
@implementation ZegoItemShapeMandibleSlimmingVM

- (Class)paramCls {
  return [ZegoEffectsMandibleSlimmingParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeMandibleSlimming;
}

- (NSString *)title {
  return @"瘦下颚骨";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableMandibleSlimming:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsMandibleSlimmingParam *param = (ZegoEffectsMandibleSlimmingParam *)self.effectsParam;
  param.intensity = value;
  [em setMandibleSlimmingParam:param];
}

@end

#pragma mark - 瘦颧骨
@implementation ZegoItemShapeCheekboneSlimmingVM

- (Class)paramCls {
  return [ZegoEffectsCheekboneSlimmingParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeCheekboneSlimming;
}

- (NSString *)title {
  return @"瘦颧骨";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableCheekboneSlimming:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsCheekboneSlimmingParam *param = (ZegoEffectsCheekboneSlimmingParam *)self.effectsParam;
  param.intensity = value;
  [em setCheekboneSlimmingParam:param];
}

@end

#pragma mark - 瘦额头
@implementation ZegoItemShapeForeheadShorteningVM
@synthesize sliderConfig = _sliderConfig;

- (Class)paramCls {
  return [ZegoEffectsForeheadShorteningParam class];
}

- (ZegoItemType)itemType {
  return ZegoItemTypeShapeForeheadShortening;
}

- (NSString *)title {
  return @"收额头";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em enableForeheadShortening:enable];
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  ZegoEffectsForeheadShorteningParam *param = (ZegoEffectsForeheadShorteningParam *)self.effectsParam;
  param.intensity = value;
  [em setForeheadShorteningParam:param];
}

- (ZegoItemSliderConfig *)sliderConfig {
  if (!_sliderConfig) {
    _sliderConfig = [[ZegoItemSliderConfig alloc] init];
    _sliderConfig.sliderValue = 0;
    _sliderConfig.minValue = -100;
    _sliderConfig.maxValue = 100;
  }
  return _sliderConfig;
}

@end

#pragma mark -
#pragma mark - 美颜 - 美妆
#pragma mark 美颜 - 美妆 - 腮红
@implementation ZegoItemBlusherBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherDrunk],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherPeach],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherMilkOrange],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherApricotPink],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherSweetOrange],
  ];
}

@end

@implementation ZegoItemBlusherNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeBlusherNone;
}

- (NSString *)title {
  return @"腮红-无";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em disableBlushers:0];
}

@end

@implementation ZegoItemBlusherDrunkVM

- (ZegoItemType)itemType {
  return ZegoItemTypeBlusherDrunk;
}

- (NSString *)title {
  return @"腮红-微醺";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setBlushersSlightlyDrunk:value];
}

@end

@implementation ZegoItemBlusherPeachVM

- (ZegoItemType)itemType {
  return ZegoItemTypeBlusherPeach;
}

- (NSString *)title {
  return @"腮红-蜜桃";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setBlushersPeach:value];
}

@end

@implementation ZegoItemBlusherMilkOrangeVM

- (ZegoItemType)itemType {
  return ZegoItemTypeBlusherMilkOrange;
}

- (NSString *)title {
  return @"腮红-奶橘";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setBlushersMilkOrange:value];
}

@end

@implementation ZegoItemBlusherApricotPinkVM

- (ZegoItemType)itemType {
  return ZegoItemTypeBlusherApricotPink;
}

- (NSString *)title {
  return @"腮红-杏粉";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setBlushersApricotPink:value];
}

@end

@implementation ZegoItemBlusherSweetOrangeVM

- (ZegoItemType)itemType {
  return ZegoItemTypeBlusherSweetOrange;
}

- (NSString *)title {
  return @"腮红-甜橙";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setBlushersSweetOrange:value];
}

@end

#pragma mark 美颜 - 美妆 - 眼睫毛
@implementation ZegoItemEyelashesBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesNatural],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesTender],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesCurl],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesSlender],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesBushy],
  ];
}

@end

@implementation ZegoItemEyelashesNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelashesNone;
}

- (NSString *)title {
  return @"眼睫毛-无";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em disableEyelash:0];
}

@end

@implementation ZegoItemEyelashesNaturalVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelashesNatural;
}

- (NSString *)title {
  return @"眼睫毛-自然";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelashNatural:value];
}

@end

@implementation ZegoItemEyelashesTenderVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelashesTender;
}

- (NSString *)title {
  return @"眼睫毛-温柔";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelashTender:value];
}

@end

@implementation ZegoItemEyelashesCurlVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelashesCurl;
}

- (NSString *)title {
  return @"眼睫毛-卷翘";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelashCurl:value];
}

@end

@implementation ZegoItemEyelashesSlenderVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelashesSlender;
}

- (NSString *)title {
  return @"眼睫毛-纤长";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelashSlender:value];
}

@end

@implementation ZegoItemEyelashesBushyVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelashesBushy;
}

- (NSString *)title {
  return @"眼睫毛-浓密";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelashBushy:value];
}

@end

#pragma mark 美颜 - 美妆 - 眼睫毛
@implementation ZegoItemEyelinerBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerNatural],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerWildCat],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerPretty],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerScheming],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerTemperament],
  ];
}

@end

@implementation ZegoItemEyelinerNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelinerNone;
}

- (NSString *)title {
  return @"眼线-无";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em disableEyeliner:0];
}

@end

@implementation ZegoItemEyelinerNaturalVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelinerNatural;
}

- (NSString *)title {
  return @"眼线-自然";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelinerNatural:value];
}

@end

@implementation ZegoItemEyelinerWildCatVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelinerWildCat;
}

- (NSString *)title {
  return @"眼线-野猫";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelinerWildcat:value];
}

@end

@implementation ZegoItemEyelinerPrettyVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelinerPretty;
}

- (NSString *)title {
  return @"眼线-俏皮";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelinerPretty:value];
}

@end

@implementation ZegoItemEyelinerSchemingVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelinerScheming;
}

- (NSString *)title {
  return @"眼线-心机";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelinerScheming:value];
}

@end

@implementation ZegoItemEyelinerTemperamentVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyelinerTemperament;
}

- (NSString *)title {
  return @"眼线-气质";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelinerTemperament:value];
}

@end

#pragma mark 美颜 - 美妆 - 眼影
@implementation ZegoItemEyeshadowBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowMistPink],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowShimmerPink],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowMochaBrown],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowVitalityOrange],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowTeaBrown],
  ];
}

@end

@implementation ZegoItemEyeshadowNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyeshadowNone;
}

- (NSString *)title {
  return @"眼影-无";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em disableEyeshadow:0];
}

@end

@implementation ZegoItemEyeshadowMistPinkVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyeshadowMistPink;
}

- (NSString *)title {
  return @"眼影-粉雾海";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyeshadowMistPink:value];
}

@end

@implementation ZegoItemEyeshadowShimmerPinkVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyeshadowShimmerPink;
}

- (NSString *)title {
  return @"眼影-微光蜜";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyeshadowShimmerPink:value];
}

@end

@implementation ZegoItemEyeshadowMochaBrownVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyeshadowMochaBrown;
}

- (NSString *)title {
  return @"眼影-摩卡棕";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyeshadowMochaBrown:value];
}

@end

@implementation ZegoItemEyeshadowVitalityOrangeVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyeshadowVitalityOrange;
}

- (NSString *)title {
  return @"眼影-元气橙";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyeshadowVitalityOrange:value];
}

@end

@implementation ZegoItemEyeshadowTeaBrownVM

- (ZegoItemType)itemType {
  return ZegoItemTypeEyeshadowTeaBrown;
}

- (NSString *)title {
  return @"眼影-暖茶棕";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyeshadowTeaBrown:value];
}

@end

#pragma mark 美颜 - 美妆 - 美瞳
@implementation ZegoItemMeiTongBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongWaterBlack],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongSkyBlue],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongBrownGreen],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongDifferentPupil],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongCocoBrown],
  ];
}

@end

@implementation ZegoItemMeiTongNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeMeiTongNone;
}

- (NSString *)title {
  return @"美瞳-无";
}

- (void)internal_enable:(BOOL)enable {
    [super internal_enable:enable];
    [em disableMeiTong:0];
}

@end

@implementation ZegoItemMeiTongWaterBlackVM

- (ZegoItemType)itemType {
  return ZegoItemTypeMeiTongWaterBlack;
}

- (NSString *)title {
  return @"美瞳-水光黑";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMeiTongWaterBlack:value];
}

@end

@implementation ZegoItemMeiTongSkyBlueVM

- (ZegoItemType)itemType {
  return ZegoItemTypeMeiTongWaterBlack;
}

- (NSString *)title {
  return @"美瞳-星空蓝";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMeiTongSkyBrown:value];
}

@end

@implementation ZegoItemMeiTongBrownGreenVM

- (ZegoItemType)itemType {
  return ZegoItemTypeMeiTongWaterBlack;
}

- (NSString *)title {
  return @"美瞳-仙棕绿";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMeiTongBrownGreen:value];
}

@end

@implementation ZegoItemMeiTongDifferentPupilVM

- (ZegoItemType)itemType {
  return ZegoItemTypeMeiTongDifferentPupil;
}

- (NSString *)title {
  return @"美瞳-异瞳棕";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMeiTongDifferentPupil:value];
}

@end

@implementation ZegoItemMeiTongCocoBrownVM

- (ZegoItemType)itemType {
  return ZegoItemTypeMeiTongDifferentPupil;
}

- (NSString *)title {
  return @"美瞳-可可棕";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMeiTongCocoBrown:value];
}

@end


@implementation ZegoItemLipStickBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickBeanPink],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickSweetOrange],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickRustyRed],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickCoral],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickVelvetRed],
  ];
}

@end

@implementation ZegoItemLipStickNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeLipStickNone;
}

- (NSString *)title {
  return @"口红-无";
}

- (void)internal_enable:(BOOL)enable {
    [super internal_enable:enable];
    [em disableLipstick:0];
}

@end

@implementation ZegoItemLipStickBeanPinkVM

- (ZegoItemType)itemType {
  return ZegoItemTypeLipStickBeanPink;
}

- (NSString *)title {
  return @"口红-豆沙粉";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setLipstickBeanPink:value];
}

@end

@implementation ZegoItemLipStickSweetOrangeVM

- (ZegoItemType)itemType {
  return ZegoItemTypeLipStickSweetOrange;
}

- (NSString *)title {
  return @"口红-甜橘色";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setLipstickSweetOrange:value];
}

@end

@implementation ZegoItemLipStickRustyRedVM

- (ZegoItemType)itemType {
  return ZegoItemTypeLipStickRustyRed;
}

- (NSString *)title {
  return @"口红-铁锈红";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setLipstickRustRed:value];
}


@end

@implementation ZegoItemLipStickCoralVM

- (ZegoItemType)itemType {
  return ZegoItemTypeLipStickCoral;
}

- (NSString *)title {
  return @"口红-珊瑚色";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setLipstickCoral:value];
}


@end

@implementation ZegoItemLipStickVelvetRedVM

- (ZegoItemType)itemType {
  return ZegoItemTypeLipStickVelvetRed;
}

- (NSString *)title {
  return @"口红-丝绒红";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setLipstickVelvetRed:value];
}


@end


#pragma mark -
#pragma mark - 滤镜
@implementation ZegoItemFilterBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterNatureCream],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterNatureYouth],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterNatureFresh],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterNatureAkita],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterGrayMonet],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterGrayNight],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterGrayFilm],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterDreamSunset],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterDreamGlaze],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterDreamNebula],
  ];
}

@end

#pragma mark - 无滤镜
@implementation ZegoItemFilterNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterNone;
}

- (NSString *)title {
  return @"无滤镜";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em disableFilter:0];
}

@end

#pragma mark - 自然-奶油
@implementation ZegoItemFilterNatureCreamVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterNatureCream;
}

- (NSString *)title {
  return @"自然-奶油";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterCream:value];
}

@end

#pragma mark - 自然-青春
@implementation ZegoItemFilterNatureYouthVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterNatureYouth;
}

- (NSString *)title {
  return @"自然-青春";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterYouth:value];
}

@end

#pragma mark - 自然-清新
@implementation ZegoItemFilterNatureFreshVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterNatureFresh;
}

- (NSString *)title {
  return @"自然-清新";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterFresh:value];
}

@end

#pragma mark - 自然-秋田
@implementation ZegoItemFilterNatureAkitaVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterNatureAkita;
}

- (NSString *)title {
  return @"自然-秋田";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterAkita:value];
}

@end

#pragma mark - 灰调-莫奈
@implementation ZegoItemFilterGrayMonetVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterGrayMonet;
}

- (NSString *)title {
  return @"灰调-莫奈";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterMonet:value];
}

@end

#pragma mark - 灰调-暗夜
@implementation ZegoItemFilterGrayNightVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterGrayNight;
}

- (NSString *)title {
  return @"灰调-暗夜";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterNight:value];
}

@end

#pragma mark - 灰调-胶片
@implementation ZegoItemFilterGrayFilmVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterGrayFilm;
}

- (NSString *)title {
  return @"灰调-胶片";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterFilm:value];
}

@end

#pragma mark - 梦境-落日
@implementation ZegoItemFilterDreamSunsetVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterDreamSunset;
}

- (NSString *)title {
  return @"梦境-落日";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterSunset:value];
}

@end

#pragma mark - 梦境-琉璃
@implementation ZegoItemFilterDreamGlazeVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterDreamGlaze;
}

- (NSString *)title {
  return @"梦境-琉璃";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterGlaze:value];
}

@end

#pragma mark - 梦境-星云
@implementation ZegoItemFilterDreamNebulaVM

- (ZegoItemType)itemType {
  return ZegoItemTypeFilterDreamNebula;
}

- (NSString *)title {
  return @"梦境-星云";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em enableFilterNebula:value];
}

@end

#pragma mark -
#pragma mark - 风格妆
@implementation ZegoItemStyleMakeupBaseVM

- (NSArray<ZegoItemCellVM *> *)childrenVMs {
  return @[
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupNone],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupEyelid],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupMilkyWay],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupMilkFierce],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupPureDesire],
    [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupGodyan],
  ];
}

@end

@implementation ZegoItemStyleMakeupNoneVM

- (ZegoItemType)itemType {
  return ZegoItemTypeStyleMakeupNone;
}

- (NSString *)title {
  return @"无风格妆";
}

- (void)internal_enable:(BOOL)enable {
  [super internal_enable:enable];
  [em disableStyleMakeup:0];
}

@end

@implementation ZegoItemStyleMakeupEyelidVM

- (ZegoItemType)itemType {
  return ZegoItemTypeStyleMakeupEyelid;
}

- (NSString *)title {
  return @"眼睑下至";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setEyelid:value];
}

@end

@implementation ZegoItemStyleMakeupMilkyWayVM

- (ZegoItemType)itemType {
  return ZegoItemTypeStyleMakeupMilkyWay;
}

- (NSString *)title {
  return @"银河眼妆";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMilkyEyes:value];
}

@end

@implementation ZegoItemStyleMakeupMilkFierceVM

- (ZegoItemType)itemType {
  return ZegoItemTypeStyleMakeupMilkFierce;
}

- (NSString *)title {
  return @"奶凶";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMilkFierce:value];
}

@end

@implementation ZegoItemStyleMakeupPureDesireVM

- (ZegoItemType)itemType {
  return ZegoItemTypeStyleMakeupPureDesire;
}

- (NSString *)title {
  return @"纯欲";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMilkFierce:value];
}

@end

@implementation ZegoItemStyleMakeupGodyanVM

- (ZegoItemType)itemType {
  return ZegoItemTypeStyleMakeupGodyan;
}

- (NSString *)title {
  return @"神颜";
}

- (void)internal_setSliderValue:(int)value {
  [super internal_setSliderValue:value];
  [em setMilkFierce:value];
}

@end
