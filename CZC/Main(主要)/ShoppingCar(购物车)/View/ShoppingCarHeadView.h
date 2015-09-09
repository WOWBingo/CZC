//
//  ShoppingCarHeadView.h
//  CZC
//
//  Created by 周德艺 on 15/9/1.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDYCheckButton.h"

@interface ShoppingCarHeadView : UIView
@property (weak, nonatomic) IBOutlet ZDYCheckButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

+ (ShoppingCarHeadView *)instanceView;
@end
