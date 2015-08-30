//
//  PointsRechargeViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RechargeView.h"
@interface PointsRechargeViewController : PublicViewController<RechargeViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UILabel *firstView_titleLab;
@property (weak, nonatomic) IBOutlet UITextField *firstView_textField;
@property (weak, nonatomic) IBOutlet UIImageView *firstView_backView;
@property (weak, nonatomic) IBOutlet UILabel *secondView_titleLab;
@property (weak, nonatomic) IBOutlet UIButton *secondView_Btn;
@property (weak, nonatomic) IBOutlet UIImageView *secondView_arrowImg;
@property (weak, nonatomic) IBOutlet UIImageView *secondView_backView;
@property (weak, nonatomic) IBOutlet UIButton *nextStepBtn;

@property(nonatomic,strong)RechargeView *rechargeView;
- (IBAction)chooseRechargeWayClick:(id)sender;
- (IBAction)nextStepClick:(id)sender;


@end
