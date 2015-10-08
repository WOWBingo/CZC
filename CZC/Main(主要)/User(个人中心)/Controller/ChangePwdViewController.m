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
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
    // Do any additional setup after loading the view from its nib.
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
