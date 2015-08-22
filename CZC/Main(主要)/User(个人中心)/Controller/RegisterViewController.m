//
//  RegisterViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "RegisterViewController.h"
#import "ProvisionViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"用户注册";
    //设置导航按钮
//    self.navigationItem.leftBarButtonItem = self.backMenuBtn;
    
    self.scrollView = [[AutoScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44 - 20)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    self.isAgree = YES;
    //用户名
    self.userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, 50, self.scrollView.frame.size.width - LeftSpace * 2, ElementHeight)];
    UIView *userNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *userNameLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    userNameLeftImageView.image = [UIImage imageNamed:@"userName.png"];
    [userNameLeftView addSubview:userNameLeftImageView];
    self.userNameTextField.leftView = userNameLeftView;
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTextField.placeholder = @"请输入用户名";
    [self.userNameTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.userNameTextField.backgroundColor = [UIColor whiteColor];
    self.userNameTextField.layer.borderColor = BackGroundColor.CGColor;
    self.userNameTextField.layer.borderWidth = 0.5f;
    self.userNameTextField.textColor = DominantColor;
    self.userNameTextField.font = [UIFont systemFontOfSize:NormalFontSize];
    self.userNameTextField.delegate = self;
    [self.scrollView addSubview:self.userNameTextField];
    //密码
    self.passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, self.userNameTextField.frame.origin.y + self.userNameTextField.frame.size.height, self.scrollView.frame.size.width - LeftSpace * 2, ElementHeight)];
    UIView *passwordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *passwordLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    passwordLeftImageView.image = [UIImage imageNamed:@"passWord.png"];
    [passwordLeftView addSubview:passwordLeftImageView];
    self.passwordTextField.leftView = passwordLeftView;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.placeholder = @"请输入密码";
    [self.passwordTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.passwordTextField.backgroundColor = [UIColor whiteColor];
    self.passwordTextField.layer.borderColor = BackGroundColor.CGColor;
    self.passwordTextField.layer.borderWidth = 0.5f;
    self.passwordTextField.textColor = DominantColor;
    self.passwordTextField.font = [UIFont systemFontOfSize:NormalFontSize];
    self.passwordTextField.delegate = self;
    [self.scrollView addSubview:self.passwordTextField];
    
    //密码确认
    self.makeUserPwTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, self.passwordTextField.frame.origin.y + self.passwordTextField.frame.size.height, self.scrollView.frame.size.width - LeftSpace * 2, ElementHeight)];
    UIView *makeSurePwLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *makeSurePwLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    makeSurePwLeftImageView.image = [UIImage imageNamed:@"passWord.png"];
    [makeSurePwLeftView addSubview:makeSurePwLeftImageView];
    self.makeUserPwTextField.leftView = makeSurePwLeftView;
    self.makeUserPwTextField.leftViewMode = UITextFieldViewModeAlways;
    self.makeUserPwTextField.placeholder = @"请输入确认密码";
    [self.makeUserPwTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.makeUserPwTextField.backgroundColor = [UIColor whiteColor];
    self.makeUserPwTextField.layer.borderColor = BackGroundColor.CGColor;
    self.makeUserPwTextField.layer.borderWidth = 0.5f;
    self.makeUserPwTextField.textColor = DominantColor;
    self.makeUserPwTextField.font = [UIFont systemFontOfSize:NormalFontSize];
    self.makeUserPwTextField.delegate = self;
    [self.scrollView addSubview:self.makeUserPwTextField];
    
    //推荐码
    self.recommendedCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, self.makeUserPwTextField.frame.origin.y + self.makeUserPwTextField.frame.size.height, self.scrollView.frame.size.width - LeftSpace * 2, ElementHeight)];
    UIView *recommendedCodeLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *recommendedCodeLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    recommendedCodeLeftImageView.image = [UIImage imageNamed:@"recommendedCode.png"];
    [recommendedCodeLeftView addSubview:recommendedCodeLeftImageView];
    self.recommendedCodeTextField.leftView = recommendedCodeLeftView;
    self.recommendedCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    self.recommendedCodeTextField.placeholder = @"请输入推荐吗";
    [self.recommendedCodeTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.recommendedCodeTextField.backgroundColor = [UIColor whiteColor];
    self.recommendedCodeTextField.layer.borderColor = BackGroundColor.CGColor;
    self.recommendedCodeTextField.layer.borderWidth = 0.5f;
    self.recommendedCodeTextField.textColor = DominantColor;
    self.recommendedCodeTextField.font = [UIFont systemFontOfSize:NormalFontSize];
    [self.recommendedCodeTextField setSecureTextEntry:YES];
    self.recommendedCodeTextField.delegate = self;
    [self.scrollView addSubview:self.recommendedCodeTextField];
    
    //手机号
    self.telphoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, self.recommendedCodeTextField.frame.origin.y + self.recommendedCodeTextField.frame.size.height,self.scrollView.frame.size.width - LeftSpace * 2, ElementHeight)];
    //手机号Left
    UIView *telphoneLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *telphoneLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    telphoneLeftImageView.image = [UIImage imageNamed:@"telphone.png"];
    [telphoneLeftView addSubview:telphoneLeftImageView];
    self.telphoneTextField.leftView = telphoneLeftView;
    self.telphoneTextField.leftViewMode = UITextFieldViewModeAlways;
    //验证码Right
    UIView *verifyCodeRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, ElementHeight)];
    self.verifycodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.verifycodeBtn setFrame:CGRectMake(0, (ElementHeight - 20) / 2, 90, 20)];
    [self.verifycodeBtn setBackgroundColor:DominantColor];
    [self.verifycodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.verifycodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.verifycodeBtn.titleLabel setFont:[UIFont systemFontOfSize:NormalFontSize]];
    [self.verifycodeBtn addTarget:self action:@selector(messageVerifyCode:) forControlEvents:UIControlEventTouchUpInside];
    self.verifycodeBtn.layer.cornerRadius = self.verifycodeBtn.frame.size.height / 2;
    [verifyCodeRightView addSubview:self.verifycodeBtn];
    self.telphoneTextField.rightView = verifyCodeRightView;
    self.telphoneTextField.rightViewMode = UITextFieldViewModeAlways;
    self.telphoneTextField.placeholder = @"请输入手机号";
    [self.telphoneTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.telphoneTextField.backgroundColor = [UIColor whiteColor];
    self.telphoneTextField.layer.borderColor = BackGroundColor.CGColor;
    self.telphoneTextField.layer.borderWidth = 0.5f;
    self.telphoneTextField.textColor = DominantColor;
    self.telphoneTextField.font = [UIFont systemFontOfSize:NormalFontSize];
    self.telphoneTextField.delegate = self;
    self.telphoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:self.telphoneTextField];
    
    //验证码
    self.verifyCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(LeftSpace, self.telphoneTextField.frame.origin.y + self.telphoneTextField.frame.size.height, self.scrollView.frame.size.width - LeftSpace * 2, ElementHeight)];
    UIView *verifyCodeLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, ElementHeight)];
    UIImageView *verifyCodeLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (ElementHeight - 26) / 2, 26, 26)];
    verifyCodeLeftImageView.image = [UIImage imageNamed:@"verifycode.png"];
    [verifyCodeLeftView addSubview:verifyCodeLeftImageView];
    self.verifyCodeTextField.leftView = verifyCodeLeftView;
    self.verifyCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    self.verifyCodeTextField.placeholder = @"请输入4位验证码";
    [self.verifyCodeTextField setValue:PlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.verifyCodeTextField.backgroundColor = [UIColor whiteColor];
    self.verifyCodeTextField.layer.borderColor = BackGroundColor.CGColor;
    self.verifyCodeTextField.layer.borderWidth = 0.5f;
    self.verifyCodeTextField.textColor = DominantColor;
    self.verifyCodeTextField.font = [UIFont systemFontOfSize:NormalFontSize];
    self.verifyCodeTextField.delegate = self;
    self.verifyCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:self.verifyCodeTextField];
    
    
    //同意按钮
    self.agreeButton = [[UIButton alloc]initWithFrame:CGRectMake(LeftSpace, self.verifyCodeTextField.frame.origin.y + self.verifyCodeTextField.frame.size.height + 15, 18, 18)];
    [self.agreeButton setImage:[UIImage imageNamed:@"yesImage.png"] forState:UIControlStateNormal];
    [self.agreeButton addTarget:self action:@selector(agreeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.agreeButton];
    
    UILabel *agreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LeftSpace + self.agreeButton.frame.size.width + 5, self.verifyCodeTextField.frame.origin.y + self.verifyCodeTextField.frame.size.height + 10, 30, 30)];
    agreeLabel.text = @"我已阅读并同意";
    agreeLabel.textColor = [UIColor whiteColor];
    [agreeLabel setFont:[UIFont systemFontOfSize:NormalFontSize]];
    agreeLabel.backgroundColor = [UIColor clearColor];
    CGSize fittingSize = [agreeLabel sizeThatFits:CGSizeZero];
    CGRect frame = agreeLabel.frame;
    frame.size.width = fittingSize.width;
    agreeLabel.frame = frame;
    [self.scrollView addSubview:agreeLabel];
    
    //协议内容
    self.serviceTermButton = [[UIButton alloc]initWithFrame:CGRectMake(agreeLabel.frame.origin.x + agreeLabel.frame.size.width, self.verifyCodeTextField.frame.origin.y + self.verifyCodeTextField.frame.size.height + 10, 100, 30)];
    [self.serviceTermButton setTitle:@"《服务协议》" forState:UIControlStateNormal];
    self.serviceTermButton.backgroundColor = [UIColor clearColor];
    [self.serviceTermButton setTitleColor:DominantColor forState:UIControlStateNormal];
    [self.serviceTermButton.titleLabel setFont:[UIFont systemFontOfSize:NormalFontSize]];
    [self.serviceTermButton addTarget:self action:@selector(showServiceTerm:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.serviceTermButton];
    
    //注册
    self.registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(LeftSpace, self.agreeButton.frame.origin.y + self.agreeButton.frame.size.height + 20, self.scrollView.frame.size.width - LeftSpace * 2, 40)];
    [self.registerBtn setTitle:@"提 交" forState:UIControlStateNormal];
    self.registerBtn.backgroundColor = DominantColor;
    [self.registerBtn.titleLabel setFont:[UIFont systemFontOfSize:NormalFontSize]];
    [self.registerBtn addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
    self.registerBtn.layer.cornerRadius = self.registerBtn.frame.size.height / 2;
    [self.scrollView addSubview:self.registerBtn];
    
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
    
}

