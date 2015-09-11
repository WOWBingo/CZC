//
//  OrderDetailHeadView.h
//  CZC
//
//  Created by 张浩 on 15/9/11.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailHeadView : UIView
+(OrderDetailHeadView *)instanceView;
@property (weak, nonatomic) IBOutlet UIButton *shopNameBtn;

- (IBAction)shopNameClick:(id)sender;
@end
