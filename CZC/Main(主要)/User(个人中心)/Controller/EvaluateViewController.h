//
//  EvaluateViewController.h
//  CZC
//
//  Created by 张浩 on 15/10/9.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateViewController : PublicViewController

@property (weak, nonatomic) IBOutlet UIImageView *orderImg;
@property (weak, nonatomic) IBOutlet UILabel *orderInfoLab;
@property (weak, nonatomic) IBOutlet UILabel *orderOtherInfoLab;
@property (weak, nonatomic) IBOutlet UIButton *msBtn1;
@property (weak, nonatomic) IBOutlet UIButton *msBtn2;
@property (weak, nonatomic) IBOutlet UIButton *msBtn3;
@property (weak, nonatomic) IBOutlet UIButton *msBtn4;
@property (weak, nonatomic) IBOutlet UIButton *msBtn5;
@property (weak, nonatomic) IBOutlet UITextView *evaluateTextView;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UIButton *spBtn1;
@property (weak, nonatomic) IBOutlet UIButton *spBtn2;
@property (weak, nonatomic) IBOutlet UIButton *spBtn3;
@property (weak, nonatomic) IBOutlet UIButton *spBtn4;
@property (weak, nonatomic) IBOutlet UIButton *spBtn5;
@property (weak, nonatomic) IBOutlet UIButton *shBtn1;
@property (weak, nonatomic) IBOutlet UIButton *shBtn2;
@property (weak, nonatomic) IBOutlet UIButton *shBtn3;
@property (weak, nonatomic) IBOutlet UIButton *shBtn4;
@property (weak, nonatomic) IBOutlet UIButton *shBtn5;
@property (weak, nonatomic) IBOutlet UIButton *psBtn1;
@property (weak, nonatomic) IBOutlet UIButton *psBtn2;
@property (weak, nonatomic) IBOutlet UIButton *psBtn3;
@property (weak, nonatomic) IBOutlet UIButton *psBtn4;
@property (weak, nonatomic) IBOutlet UIButton *psBtn5;
- (IBAction)msClick:(id)sender;
- (IBAction)photoClick:(id)sender;
- (IBAction)spClick:(id)sender;
- (IBAction)shClick:(id)sender;
@end