- (void)back {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)agreeButtonClick:(id)sender {
    if (self.isAgree) {
        self.isAgree = NO;
        [self.agreeButton setImage:[UIImage imageNamed:@"noImage.png"] forState:UIControlStateNormal];
    } else {
        self.isAgree = YES;
        [self.agreeButton setImage:[UIImage imageNamed:@"yesImage.png"] forState:UIControlStateNormal];
    }
}

//显示服务条款
- (IBAction)showServiceTerm:(id)sender {
    ProvisionViewController *provisionVC = [[ProvisionViewController alloc] initWithNibName:@"ProvisionViewController" bundle:nil];
    provisionVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:provisionVC animated:YES];
}

//获取短信验证码
- (void)messageVerifyCode:(id)sender {
    [self hidenKeyboard];
    NSString *telphone = self.telphoneTextField.text;
    
    //手机号码进行非空检查
    if ([telphone isEqualToString:@""]) {
        //请输入手机号
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写您的手机号" time:kHUDTime];
        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField afterDelay:kHUDTime];
        return;
    }
//    if (![PublicObject validateMobile:telphone]) {
//        //请输入正确的手机号
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写正确手机号" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField afterDelay:kHUDTime];
//        return;
//    }
//    
//    [self.verifycodeBtn setUserInteractionEnabled:NO];
//    //    http://172.19.2.6:8080/ytjw_server_external/client/authentic.do?user.idCard=123&user.telphone=222
//    NSString *indata = [NSString stringWithFormat:@"user.idCard=%@&user.telphone=%@",cardNumber,telphone];
//    [PublicObject requestData:kauthentic data:indata delegateView:self];
}

