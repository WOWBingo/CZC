//
//  PointsTransferViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointsTransferViewController : PublicViewController

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet UILabel *firstView_titleLab;
@property (weak, nonatomic) IBOutlet UITextField *firstView_textField;
@property (weak, nonatomic) IBOutlet UILabel *secondView_titleLab;
@property (weak, nonatomic) IBOutlet UITextField *secondView_textField;
@property (weak, nonatomic) IBOutlet UILabel *thirdView_titleLab;
@property (weak, nonatomic) IBOutlet UITextField *thirdView_textField;
@property (weak, nonatomic) IBOutlet UIButton *nextStepBtn;
- (IBAction)nextStepClick:(id)sender;
@end
