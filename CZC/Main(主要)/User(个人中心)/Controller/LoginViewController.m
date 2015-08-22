//
//  LoginViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPWViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户登录";
    
    //设置导航按钮
//    self.navigationItem.leftBarButtonItem = self.backMenuBtn;
    self.scrollView = [[AutoScrollView alloc]initWithFrame:self.view.frame];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    //用户名
    self.userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, 200, SCREEN_WIDTH - LeftSpace * 2, ElementHeight)];
    UIView *userNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *userNameLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    userNameLeftImageView.image = [UIImage imageNamed:@"userName.png"];
    [userNameLeftView addSubview:userNameLeftImageView];
    self.userNameTextField.leftView = userNameLeftView;
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTextField.placeholder = @"用户名";
    [self.userNameTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.userNameTextField.backgroundColor = [UIColor whiteColor];
    self.userNameTextField.layer.borderColor = BackGroundColor.CGColor;
    self.userNameTextField.layer.borderWidth = 0.5f;
    self.userNameTextField.textColor = DominantColor;
    self.userNameTextField.delegate = self;
    self.userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:self.userNameTextField];
    //密码
    self.passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, self.userNameTextField.frame.origin.y + self.userNameTextField.frame.size.height, SCREEN_WIDTH - LeftSpace * 2, ElementHeight)];
    UIView *passWordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *passWordLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    passWordLeftImageView.image = [UIImage imageNamed:@"passWord.png"];
    [passWordLeftView addSubview:passWordLeftImageView];
    self.passwordTextField.leftView = passWordLeftView;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.placeholder = @"密 码";
    [self.passwordTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.passwordTextField.backgroundColor = [UIColor whiteColor];
    self.passwordTextField.layer.borderColor = BackGroundColor.CGColor;
    self.passwordTextField.layer.borderWidth = 0.5f;
    self.passwordTextField.textColor = DominantColor;
    [self.passwordTextField setSecureTextEntry:YES];
    self.passwordTextField.delegate = self;
    [self.scrollView addSubview:self.passwordTextField];
    //登录
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(LeftSpace, self.passwordTextField.frame.origin.y + self.passwordTextField.frame.size.height + 20, SCREEN_WIDTH - LeftSpace * 2, 40);
    [self.loginBtn setTitle:@"登   录" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = DominantColor;
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.layer.cornerRadius = self.loginBtn.frame.size.height / 2;
    [self.scrollView addSubview:self.loginBtn];
    //注册
    self.registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(LeftSpace, self.loginBtn.frame.origin.y + self.loginBtn.frame.size.height + 10, 100, 30)];
    [self.registerBtn setTitle:@"免费注册" forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    self.registerBtn.backgroundColor = [UIColor clearColor];
    [self.registerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.registerBtn];
    //忘记密码
    self.forgetPwBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - LeftSpace - 100, self.loginBtn.frame.origin.y + self.loginBtn.frame.size.height + 10, 100, 30)];
    [self.forgetPwBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgetPwBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    self.forgetPwBtn.backgroundColor = [UIColor clearColor];
    [self.forgetPwBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.forgetPwBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.forgetPwBtn addTarget:self action:@selector(forgetKeyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.forgetPwBtn];
    
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//登录
- (void)login:(id)sender {
    [self hidenKeyboard];
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"%@,%@",userName,password);
    if ([userName isEqualToString:@""]) {
        //请输入用户名
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写手机号" time:kHUDTime];
        [self performSelector:@selector(shownKeyboard:) withObject:self.userNameTextField afterDelay:kHUDTime];
        return;
    }
    if ([password isEqualToString:@""]) {
        //请输入密码
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写密码" time:kHUDTime];
        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField afterDelay:kHUDTime];
        return;
    }
//    if (![PublicObject validatePassword:password]) {
//        //请输入格式正确的密码
//        [PublicObject showHUDView:self.view title:@"提示" content:@"密码错误，请重新填写" time:kHUDTime];
//        self.passwordTextField.text = @"";
//        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField afterDelay:kHUDTime];
//        return;
//    }
//    
//    //    http://172.19.2.6:8080/ytjw_server_external/client/login.do?user.telphone=18865412563&user.password=123456
//    NSString *indata = [NSString stringWithFormat:@"user.telphone=%@&user.password=%@",telphone,md5Password];
//    [PublicObject requestData:klogin data:indata delegateView:self];
}

//注册
- (void)registerClick {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

//忘记密码
- (void)forgetKeyClick {
    ForgetPWViewController *forgetPwdVC = [[ForgetPWViewController alloc] init];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}
//显示键盘的方法
- (BOOL)shownKeyboard:(UITextField *)textFiled {
    [super becomeFirstResponder];
    return [textFiled becomeFirstResponder];
}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

//当用户按下return键或者按回车键，keyboard消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
