//
//  OrderDetailsTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/8/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "EvaluateViewController.h"
@implementation OrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)evaluateClick:(id)sender {
    NSLog(@"评价");
    UIButton *btn = (UIButton *)sender;
    [self.delegate goEvaluateVC:self.orderIndex andBtn:btn];
}
@end
