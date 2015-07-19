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
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
//            [self setAutomaticallyAdjustsScrollViewInsets:NO];
//        }
//    }
//    return self;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"cpxx-7"] forBarMetrics:UIBarMetricsDefault ];
    // 修改navigation下边框
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"cpxx-8"]];
    
    //修改UINavigationController title 的颜色和大小
    UIColor * titleColor = [UIColor whiteColor];
    UIFont * font = [UIFont boldSystemFontOfSize:20];
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:titleColor,NSForegroundColorAttributeName,font,NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    
    
//    UILabel *aLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 60)];
//    [aLab setText:@"没有找到相关结果"];
//    [self.view addSubview:aLab];
//    [aLab setHidden:YES];
//    self.noDataLab = aLab;
//    [self.noDataLab setTextAlignment:NSTextAlignmentCenter];
//    
//    if (IS_IOS7_OR_ABOVE) {
//        [self setEdgesForExtendedLayout:UIRectEdgeNone];
//    }
//    
//    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backBtn setFrame:CGRectMake(0, 0, 26, 23)];
//    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(3, 4, 3, 4)];
//    [backBtn addTarget:self action:@selector(backFucntion:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.backMenuItem = backItem;
    
}
-(void)viewWillAppear:(BOOL)animated{
//    [self.noDataLab setHidden:YES];
    self.parentViewController.tabBarController.tabBar.hidden = YES;
}
-(void)viewDidAppear:(BOOL)animated{
    
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//-(IBAction)homeFucntion:(id)sender{
//    [self.tabBarController setSelectedIndex:0];
//    [(UINavigationController *)self.tabBarController.viewControllers[0] popToRootViewControllerAnimated:YES];
//}
//
//-(IBAction)backFucntion:(id)sender{
////    if ([self isKindOfClass:[LoginViewController class]]) {
////        //登录失败
////        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
////        [appDelegate.tabBarController setSelectedIndex:0];
////        [self.navigationController dismissViewControllerAnimated:YES completion:^{
////        }];
////    }else{
//    [self.navigationController popViewControllerAnimated:YES];
////    }
//}
//
//- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets
//{
//    if(IS_IOS7_OR_ABOVE){
//        [super setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
//    }
//}

@end
