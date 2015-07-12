//
//  PublicObject.m
//  CZC
//
//  Created by 周德艺 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicObject.h"


#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@implementation PublicObject

static PublicObject *publicObject = nil;

- (id)init{
    self = [super init];
    //    if (self) {
    //        NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    //        [dateForm setDateFormat:@"yyyy-MM-dd"];
    //        self.dateFormate = dateForm;
    //    }
    return self;
}



+(PublicObject*)sharePublicObject{
    if(publicObject==nil){
        publicObject = [[PublicObject alloc]init];
    }
    return publicObject;
}

//画一条水平线
+ (void)drawHorizontalLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andColor:(UIColor*)color{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    [lineView setFrame:CGRectMake(x, y - SINGLE_LINE_ADJUST_OFFSET, width, SINGLE_LINE_WIDTH)];
    [lineView setBackgroundColor:color == nil ? [UIColor blackColor] : color];
    [view addSubview:lineView];
}
//画一条竖直线
+ (void)drawVerticalLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andHeigt:(CGFloat)height andColor:(UIColor*)color{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    [lineView setFrame:CGRectMake(x - SINGLE_LINE_ADJUST_OFFSET, y, SINGLE_LINE_WIDTH, height)];
    [lineView setBackgroundColor:color == nil ? [UIColor blackColor] : color];
    [view addSubview:lineView];
}

@end
