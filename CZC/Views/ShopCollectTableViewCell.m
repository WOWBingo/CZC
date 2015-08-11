//
//  ShopCollectTableViewCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopCollectTableViewCell.h"

@implementation ShopCollectTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.moreView = [[PopoverView alloc]init];
    self.moreView.tag = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showMoreClick:(id)sender {
    [self.delegate moreView:self andPopoverView:self.moreView];
}
@end
