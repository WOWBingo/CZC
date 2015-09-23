//
//  RegisterViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface RegisterViewController : PublicViewController<UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *makeUserPwTextField;
@property (weak, nonatomic) IBOutlet UITextField *recommendedCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *telphoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *resignBtn;
@property (weak, nonatomic) IBOutlet UIButton *verifycodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *serviceTermButton;
@property (nonatomic, strong) NSTimer *timer;//短信验证码倒计时
@property (nonatomic, assign) int second;//验证码可重发秒数

@property (strong, nonatomic) void (^dismissView)(BOOL isSuccess);


@property (nonatomic, assign) BOOL isAgree;//是否统一服务条款
- (IBAction)getVerifycodeClick:(id)sender;
- (IBAction)resignClick:(id)sender;
- (IBAction)agreeClick:(id)sender;
- (IBAction)serviceClick:(id)sender;
@end
