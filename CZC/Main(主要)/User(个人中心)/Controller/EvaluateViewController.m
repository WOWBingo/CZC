//
//  EvaluateViewController.m
//  CZC
//
//  Created by 张浩 on 15/10/9.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import "EvaluateViewController.h"

@interface EvaluateViewController ()

@end

@implementation EvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)msClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
        {
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)photoClick:(id)sender {
}

- (IBAction)spClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
        {
            [self.spBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.spBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.spBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.spBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.spBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.spBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.spBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.spBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.spBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.spBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.spBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.spBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)shClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
        {
            [self.shBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.shBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.shBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.shBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.shBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.shBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.shBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.shBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.shBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.shBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.shBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.shBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }

}

- (IBAction)psClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
        {
            [self.psBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.psBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.psBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.psBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.psBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.psBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.psBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.psBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.psBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.psBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.psBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.psBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
@end
