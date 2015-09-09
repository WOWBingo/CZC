//
//  ShoppingCarHeadView.m
//  CZC
//
//  Created by 周德艺 on 15/9/1.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShoppingCarHeadView.h"

@implementation ShoppingCarHeadView


- (void)drawRect:(CGRect)rect {

    [PublicObject drawHorizontalLineOnView:self andX:0 andY:0 andWidth:SCREEN_WIDTH andColor:[UIColor grayColor]];
    [PublicObject drawHorizontalLineOnView:self andX:0 andY:6 andWidth:SCREEN_WIDTH andColor:[UIColor grayColor]];
}

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
