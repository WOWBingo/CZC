//
//  OrderDetailThreeTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/8/19.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderDetailThreeTableViewCell.h"

@implementation OrderDetailThreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)btnClick:(id)sender {
    NSLog(@"评价");
    UIButton *btn = (UIButton *)sender;
    [self.delegate goEvaluateVC:self.orderIndex andBtn:btn];
}
@end
