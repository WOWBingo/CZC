//
//  ChangePwdViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/26.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ChangePwdViewController.h"
#include <QuartzCore/QuartzCore.h>
@interface ChangePwdViewController ()

@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    // Do any additional setup after loading the view from its nib.
    //修改textfield边框颜色
    [self.oldPwdTextField setBorderStyle:UITextBorderStyleLine];
    self.oldPwdTextField.layer.borderColor = [[UIColor blueColor] CGColor];
    self.oldPwdTextField.layer.borderWidth = 0.5;

    [self.nowPwdTextField setBorderStyle:UITextBorderStyleLine];
    self.nowPwdTextField.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.nowPwdTextField.layer.borderWidth = 0.5;
    
    [self.makeSurePwdTextField setBorderStyle:UITextBorderStyleLine];
    self.makeSurePwdTextField.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    self.makeSurePwdTextField.layer.borderWidth = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitClick:(id)sender {
}
@end
