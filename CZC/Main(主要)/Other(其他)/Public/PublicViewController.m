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
@interface PublicViewController ()<MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
}


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

-(void)goToLoginVC{
    LoginViewController *loginController=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    loginController.dismissView = ^(BOOL isSuccess){
        if (!isSuccess) {
            self.tabBarController.selectedIndex = kLastSelectedIndex;
        }
    };
    //调用此方法显示模态窗口
    [self presentViewController:loginController animated:YES completion:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)viewDidAppear:(BOOL)animated{
    
}
-(void)back{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - 进度条方法
- (void)shoHUDViewTitle:(NSString *)title info:(NSString*)info andCodes:(void (^)())finish{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = title;
    HUD.margin = 20.f;
    HUD.dimBackground = NO;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        finish();
    }];
}

- (void)showHUDBeginWithTitle:(NSString *)title{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = title;
    HUD.square = YES;
    HUD.dimBackground = YES;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD show:YES];
}

- (void)dissMissHUDEnd{
    [HUD hide:YES];
}



@end
