//
//  ChangePhoneValidateViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/26.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ChangePhoneValidateViewController.h"
#import "ChangePhoneValidateThreeViewController.h"
@interface ChangePhoneValidateViewController ()

@end

@implementation ChangePhoneValidateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改手机验证";
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
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
    ChangePhoneValidateThreeViewController *changePhoneVC = [[ChangePhoneValidateThreeViewController alloc]initWithNibName:@"ChangePhoneValidateThreeViewController" bundle:nil];
    [self.navigationController pushViewController:changePhoneVC animated:YES];
}
@end
