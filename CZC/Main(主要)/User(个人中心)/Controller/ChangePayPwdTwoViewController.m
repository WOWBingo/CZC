//
//  ChangePayPwdTwoViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ChangePayPwdTwoViewController.h"

@interface ChangePayPwdTwoViewController ()

@end

@implementation ChangePayPwdTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //修改textfield边框
    [self.payPwdLab setBorderStyle:UITextBorderStyleLine];
    self.payPwdLab.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.payPwdLab.layer.borderWidth = 0.5;
    
    [self.payMakeSureLab setBorderStyle:UITextBorderStyleLine];
    self.payMakeSureLab.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.payMakeSureLab.layer.borderWidth = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)submitClick:(id)sender {
}
@end
