//
//  OrderHeadView.h
//  CZC
//
//  Created by 张浩 on 15/9/10.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderHeadView : UIView
+(OrderHeadView *)instanceView;
@property (weak, nonatomic) IBOutlet UIButton *shopNameBtn;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLab;
- (IBAction)shopNameClick:(id)sender;
@end
