//
//  OrderFootView.h
//  CZC
//
//  Created by 张浩 on 15/9/10.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderFootView : UIView
+(OrderFootView *)instanceView;
@property (weak, nonatomic) IBOutlet UILabel *proNumLab;
@property (weak, nonatomic) IBOutlet UILabel *totalLab;
@property (weak, nonatomic) IBOutlet UILabel *freightLab;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
- (IBAction)leftBtnClick:(id)sender;
- (IBAction)rightBtnClick:(id)sender;
@end
