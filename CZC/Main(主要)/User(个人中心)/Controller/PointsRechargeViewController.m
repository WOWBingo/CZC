//
//  PointsRechargeViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PointsRechargeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RechargeView.h"
#import "AppDelegate.h"
@interface PointsRechargeViewController ()

@end

@implementation PointsRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分充值";
    self.firstView_textField.keyboardType = UIKeyboardTypeNumberPad;
    self.chooseIndex = 0; //1支付宝  2银联  0什么都没选
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [self.firstView_textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)chooseRechargeWayClick:(id)sender {
    //获得nib视图数组
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"RechargeView" owner:self options:nil];
    //得到第一个UIView
    self.rechargeView = [nib objectAtIndex:0];
    //获得屏幕的Frame
    CGRect tmpFrame = [[UIScreen mainScreen] bounds];
    self.rechargeView.frame = tmpFrame;
    //添加视图
    self.rechargeView.backgroundColor = [UIColor clearColor];
    
    self.rechargeView.delegate = self;
    self.rechargeView.chooseIndex = self.chooseIndex;
    //添加手势
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.rechargeView addGestureRecognizer:singleTap];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.window addSubview:self.rechargeView];

}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender

{
    CGPoint point = [sender locationInView:self.view];
    
    NSLog(@"handleSingleTap!pointx:%f,y:%f",point.x,point.y);
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *mbV in appDelegate.window.subviews) {
        if ([mbV isKindOfClass:[RechargeView class]]) {
            mbV.hidden = YES;
        }
    }
    
}
- (IBAction)nextStepClick:(id)sender {
}
-(void)changeRecharge:(NSInteger)btnTag{
    NSLog(@"%ld",(long)btnTag);
    [self hidenKeyboard];
    self.secondView_textField.placeholder = @"";
    switch (btnTag) {
        case 0:
            [self.secondView_Btn setBackgroundImage:[UIImage imageNamed:@"zfbSmall.png"] forState:UIControlStateNormal];    //设置button背景显示图片
            self.chooseIndex = 1;
            break;
        case 1:
            [self.secondView_Btn setBackgroundImage:[UIImage imageNamed:@"ylSmall.png"] forState:UIControlStateNormal];
            self.chooseIndex = 2;
            break;
        default:
            break;
    }
    //隐藏
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *mbV in appDelegate.window.subviews) {
        if ([mbV isKindOfClass:[RechargeView class]]) {
            mbV.hidden = YES;
        }
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //隐藏
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *mbV in appDelegate.window.subviews) {
        if ([mbV isKindOfClass:[RechargeView class]]) {
            mbV.hidden = YES;
        }
    }
}
@end
