//
//  RegisterViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoScrollView.h"
@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong) AutoScrollView *scrollView;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *makeUserPwTextField;
@property (nonatomic, strong) UITextField *recommendedCodeTextField;
@property (nonatomic, strong) UITextField *telphoneTextField;
@property (nonatomic, strong) UITextField *verifyCodeTextField;
@property (nonatomic, strong) UIButton *verifycodeBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) NSTimer *timer;//短信验证码倒计时
@property (nonatomic, assign) int second;//验证码可重发秒数

@property (nonatomic, strong) UIButton *serviceTermButton;
@property (nonatomic, strong) UIButton *agreeButton;
@property (nonatomic, assign) BOOL isAgree;//是否统一服务条款
@end
