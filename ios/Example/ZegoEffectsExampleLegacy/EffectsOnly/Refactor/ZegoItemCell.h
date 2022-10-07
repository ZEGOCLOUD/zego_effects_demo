//
//  ZegoItemCell.h
//  ZegoEffectsExampleLegacy
//
//  Created by Vic on 2021/9/9.
//  Copyright © 2021 Zego. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZegoItemCell;

NS_ASSUME_NONNULL_BEGIN

@protocol ZegoItemCellProtocol <NSObject>

- (void)cell:(ZegoItemCell *)cell selectItemVMs:(NSArray<ZegoItemCellVM *> *)itemVMs;

@end

@interface ZegoItemCell : UITableViewCell

@property (nonatomic, weak) id<ZegoItemCellProtocol> delegate;
@property (nonatomic, strong) ZegoItemCellVM *viewModel;

- (void)setForwardingVM:(ZegoItemCellVM *)cellVM;

- (void)reset;

@end

NS_ASSUME_NONNULL_END
