//
//  ZGEffectsOnlyRootViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Patrick Fu on 2021/4/25.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsOnlyRootViewController.h"
#import "ZGEffectsOnlyEngineManager.h"

#import "ZGPendantViewController.h"
#import "ZGPortraitSegmentationViewController.h"
#import "ZGFaceDetectionViewController.h"
#import "ZGHighPfmFaceDetectionVC.h"
#import "ZGBasicBeautyViewController.h"
#import "ZGChromaKeyViewController.h"
#import "ZGFilterViewController.h"
#import "ZGStyleMakeupViewController.h"

#import "ZGBasicBeautySettingController.h"

@interface ZGEffectsOnlyRootViewController ()

@property (nonatomic, copy) NSArray<NSArray <NSString *> *> *modules;

@end

@implementation ZGEffectsOnlyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create effects instance
//    [[ZGEffectsOnlyEngineManager shared] createEffects];
}

- (void)dealloc {
    // Destroy effects instance
    //[[ZGEffectsOnlyEngineManager shared] destroyEffects];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.modules.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modules[section].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Features";
    } else {
        return @"";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section >= self.modules.count || indexPath.row >= self.modules[indexPath.section].count) {
    return;
  }
  NSString *moduleName = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
  Class Cls = [self featureModuleNameToControllerClass][moduleName];
  UIViewController *vc = [[Cls alloc] init];
  
  [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ZGModuleCell"];
    NSString *title = self.modules[indexPath.section][indexPath.row];
    [cell.textLabel setText:title];
    return cell;
}


#pragma mark -
- (NSDictionary *)featureModuleNameToControllerClass {
  return @{
    @"人像分割" : ZGPortraitSegmentationViewController.class,
    @"人脸检测" : ZGFaceDetectionViewController.class,
    @"高性能人脸检测" : ZGHighPfmFaceDetectionVC.class,
    @"基础美颜" : ZGBasicBeautyViewController.class,
    @"绿幕分割" : ZGChromaKeyViewController.class,
    @"贴图挂件" : ZGPendantViewController.class,
    @"风格滤镜" : ZGFilterViewController.class,
    @"风格妆"   : ZGStyleMakeupViewController.class,
  };
}

- (NSArray<NSArray<NSString *> *> *)modules {
  if (!_modules) {
    NSArray *featureModules = @[
      @"基础美颜",
      @"贴图挂件",
      @"人脸检测",
      @"高性能人脸检测",
      @"人像分割",
      @"绿幕分割",
      @"风格滤镜",
      @"风格妆",
    ];
    _modules = @[
      featureModules,
    ];
  }
  return _modules;
}

@end
