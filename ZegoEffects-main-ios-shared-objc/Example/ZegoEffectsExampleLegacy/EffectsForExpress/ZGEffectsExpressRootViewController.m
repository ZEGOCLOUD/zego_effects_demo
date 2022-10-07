//
//  ZGEffectsExpressRootViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/7/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGEffectsExpressRootViewController.h"

#import "ZGEffectsOnlyEngineManager.h"

#import "ZGExpressCapturePendantViewController.h"
#import "ZGExpressCaptureBasicBeautyViewController.h"
#import "ZGExpressProcessPendantViewController.h"
#import "ZGExpressProcessBasicBeautyViewController.h"

@interface ZGEffectsExpressRootViewController ()

@property (nonatomic, copy) NSArray<NSArray <NSString *> *> *modules;

@end

@implementation ZGEffectsExpressRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create effects instance
//    [[ZGEffectsOnlyEngineManager shared] createEffectsWithConfig:nil];
}

- (void)dealloc {
    // Destroy effects instance
    [[ZGEffectsOnlyEngineManager shared] destroyEffects];
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
    @"基础美颜 - custom video capture" : ZGExpressCaptureBasicBeautyViewController.class,
    @"贴图挂件 - custom video capture" : ZGExpressCapturePendantViewController.class,
    @"基础美颜 - custom video process" : ZGExpressProcessBasicBeautyViewController.class,
    @"贴图挂件 - custom video process" : ZGExpressProcessPendantViewController.class,
  };
}

- (NSArray<NSArray<NSString *> *> *)modules {
  if (!_modules) {
    NSArray *featureModules = @[
      @"基础美颜 - custom video capture",
      @"贴图挂件 - custom video capture",
      @"基础美颜 - custom video process",
      @"贴图挂件 - custom video process"
    ];
    _modules = @[
      featureModules,
    ];
  }
  return _modules;
}

@end
