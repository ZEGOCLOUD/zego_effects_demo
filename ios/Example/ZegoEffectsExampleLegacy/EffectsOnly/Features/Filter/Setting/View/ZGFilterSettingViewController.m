//
//  ZGFilterSettingViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/6/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGFilterSettingViewController.h"
#import "ZGEffectsOnlyEngineManager+Filter.h"
#import "ZGFilterModel.h"
#import "ZGFilterDataSource.h"

@interface ZGFilterSettingViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
ZegoItemCellProtocol
>

@property (nonatomic, copy) NSArray<ZegoItemCellVM *> *itemVMs;

@end

@implementation ZGFilterSettingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
  

  [self setupTableView];
}

- (void)setupTableView {
  UITableView *tableView = [[UITableView alloc] init];
  [tableView registerClass:[ZegoItemCell class] forCellReuseIdentifier:@"kZegoItemCell"];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  
  [self.view addSubview:tableView];
  
  [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view);
  }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.itemVMs.count;
}

- (ZegoItemCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ZegoItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kZegoItemCell"];
  cell.viewModel = self.itemVMs[indexPath.row];
  cell.delegate = self;
  return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 100;
}

- (NSArray<ZegoItemCellVM *> *)itemVMs {
  if (!_itemVMs) {
    _itemVMs = @[
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeFilterBase],
    ];
  }
  return _itemVMs;
}

#pragma mark - ZegoItemCellProtocol
- (void)cell:(ZegoItemCell *)cell selectItemVMs:(NSArray<ZegoItemCellVM *> *)itemVMs {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择滤镜" message:@"" preferredStyle:UIAlertControllerStyleAlert];

  for (ZegoItemCellVM *vm in itemVMs) {
    UIAlertAction *action = [UIAlertAction actionWithTitle:vm.title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [cell setForwardingVM:vm];
    }];
    [alert addAction:action];
  }

  [self presentViewController:alert animated:YES completion:nil];
  
}

@end
