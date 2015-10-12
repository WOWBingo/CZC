//
//  OrderFootView.h
//  CZC
//
//  Created by 张浩 on 15/9/10.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderBtn.h"
@protocol OrderFootViewDelegate
-(void)orderFootViewBtnClick:(OrderBtn *)btn;
@end
@interface OrderFootView : UIView
+(OrderFootView *)instanceView;
@property (weak, nonatomic) IBOutlet UILabel *proNumLab;
@property (weak, nonatomic) IBOutlet UILabel *totalLab;
@property (weak, nonatomic) IBOutlet UILabel *freightLab;
@property (weak, nonatomic) IBOutlet OrderBtn *oneBtn;
@property (weak, nonatomic) IBOutlet OrderBtn *twoBtn;
@property (weak, nonatomic) IBOutlet OrderBtn *threeBtn;

@property (nonatomic,assign)id <OrderFootViewDelegate>delegate;

- (IBAction)btnClick:(id)sender;
@end