//注册新用户
- (IBAction)registerUser:(id)sender {
    [self hidenKeyboard];
//    NSString *cardNumber = self.cardNumberTextField.text;
//    NSString *realName = self.nameTextField.text;
//    realName = [realName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *nickName = self.nickNameTextField.text;
//    nickName = [nickName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *telphone = self.telphoneTextField.text;
//    NSString *password = self.passwordTextField.text;
//    NSString *md5Password = [PublicObject md5:password];
//    NSString *verifyCode = self.verifyCodeTextField.text;
//    
//    //对输入的用户信息进行非空检查
//    if ([cardNumber isEqualToString:@""]) {
//        //请输入身份证号
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写您的身份证号" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.cardNumberTextField afterDelay:kHUDTime];
//        return;
//    }
//    if ([realName isEqualToString:@""]) {
//        //请输入姓名
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写您的姓名" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.nameTextField  afterDelay:kHUDTime];
//        return;
//    }
//    if ([telphone isEqualToString:@""]) {
//        //请输入手机号
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写您的手机号" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField  afterDelay:kHUDTime];
//        return;
//    }
//    if ([password isEqualToString:@""]) {
//        //请输入密码
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写密码" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField  afterDelay:kHUDTime];
//        return;
//    }
//    if ([verifyCode isEqualToString:@""]) {
//        //请输入验证码
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写验证码" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.verifyCodeTextField  afterDelay:kHUDTime];
//        return;
//    }
//    if (![PublicObject validateCardNo:cardNumber]) {
//        //请输入正确的身份证号
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写正确身份证号" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.cardNumberTextField  afterDelay:kHUDTime];
//        return;
//    }
//    if (![PublicObject validateMobile:telphone]) {
//        //请输入正确的手机号
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写正确手机号" time:kHUDTime];
//        [self performSelector:@selector(shownKeyboard:) withObject:self.telphoneTextField  afterDelay:kHUDTime];
//        return;
//    }
//    if (![PublicObject validatePassword:password]) {
//        //请输入格式正确的密码
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请填写6-12位密码" time:kHUDTime];
//        self.passwordTextField.text = @"";
//        [self performSelector:@selector(shownKeyboard:) withObject:self.passwordTextField  afterDelay:kHUDTime];
//        return;
//    }
//    
//    if (!self.isAgree) {
//        [PublicObject showHUDView:self.view title:@"提示" content:@"请阅读并同意《服务协议》内容" time:kHUDTime];
//    }
//    //http://172.19.2.205:8080/ytjw_server_external/client/register.do?user.idCard=123&user.telphone=1122&user.password=cxzd12&yzm=123&user.nickname=121&user.realname=1212
//    NSString *indata = [NSString stringWithFormat:@"user.idCard=%@&user.telphone=%@&user.password=%@&yzm=%@&user.nickname=%@&user.realname=%@",cardNumber,telphone,md5Password,verifyCode,nickName,realName];
//    [PublicObject requestData:kregister data:indata delegateView:self];
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



@end
