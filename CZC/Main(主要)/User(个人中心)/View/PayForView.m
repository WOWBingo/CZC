//
//  PayForView.m
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import "PayForView.h"

@implementation PayForView {
    MBProgressHUD *HUD;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)awakeFromNib{
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:gesture];
    [self.passwordTextfield becomeFirstResponder];
}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [self.passwordTextfield resignFirstResponder];
    [self.delegate hidenPayForView];
}
- (IBAction)backClick:(id)sender {
    [self.delegate hidenPayForView];
}

- (IBAction)payForClick:(id)sender {
#pragma mark - 47. 预付款支付
    /**47. 预付款支付  http://api/order/BuyAdvancePayment/111111?OrderNumber=2014374374932749&PayPwd=123456*/
    NSString *param = [NSString stringWithFormat:@"%@?OrderNumber=%@&PayPwd=%@",kAccountObject.memLoginID,self.orderNumber,self.passwordTextfield.text];
    [CZCService GETmethod:kBuyAdvancePayment_URL andParameters:param andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSLog(@"%@",result);
        if (result) {
            BOOL success = [result objectForKey:@"return"];
            if (success) {
                NSLog(@"支付成功");
                [self showHUDViewTitle:@"支付成功" info:@"" andCodes:^{
                    [self.passwordTextfield resignFirstResponder];
                    [self.delegate hidenPayForViewAndBack];
                }];
            }else{
                NSLog(@"失败");
                [self showHUDViewTitle:@"支付失败" info:@"" andCodes:^{
                }];
            }
        }
        else{
            [self showHUDViewTitle:@"支付失败" info:@"" andCodes:^{
            }];
        }
    }];
}


- (IBAction)forgetPwdClick:(id)sender {
}
- (void)showHUDViewTitle:(NSString *)title info:(NSString*)info andCodes:(void (^)())finish{
    HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:HUD];
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = title;
    HUD.margin = 20.f;
    HUD.dimBackground = NO;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        finish();
    }];
}
@end
