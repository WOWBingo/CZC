//
//  OrderDetailFootView.h
//  CZC
//
//  Created by 张浩 on 15/9/11.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailFootView : UIView
+(OrderDetailFootView *)instanceView;
@property (weak, nonatomic) IBOutlet UILabel *totalLab;
@property (weak, nonatomic) IBOutlet UILabel *freightLab;
@property (weak, nonatomic) IBOutlet UIButton *telBtn;
@property (weak, nonatomic) IBOutlet UIButton *sellerBtn;
- (IBAction)telClick:(id)sender;
- (IBAction)sellerClick:(id)sender;
@end
