//
//  RechargeView.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "RechargeView.h"

@implementation RechargeView


- (IBAction)chooseZfbClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self.delegate changeRecharge:btn.tag];
}

- (IBAction)chooseYlClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self.delegate changeRecharge:btn.tag];
}
@end
