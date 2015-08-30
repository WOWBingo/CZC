//
//  PointsTransferViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PointsTransferViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface PointsTransferViewController ()

@end

@implementation PointsTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分转账";
    self.thirdView_textField.keyboardType = UIKeyboardTypeNumberPad;

    //修改textfield边框
    [self.firstView_textField setBorderStyle:UITextBorderStyleLine];
    self.firstView_textField.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.firstView_textField.layer.borderWidth = 0.5;
    [self.secondView_textField setBorderStyle:UITextBorderStyleLine];
    self.secondView_textField.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.secondView_textField.layer.borderWidth = 0.5;
    [self.thirdView_textField setBorderStyle:UITextBorderStyleLine];
    self.thirdView_textField.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.thirdView_textField.layer.borderWidth = 0.5;
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];

}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [self.firstView_textField resignFirstResponder];
    [self.secondView_textField resignFirstResponder];
    [self.thirdView_textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextStepClick:(id)sender {
}
@end
