//
//  PublicViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/12.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
@interface PublicViewController ()

@end

@implementation PublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"cpxx-7"] forBarMetrics:UIBarMetricsDefault ];//navigation栏的图片
    //    self.navigationController.navigationBar.barTintColor = [UIColor redColor];//导航栏颜色
    
    //    修改navigation下边框
    //    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"cpxx-8"]];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];//返回按钮颜色
    //返回按钮文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    
    //修改UINavigationController title 的颜色和大小
    UIColor * titleColor = [UIColor whiteColor];
    UIFont * font = [UIFont boldSystemFontOfSize:20];
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:titleColor,NSForegroundColorAttributeName,font,NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
}


-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)viewDidAppear:(BOOL)animated{
    
}
-(void)back{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
