//
//  RegisterViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "RegisterViewController.h"
#import "ProvisionViewController.h"
@interface RegisterViewController ()<MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"用户注册";
    //设置导航按钮
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"cpxx-7"]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
    self.isAgree = YES;
    
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.contentView addGestureRecognizer:gesture];
    
    //监听键盘状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //监听键盘状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidHideNotification object:nil];
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

-(void)textFieldDidEndEditing:(UITextField *)textField{
    UITextRange *selectedRange = textField.markedTextRange;
    if (selectedRange == nil || selectedRange.empty) {
        if (self.userNameTextField == textField) {//判断是否时我们想要限定的那个输入框
            if ([textField.text length] > 20) { //如果输入框内容大于200则弹出警告
                textField.text = [textField.text substringToIndex:20];
                //                [PublicObject showHUDView:self.view title:@"注意" content:@"字数超过限制" time:kHUDTime];
            }
        }
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {//按会车可以改变
        return YES;
    }
    UITextRange * selectedRange = textField.markedTextRange;
    if (selectedRange == nil || selectedRange.empty) {
        NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
        if (self.userNameTextField == textField) {//判断是否时我们想要限定的那个输入框
            if ([toBeString length] > 20) { //如果输入框内容大于16则弹出警告
                textField.text = [toBeString substringToIndex:20];
                [self hidenKeyboard];
                //                [PublicObject showHUDView:self.view title:@"注意" content:@"字数超过限制" time:kHUDTime];
                return NO;
            }
        }
    }
    return YES;
}

//计时器执行
- (void)updateTime {
    if (self.second <= 0) {
        [self.timer invalidate];
        self.timer = nil;
        [self.verifycodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.verifycodeBtn setBackgroundColor:DominantColor];
        [self.verifycodeBtn setUserInteractionEnabled:YES];
    } else {
        [self.verifycodeBtn setTitle:[NSString stringWithFormat:@"%ds",self.second] forState:UIControlStateNormal];
        [self.verifycodeBtn setBackgroundColor:[UIColor lightGrayColor]];
        [self.verifycodeBtn setUserInteractionEnabled:NO];
    }
    self.second--;
}

//隐藏键盘的方法
- (void)hidenKeyboard {
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.makeUserPwTextField resignFirstResponder];
    [self.recommendedCodeTextField resignFirstResponder];
    [self.telphoneTextField resignFirstResponder];
    [self.verifyCodeTextField resignFirstResponder];
}
//显示键盘的方法
- (BOOL)shownKeyboard:(UITextField *)textFiled {
    [super becomeFirstResponder];
    return [textFiled becomeFirstResponder];
}

