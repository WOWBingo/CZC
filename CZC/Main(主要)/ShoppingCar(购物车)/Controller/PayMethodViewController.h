//
//  PresentedViewController.h
//  CZC
//
//  Created by 周德艺 on 15/9/20.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentObject.h"

@interface PayMethodViewController
    : UIViewController <UIViewControllerTransitioningDelegate>

@property(nonatomic, strong) NSMutableArray *paymentList;
@property(nonatomic, strong) PaymentObject *paymentObject; /**< 支付方式 */
@property(nonatomic, assign) void (^payment) (PaymentObject * paymentObject)
    ; /**< 支付方式 */

@property(weak, nonatomic) IBOutlet UIView *contentView;
@property(strong, nonatomic) IBOutlet UIButton *payMethodBtn;
- (IBAction)selectPayMethod:(id)sender;

@end
