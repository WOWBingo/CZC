//
//  HomeViewCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HomeViewCell.h"


@implementation HomeViewCell

- (void)awakeFromNib {
    // Initialization code
    [PublicObject oneLineOnView:self andX:11 andY:11 andWidth:0 andHeigt:150];
    [PublicObject oneLineOnView:self andX:21 andY:21 andWidth:320 andHeigt:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getMore:(id)sender {
}
@end
