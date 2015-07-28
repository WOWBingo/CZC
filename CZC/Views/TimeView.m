//
//  TimeView.m
//  CZC
//
//  Created by 张浩 on 15/7/26.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        //you init
    }
    return self;
}
- (IBAction)submitClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"submitTime"
                                                        object:nil];
}
- (IBAction)cancelClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelTime"
                                                        object:nil];
}

+(TimeView *)instanceTimeView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"TimeView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}
@end
