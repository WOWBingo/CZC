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
#import "ZDYPrintObject.h"
#import "Key.h"

@interface LoginViewController ()<MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"用户登录";
    
    //用户名
    self.userNameTextField.delegate = self;
    //密码
    [self.passwordTextField setSecureTextEntry:YES];
    self.passwordTextField.delegate = self;
    //登录
    [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.layer.cornerRadius = self.loginBtn.frame.size.height / 4;
    
    [self.registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.forgetPwBtn addTarget:self action:@selector(forgetKeyClick) forControlEvents:UIControlEventTouchUpInside];
    
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
    
    //监听键盘状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //监听键盘状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//登录
- (void)login {
    
    [self hidenKeyboard];
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"%@,%@",userName,password);
    if ([[userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        //请输入用户名
        [self showHUDViewTitle:@"请输入用户名" info:@"" andCodes:^{        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.userNameTextField afterDelay:kHUDTime];
        return;
    }
    if ([[password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        //请输入密码
        [self showHUDViewTitle:@"请输入密码" info:@"" andCodes:^{        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField afterDelay:kHUDTime];
        return;
    }
    [self showHUDBeginWithTitle:@"正在登录……"];
    NSDictionary *parDic = @{
                             @"MemLoginID":userName,
                             @"Pwd":password,
                             @"RememberMe":@"True"
                             };
    [CZCService POSTmethod:kAccountLogin_URL andDicParameters:parDic andHandle:^(NSDictionary *myresult) {
        NSString *resultStr = [myresult objectForKey:@"return"];
        if ([resultStr intValue] == 200) {
            [self saveUserInfoDefault:userName];
        }else{
            [self dissMissHUDEnd];
            [self showHUDViewTitle:@"用户名或密码错误" info:@"" andCodes:^{
            }];
        }
    }];
   
}

//注册
- (void)registerClick {
    RegisterViewController *registerVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
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

#pragma mark Notification
//keyBoard已经展示出来
- (void)keyboardDidShow:(NSNotification *)notification
{
    if([notification.name isEqualToString:UIKeyboardDidShowNotification]){
        NSValue* aValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardRect = [aValue CGRectValue];
        CGRect keyboardFrame = [self.view convertRect:keyboardRect fromView:[[UIApplication sharedApplication] keyWindow]];
        CGFloat keyboardHeight = keyboardFrame.size.height;
        if (keyboardHeight > 280) {
            _scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width, _scrollView.contentSize.height*0.35+160+keyboardHeight);
            _scrollView.contentOffset = CGPointMake(0, _scrollView.contentSize.height-SCREEN_HEIGHT+64);
            NSLog(@"##keboardHeight=%.2f",keyboardHeight);
        }
        
    }else if ([notification.name isEqualToString:UIKeyboardDidHideNotification]){
        _scrollView.contentSize = _contentView.frame.size;//CGSizeMake(_scrollView.contentSize.width,);
        _scrollView.contentOffset = CGPointMake(0,0);
    }
    
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


/**
 *	获取并持久化用户信息
 *
 *	@param account	用户名
 */
- (void)saveUserInfoDefault:(NSString *)account{
    [CZCService GETmethod:kAccountInfo_URL andParameters:account andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSDictionary *dic = [myresult objectForKey:@"AccoutInfo"];
            [self dissMissHUDEnd];
            if (dic != nil) {
                AccoutObject *accoutObj = [AccoutObject objectWithKeyValues:dic];
                NSLog(@"20.用户信息 ------%@",accoutObj);
                /** 用户信息存储，防止出现空值  */
                NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]initWithDictionary:dic];
                for (int i = 0;i < dic.allKeys.count; i++) {
                    NSString *key = [dic.allKeys objectAtIndex:i];
                    NSString *value = [mutableDic objectForKey:key];
                    if ([value isKindOfClass:[NSNull class]]) {
                        [mutableDic removeObjectForKey:key];
                    }
                }
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:[[NSDictionary alloc]initWithDictionary:mutableDic] forKey:kAccoutInfo_Default];
                [defaults synchronize];
                
                kAccountObject = accoutObj;
                
                self.dismissView(YES);//block回调
                [self showHUDViewTitle:@"登录成功" info:@"" andCodes:^{  }];
                [self dismissViewControllerAnimated:YES completion:^{  }];
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}


- (void)showHUDViewTitle:(NSString *)title info:(NSString*)info andCodes:(void (^)())finish{
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


- (IBAction)goBack:(id)sender {
    self.dismissView(NO);
    [self dismissViewControllerAnimated:YES completion:^{  }];
}
@end
