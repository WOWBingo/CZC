//
//  ShopTableViewCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopTableViewCell.h"

@implementation ShopTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [_boxView.layer setCornerRadius:2.0]; //设置矩形四个圆角半径
    [_collectBtn.layer setCornerRadius:2.0];
    [_discountLable.layer setCornerRadius:2.0];
    /**
     *	设置阴影
     */
//    [[_boxView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
//    [[_boxView layer] setShadowRadius:1];//宽度
//    [[_boxView layer] setShadowOpacity:1];//透明
//    [[_boxView layer] setShadowColor:[UIColor lightGrayColor].CGColor];
//    [[_shopImageView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
//    [[_shopImageView layer] setShadowRadius:1];//宽度
//    [[_shopImageView layer] setShadowOpacity:1];//透明
//    [[_shopImageView layer] setShadowColor:[UIColor lightGrayColor].CGColor];
//    [[_collectBtn layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
//    [[_collectBtn layer] setShadowRadius:1];//宽度
//    [[_collectBtn layer] setShadowOpacity:1];//透明
//    [[_collectBtn layer] setShadowColor:[UIColor lightGrayColor].CGColor];
//    [[_discountLable layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
//    [[_discountLable layer] setShadowRadius:1];//宽度
//    [[_discountLable layer] setShadowOpacity:1];//透明
//    [[_discountLable layer] setShadowColor:[UIColor lightGrayColor].CGColor];

    [_shopImageView.layer setMasksToBounds:YES];
    [_shopImageView.layer setCornerRadius:_shopImageView.frame.size.width/2+2];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)collect:(id)sender {
    
}

- (IBAction)deleteShop:(id)sender{
    
}
@end
