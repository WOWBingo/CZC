//
//  HundredTableViewCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HundredTableViewCell.h"

@implementation HundredTableViewCell

- (void)awakeFromNib {
    
//    //[_boxView.layer setMasksToBounds:YES];
//    [_boxView.layer setCornerRadius:2.0]; //设置矩形四个圆角半径
    /**
     *	设置阴影
     */
    [[_boxView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
    [[_boxView layer] setShadowRadius:1];//宽度
    [[_boxView layer] setShadowOpacity:1];//透明
    [[_boxView layer] setShadowColor:[UIColor lightGrayColor].CGColor];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