//当用户按下return键或者按回车键，keyboard消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//获取短信验证码
- (IBAction)getVerifycodeClick:(id)sender {
    [self hidenKeyboard];
    NSString *telphone = self.telphoneTextField.text;
    
    //手机号码进行非空检查
    if ([telphone isEqualToString:@""]) {
        //请输入手机号
        //        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写您的手机号" time:kHUDTime];
        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField afterDelay:kHUDTime];
        return;
    }
    if (![PublicObject validateMobile:telphone]) {
        //请输入正确的手机号
        [self showHUDViewTitle:@"请输入正确地手机号码" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField afterDelay:kHUDTime];
        return;
    }
    
    [self.verifycodeBtn setUserInteractionEnabled:NO];
    NSString *url = [NSString stringWithFormat:@"/Api/OpenApi/IntegralPro.ashx?method=SendCodeForCheck&memid=shop5&strMobile=%@",telphone];
    [CZCService GETMethodWithWWW:url andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSLog(@" 验证码 ------%@",myresult);
            if(![myresult[@"message"] isEqualToString:@"ok"]){
                [self.timer invalidate];
                self.timer = nil;
                [self.verifycodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [self.verifycodeBtn setBackgroundColor:DominantColor];
                [self.verifycodeBtn setUserInteractionEnabled:YES];
                return;
            }
            self.second = VerifyCodeTime;
            if (self.timer != nil) {
                [self.timer invalidate];
                self.timer = nil;
            }
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
            [self.timer fire];
        }
        else{
            NSLog(@"失败");
        }
    }];
}
#pragma mark - 22.用户注册
//注册新用户
- (IBAction)resignClick:(id)sender {
    [self hidenKeyboard];
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *passwordRe = self.makeUserPwTextField.text;
    NSString *recommendedCode = self.recommendedCodeTextField.text;
    NSString *telphone = self.telphoneTextField.text;
    NSString *verifyCode = self.verifyCodeTextField.text;
    //    NSString *md5Password = [PublicObject md5:password];
    
    //对输入的用户信息进行非空检查
    if ([userName isEqualToString:@""]) {
        //请输入用户名
        [self showHUDViewTitle:@"请输入用户名" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.userNameTextField afterDelay:kHUDTime];
        return;
    }
    if ([password isEqualToString:@""]) {
        //请输入密码
        [self showHUDViewTitle:@"请输入密码" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField  afterDelay:kHUDTime];
        return;
    }
    if ([passwordRe isEqualToString:@""]) {
        //请再次输入密码
        [self showHUDViewTitle:@"请再次输入密码" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.makeUserPwTextField  afterDelay:kHUDTime];
        return;
    }
    if ([telphone isEqualToString:@""]) {
        //请输入手机号
        [self showHUDViewTitle:@"请输入手机号" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField  afterDelay:kHUDTime];
        return;
    }
    if ([verifyCode isEqualToString:@""]) {
        //请输入验证码
        [self showHUDViewTitle:@"请输入验证码" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.verifyCodeTextField  afterDelay:kHUDTime];
        return;
    }
    if (![password isEqualToString:passwordRe]) {
        [self showHUDViewTitle:@"两次密码输入不一致,请重新输入" info:@"" andCodes:^{
        }];
        return;
    }
    if (userName.length<6||userName.length>16) {
        [self showHUDViewTitle:@"用户账号为6-16个数字、字母或组合" info:@"" andCodes:^{
        }];
        return;
    }
    if (![PublicObject validateMobile:telphone]) {
        //请输入正确的手机号
        [self showHUDViewTitle:@"请输入正确格式的手机号码" info:@"" andCodes:^{
        }];
        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField  afterDelay:kHUDTime];
        return;
    }
    if (![PublicObject validatePassword:password]) {
        //请输入格式正确的密码
        [self showHUDViewTitle:@"请输入正确格式的密码" info:@"" andCodes:^{
        }];
        self.passwordTextField.text = @"";
        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField  afterDelay:kHUDTime];
        return;
    }
    if (!self.isAgree) {
        [self showHUDViewTitle:@"请阅读并同意《服务协议》内容" info:@"" andCodes:^{
        }];
    }
    /** 22.用户注册 /api/account/Regist */
    NSDictionary *accountDic = @{
                                 @"MemLoginID" : userName,
                                 @"Pwd" : password,
                                 };
    [CZCService POSTmethod:kAccountRegist_URL andDicParameters:accountDic andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
            NSLog(@"用户注册结果 ------%ld",(long)result);
            if (result == 202) {
                [self showHUDViewTitle:@"注册成功" info:@"" andCodes:^{
                }];
            }
            [self back];
        }
        else{
            NSLog(@"失败");
        }
    }];
}

- (IBAction)agreeClick:(id)sender {
    if (self.isAgree) {
        self.isAgree = NO;
        [self.agreeButton setImage:[UIImage imageNamed:@"chooseNo.png"] forState:UIControlStateNormal];
    } else {
        self.isAgree = YES;
        [self.agreeButton setImage:[UIImage imageNamed:@"chooseYes.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)serviceClick:(id)sender {
    ProvisionViewController *provisionVC = [[ProvisionViewController alloc] initWithNibName:@"ProvisionViewController" bundle:nil];
    provisionVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:provisionVC animated:YES];
}
@end
