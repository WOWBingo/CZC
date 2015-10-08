//
//  ChangePayPwdOneViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ChangePayPwdOneViewController.h"
#import "ChangePayPwdTwoViewController.h"
@interface ChangePayPwdOneViewController ()

@end

@implementation ChangePayPwdOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改支付密码";
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

- (IBAction)nextStepClick:(id)sender {
    ChangePayPwdTwoViewController *changePhoneVC = [[ChangePayPwdTwoViewController alloc]initWithNibName:@"ChangePayPwdTwoViewController" bundle:nil];
    [self.navigationController pushViewController:changePhoneVC animated:YES];
}
@end
