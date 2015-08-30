//
//  BillingOrdersDetailsViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillingOrdersDetailsViewController : PublicViewController

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet UILabel *firstView_lab;
@property (weak, nonatomic) IBOutlet UIImageView *secondView_img;
@property (weak, nonatomic) IBOutlet UILabel *secondView_titleLab;
@property (weak, nonatomic) IBOutlet UILabel *secondView_amountLab;
@property (weak, nonatomic) IBOutlet UILabel *thirdView_lab;
@end
