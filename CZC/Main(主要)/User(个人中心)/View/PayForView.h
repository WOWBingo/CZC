//
//  PayForView.h
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PayForViewDelegate
-(void)hidenPayForView;
-(void)hidenPayForViewAndBack;
@end
@interface PayForView : UIView<UITextFieldDelegate,MBProgressHUDDelegate>
@property (weak, nonatomic) IBOutlet UIView *payForView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *parForBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (nonatomic,assign) id <PayForViewDelegate>delegate;
@property (nonatomic,strong) NSString *orderNumber;
- (IBAction)backClick:(id)sender;
- (IBAction)payForClick:(id)sender;
- (IBAction)forgetPwdClick:(id)sender;
@end
