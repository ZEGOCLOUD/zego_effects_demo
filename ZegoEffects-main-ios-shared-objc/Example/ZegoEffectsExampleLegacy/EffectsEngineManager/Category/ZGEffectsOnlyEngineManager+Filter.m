//
//  ZGEffectsOnlyEngineManager+Filter.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyEngineManager+Filter.h"

@implementation ZGEffectsOnlyEngineManager (Filter)

- (void)disableFilter:(int)intensity {
  ZLog(@"关闭风格滤镜");
  [self.effects setFilter:nil];
}

/**
 * 奶油
 */
- (void)enableFilterCream:(int)intensity {
  ZLog(@"开启滤镜: 奶油 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Creamy"];
}

/**
 * 青春
 */
- (void)enableFilterYouth:(int)intensity {
  ZLog(@"开启滤镜: 青春 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Brighten"];
}

/**
 * 清新
 */
- (void)enableFilterFresh:(int)intensity {
  ZLog(@"开启滤镜: 清新 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Brighten"];
}

/**
 * 秋田
 */
- (void)enableFilterAkita:(int)intensity {
  ZLog(@"开启滤镜: 秋田 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Autumn"];
}

/**
 * 莫奈
 */
- (void)enableFilterMonet:(int)intensity {
  ZLog(@"开启滤镜: 莫奈 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Cool"];
}

/**
 * 暗夜
 */
- (void)enableFilterNight:(int)intensity {
  ZLog(@"开启滤镜: 暗夜 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Night"];
}

/**
 * 胶片
 */
- (void)enableFilterFilm:(int)intensity {
  ZLog(@"开启滤镜: 胶片 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Film-like"];
}

/**
 * 落日
 */
- (void)enableFilterSunset:(int)intensity {
  ZLog(@"开启滤镜: 落日 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Sunset"];
}

/**
 * 琉璃
 */
- (void)enableFilterGlaze:(int)intensity {
  ZLog(@"开启滤镜: 琉璃 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Cozily"];
}

/**
 * 星云
 */
- (void)enableFilterNebula:(int)intensity {
  ZLog(@"开启滤镜: 星云 %d", intensity);
  [self enableFilterWithIntensity:intensity subPath:@"Sweet"];
}

#pragma mark - Private
- (void)enableFilterWithIntensity:(int)intensity subPath:(NSString *)subPath {
  NSString *rscPath = [self filterRscPathWithSubPath:subPath];
  ZegoEffectsFilterParam *param = [self newFilterParamWithIntensity:intensity];
  [self.effects setFilter:rscPath];
  [self.effects setFilterParam:param];
}

- (NSString *)filterRscPathWithSubPath:(NSString *)subPath {
  NSString *folderPath = [[NSBundle mainBundle] pathForResource:@"ColorfulStyleResources" ofType:nil];
  NSString *rscPath = [folderPath stringByAppendingPathComponent:subPath];
  rscPath = [rscPath stringByAppendingString:@".bundle"];
  ZLog(@"Filter Path: %@", rscPath);
  return rscPath;
}

- (ZegoEffectsFilterParam *)newFilterParamWithIntensity:(int)intensity {
  ZegoEffectsFilterParam *param = [[ZegoEffectsFilterParam alloc] init];
  param.intensity = intensity;
  return param;
}

@end
