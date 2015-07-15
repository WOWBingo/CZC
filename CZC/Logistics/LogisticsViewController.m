//
//  LogisticsViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "LogisticsViewController.h"

@interface LogisticsViewController ()

@end

@implementation LogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"人人物流";
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_pic"] forBarMetrics:UIBarMetricsDefault ];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)seachClick:(id)sender {
}
@end
