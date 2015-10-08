//
//  RechargeView.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "RechargeView.h"

@implementation RechargeView
-(void)awakeFromNib{
    [self.zfbBtn setBackgroundImage:[UIImage imageNamed:@"chooseNO.png"] forState:UIControlStateNormal];
    [self.ylBtn setBackgroundImage:[UIImage imageNamed:@"chooseNO.png"] forState:UIControlStateNormal];
}
-(void)drawRect:(CGRect)rect{
    if (self.chooseIndex == 1) {
        [self.zfbBtn setBackgroundImage:[UIImage imageNamed:@"chooseYes.png"] forState:UIControlStateNormal];
    }else if (self.chooseIndex == 2){
        [self.ylBtn setBackgroundImage:[UIImage imageNamed:@"chooseYes.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)chooseZfbClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self.delegate changeRecharge:btn.tag];
}

- (IBAction)chooseYlClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self.delegate changeRecharge:btn.tag];
}
@end
