//
//  OrderHeadView.m
//  CZC
//
//  Created by 张浩 on 15/9/10.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderHeadView.h"

@implementation OrderHeadView
+(OrderHeadView *)instanceView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"OrderHeadView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)shopNameClick:(id)sender {
}
@end
