//
//  MainViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "LogisticsViewController.h"
#import "ShoppingCarViewController.h"
#import "SetViewController.h"
#import "ObjectMapping.h"
#import "TestObject.h"

@interface MainViewController ()
@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     *	对数据模型重新编码
     */
    [ObjectMapping mappingObjects];
    TestObject *test = [[TestObject alloc]init];
    [test getData];
    
    /**
     *	设置tabbar选中背景、navigationbar背景、navigationbar下边框
     */
    [[UITabBar appearance]setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar"]];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"cpxx-7"] forBarMetrics:UIBarMetricsDefault ];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setShadowImage:nil];
    
    
    HomeViewController *homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    homeVC.isHomePage = YES;
    UINavigationController *homeNVC = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNVC.view.backgroundColor=[UIColor grayColor];
    homeNVC.tabBarItem.title=@"首页";
    homeNVC.tabBarItem.image=[UIImage imageNamed:@"icon-sy-1"];
    
    LogisticsViewController *LogisticsVC=[[LogisticsViewController alloc]initWithNibName:@"LogisticsViewController" bundle:nil];
    LogisticsVC.isHomePage = NO;
    UINavigationController *LogisticsNVC = [[UINavigationController alloc]initWithRootViewController:LogisticsVC];
    LogisticsNVC.tabBarItem.title=@"抢单";
    LogisticsNVC.tabBarItem.image=[UIImage imageNamed:@"icon-qd-1"];
//    LogisticsNVC.tabBarItem.badgeValue=@"6";
    
    HomeViewController *nearVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    nearVC.isHomePage = NO;
    UINavigationController *nearNVC = [[UINavigationController alloc]initWithRootViewController:nearVC];
    nearNVC.tabBarItem.title = @"周边商家";
    nearNVC.tabBarItem.image = [UIImage imageNamed:@"icon-zbsj-1"];

    
    ShoppingCarViewController *shoppingCarVC=[[ShoppingCarViewController alloc]initWithNibName:@"ShoppingCarViewController" bundle:nil];
    shoppingCarVC.isHomePage = NO;
    UINavigationController *shoppingCarNVC = [[UINavigationController alloc]initWithRootViewController:shoppingCarVC];
    shoppingCarNVC.tabBarItem.title = @"购物车";
    shoppingCarNVC.tabBarItem.image = [UIImage imageNamed:@"icon-gwc-1"];
    //    LogisticsNVC.tabBarItem.badgeValue=@"6";
    
    SetViewController *setVC=[[SetViewController alloc]initWithNibName:@"SetViewController" bundle:nil];
    setVC.isHomePage = NO;
    UINavigationController *setNVC = [[UINavigationController alloc]initWithRootViewController:setVC];
    setNVC.navigationBarHidden = YES;
    setNVC.tabBarItem.title = @"个人中心";
    setNVC.tabBarItem.image = [UIImage imageNamed:@"icon-grzx-1"];
    setNVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",[UIApplication sharedApplication].applicationIconBadgeNumber];

    self.viewControllers = @[homeNVC,LogisticsNVC,nearNVC,shoppingCarNVC,setNVC];
    self.selectedIndex = 0;
    [self.tabBar setTintColor:[UIColor whiteColor]];
    
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    //获得选中的item
    NSUInteger tabIndex = [tabBar.items indexOfObject:item];
    if (tabIndex != self.selectedIndex) {
        //设置最近一次变更
        kLastSelectedIndex = self.selectedIndex;
        NSLog(@"2 OLD:%ld , NEW:%ld",kLastSelectedIndex,tabIndex);
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
