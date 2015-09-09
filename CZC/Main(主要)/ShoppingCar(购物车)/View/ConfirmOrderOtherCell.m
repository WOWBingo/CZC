//
//  ConfirmOrderOtherCell.m
//  CZC
//
//  Created by 周德艺 on 15/9/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ConfirmOrderOtherCell.h"

@implementation ConfirmOrderOtherCell

- (void)awakeFromNib {
    // Initialization code
    [PublicObject drawHorizontalLineOnView:self
                                      andX:0
                                      andY:35
                                  andWidth:SCREEN_WIDTH
                                  andColor:[UIColor lightGrayColor]];
    [PublicObject drawHorizontalLineOnView:self
                                      andX:0
                                      andY:84
                                  andWidth:SCREEN_WIDTH
                                  andColor:[UIColor lightGrayColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)chooseLogistics:(id)sender {
}
@end
