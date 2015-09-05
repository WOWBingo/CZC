//
//  ShoppingCarHeadView.m
//  CZC
//
//  Created by 周德艺 on 15/9/1.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShoppingCarHeadView.h"

@implementation ShoppingCarHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (ShoppingCarHeadView *)instanceView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ShoppingCarHeadView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

@end
