//
//  ZGFilterDataSource.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFilterDataSource.h"

@interface ZGFilterDataSource ()
@property (nonatomic, copy) NSArray<ZGFilterModel *> *filterModels;
@end

@implementation ZGFilterDataSource

- (NSArray<ZGFilterModel *> *)filters {
  return self.filterModels;
}

- (NSUInteger)filterCount {
  return self.filterModels.count;
}

- (NSArray<ZGFilterModel *> *)filterModels {
  if (!_filterModels) {
    NSArray<NSString *> *filterNames = @[
      @"无",
      @"奶油",
      @"青春",
      @"清新",
      @"秋田",
      @"莫奈",
      @"暗夜",
      @"胶片",
      @"落日",
      @"琉璃",
      @"星云",
    ];
    
    NSArray<NSString *> *selectorNames = @[
      @"disableFilter:",
      @"enableFilterCream:",
      @"enableFilterYouth:",
      @"enableFilterFresh:",
      @"enableFilterAkita:",
      @"enableFilterMonet:",
      @"enableFilterNight:",
      @"enableFilterFilm:",
      @"enableFilterSunset:",
      @"enableFilterGlaze:",
      @"enableFilterNebula:",
    ];
    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i < filterNames.count; i++) {
      ZGFilterModel *model = [[ZGFilterModel alloc] init];
      model.name = filterNames[i];
      model.selectorName = selectorNames[i];
      [models addObject:model];
    }
    _filterModels = models.copy;
  }
  return _filterModels;
}

@end
