//
//  MainViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "SetViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HomeViewController *homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    homeVC.isHomePage = YES;
    UINavigationController *homeNVC = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNVC.view.backgroundColor=[UIColor grayColor];
    homeNVC.tabBarItem.title=@"首页";
    homeNVC.tabBarItem.image=[UIImage imageNamed:@"icon-sy-1"];
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor brownColor];
    c2.tabBarItem.title=@"抢单";
    c2.tabBarItem.image=[UIImage imageNamed:@"icon-qd-1"];
    
    HomeViewController *nearVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    nearVC.isHomePage = NO;
    UINavigationController *nearNVC = [[UINavigationController alloc]initWithRootViewController:nearVC];
    nearNVC.tabBarItem.title=@"周边商家";
    nearNVC.tabBarItem.image=[UIImage imageNamed:@"icon-zbsj-1"];

    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.tabBarItem.title=@"购物车";
    c4.tabBarItem.image=[UIImage imageNamed:@"icon-gwc-1"];
    
    SetViewController *setVC=[[SetViewController alloc]initWithNibName:@"SetViewController" bundle:nil];
    nearVC.isHomePage = NO;
    UINavigationController *setNVC = [[UINavigationController alloc]initWithRootViewController:setVC];
    setNVC.navigationBarHidden = YES;
    setNVC.tabBarItem.title=@"个人中心";
    setNVC.tabBarItem.image=[UIImage imageNamed:@"icon-grzx-1"];
    setNVC.tabBarItem.badgeValue=@"6";

    self.viewControllers = @[homeNVC,c2,nearNVC,c4,setNVC];
    self.selectedIndex = 0;
    [self.tabBar setTintColor:[UIColor whiteColor]];
    
    [[UITabBar appearance]setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar"]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
