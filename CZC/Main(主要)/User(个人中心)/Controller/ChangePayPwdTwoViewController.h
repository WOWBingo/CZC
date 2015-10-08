//
//  ChangePayPwdTwoViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePayPwdTwoViewController : PublicViewController

@property (weak, nonatomic) IBOutlet UITextField *payPwdLab;
@property (weak, nonatomic) IBOutlet UITextField *payMakeSureLab;
- (IBAction)submitClick:(id)sender;
@end
