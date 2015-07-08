//
//  LoginViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollView.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic,strong) AutoScrollView *scrollView;
@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *registerBtn;
@property (nonatomic,strong) UIButton *forgetPwBtn;

@end
