//
//  ZGStyleMakeupStttingViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by zego on 2021/10/20.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGStyleMakeupStttingViewController.h"
#import "ZGEffectsOnlyEngineManager+StyleMakeup.h"

@interface ZGStyleMakeupStttingViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
ZegoItemCellProtocol
>

@property (nonatomic, copy) NSArray<ZegoItemCellVM *> *itemVMs;

@end

@implementation ZGStyleMakeupStttingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeStyleMakeupBase],
    ];
  }
  return _itemVMs;
}

#pragma mark - ZegoItemCellProtocol
- (void)cell:(ZegoItemCell *)cell selectItemVMs:(NSArray<ZegoItemCellVM *> *)itemVMs {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择风格妆" message:@"" preferredStyle:UIAlertControllerStyleAlert];

  for (ZegoItemCellVM *vm in itemVMs) {
    UIAlertAction *action = [UIAlertAction actionWithTitle:vm.title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [cell setForwardingVM:vm];
    }];
    [alert addAction:action];
  }

  [self presentViewController:alert animated:YES completion:nil];
  
}

@end
