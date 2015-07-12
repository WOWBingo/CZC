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
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
            [self setAutomaticallyAdjustsScrollViewInsets:NO];
        }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *aLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 60)];
    [aLab setText:@"没有找到相关结果"];
    [self.view addSubview:aLab];
    [aLab setHidden:YES];
    self.noDataLab = aLab;
    [self.noDataLab setTextAlignment:NSTextAlignmentCenter];
    
    if (IOS7) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(0, 0, 26, 23)];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(3, 4, 3, 4)];
    [backBtn addTarget:self action:@selector(backFucntion:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.backMenuItem = backItem;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.noDataLab setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)homeFucntion:(id)sender{
    [self.tabBarController setSelectedIndex:0];
    [(UINavigationController *)self.tabBarController.viewControllers[0] popToRootViewControllerAnimated:YES];
}

-(IBAction)backFucntion:(id)sender{
//    if ([self isKindOfClass:[LoginViewController class]]) {
//        //登录失败
//        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        [appDelegate.tabBarController setSelectedIndex:0];
//        [self.navigationController dismissViewControllerAnimated:YES completion:^{
//        }];
//    }else{
    [self.navigationController popViewControllerAnimated:YES];
//    }
}

- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets
{
    if(IOS7){
        [super setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
    }
}

@end
