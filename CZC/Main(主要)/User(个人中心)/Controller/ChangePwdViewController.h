//
//  ChangePwdViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/26.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePwdViewController : PublicViewController

@property (weak, nonatomic) IBOutlet UITextField *oldPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *nowPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *makeSurePwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitClick:(id)sender;
@end
