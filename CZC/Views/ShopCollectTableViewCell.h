//
//  ShopCollectTableViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"

@interface ShopCollectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (nonatomic, strong) PopoverView *moreView;

@end
