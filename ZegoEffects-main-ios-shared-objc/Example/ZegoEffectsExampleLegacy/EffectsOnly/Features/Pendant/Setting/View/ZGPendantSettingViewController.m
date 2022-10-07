//
//  ZGPendantSettingViewController.m
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/5/13.
//  Copyright © 2021 Zego. All rights reserved.
//

#import "ZGPendantSettingViewController.h"
#import "ZGPendantCell.h"
#import "ZGPendantDataSource.h"

static NSString * const ZGPendantCellIdentifier = @"ZGPendantCellIdentifier";

@interface ZGPendantSettingViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) ZGPendantDataSource *dataSource;

@end

@implementation ZGPendantSettingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  [self setupUI];
}

- (void)setupUI {
  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  layout.itemSize = CGSizeMake(60, 80);
  layout.minimumLineSpacing = 20;
  layout.minimumInteritemSpacing = 20;
  
  UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
  collectionView.backgroundColor = UIColor.whiteColor;
  [collectionView registerClass:[ZGPendantCell class] forCellWithReuseIdentifier:ZGPendantCellIdentifier];
  collectionView.delegate = self;
  collectionView.dataSource = self;
  collectionView.showsVerticalScrollIndicator = NO;
  [self.view addSubview:collectionView];
  
  [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.top.equalTo(self.view).offset(16);
    make.right.bottom.equalTo(self.view).inset(16);
  }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return [self.dataSource pendantCount];
}

- (ZGPendantCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  ZGPendantCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZGPendantCellIdentifier forIndexPath:indexPath];
  if (!cell) {
    cell = [[ZGPendantCell alloc] initWithFrame:CGRectMake(0, 0, 45, 75)];
  }
  cell.pendant = [self.dataSource pendants][indexPath.item];
  return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  ZGPendantCell *cell = (ZGPendantCell *)[collectionView cellForItemAtIndexPath:indexPath];
  [cell.pendant activate];
  
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (ZGPendantDataSource *)dataSource {
  return [ZGPendantDataSource shared];
}

@end
