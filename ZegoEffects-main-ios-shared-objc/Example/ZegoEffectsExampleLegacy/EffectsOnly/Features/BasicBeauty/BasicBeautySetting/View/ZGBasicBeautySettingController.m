//
//  ZGBasicBeautySettingViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/17.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGBasicBeautySettingController.h"
#import "ZGBasicBeautySettingCell.h"
#import "ZGBasicBeautyDataSource.h"
#import "ZGBasicBeautyCellViewModel.h"
#import "ZGBasicBeautyConstants.h"

@interface ZGBasicBeautySettingController ()
<
UITableViewDataSource,
UITableViewDelegate,
ZegoItemCellProtocol
>

@property (nonatomic, copy) NSArray<ZegoItemCellVM *> *itemVMs;

@end

@implementation ZGBasicBeautySettingController

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
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeSkinSmooth],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeSkinWhiten],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeSkinSharpen],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeSkinRosy],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeSkinWrinklesRemoving],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeSkinDarkCirclesRemoving],
      
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeFaceLifting],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeBigEyes],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeEyesBrightening],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeLongChin],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeSmallMouth],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeTeethWhitening],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeNoseNarrowing],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeNoseLengthening],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeFaceShortening],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeMandibleSlimming],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeCheekboneSlimming],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeShapeForeheadShortening],
      
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeLipStickBase],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeBlusherBase],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelashesBase],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyelinerBase],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeEyeshadowBase],
      [ZegoItemLibrary itemWithItemType:ZegoItemTypeMeiTongBase],
    ];
  }
  return _itemVMs;
}

#pragma mark - ZegoItemCellProtocol
- (void)cell:(ZegoItemCell *)cell selectItemVMs:(NSArray<ZegoItemCellVM *> *)itemVMs {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择效果" message:@"" preferredStyle:UIAlertControllerStyleAlert];
  
  for (ZegoItemCellVM *vm in itemVMs) {
    UIAlertAction *action = [UIAlertAction actionWithTitle:vm.title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [cell setForwardingVM:vm];
    }];
    [alert addAction:action];
  }
  
  [self presentViewController:alert animated:YES completion:nil];
  
}

@end
