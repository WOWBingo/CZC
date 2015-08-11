//
//  ShopCollectTableViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"
#import "ShopCollectionCell.h"
@protocol ShopCollectCellDelegate
-(void)moreView:(ShopCollectionCell *)cell andPopoverView:(PopoverView *)view;
@end

@interface ShopCollectTableViewCell : ShopCollectionCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (nonatomic,strong)NSIndexPath *cellIndexPath;
@property (nonatomic)float cellY;//cell相对于屏幕的Y
@property (nonatomic, strong) PopoverView *moreView;
@property (nonatomic,assign)id <ShopCollectCellDelegate>delegate;
- (IBAction)showMoreClick:(id)sender;
@end
