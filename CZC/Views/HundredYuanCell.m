//
//  HundredYuanCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HundredYuanCell.h"


@implementation HundredYuanCell

- (void)awakeFromNib {
    // Initialization code
    CGFloat lineWidth = SCREEN_WIDTH/2;
    [PublicObject drawHorizontalLineOnView:self.showView
                                      andX:lineWidth
                                      andY:lineWidth/2
                                  andWidth:lineWidth
                                  andColor:[UIColor whiteColor]];
    [PublicObject drawVerticalLineOnView:self.showView
                                    andX:lineWidth
                                    andY:0
                                andHeigt:lineWidth
                                andColor:[UIColor whiteColor]];
    [PublicObject drawVerticalLineOnView:self.showView
                                    andX:lineWidth/2*3
                                    andY:lineWidth/2
                                andHeigt:lineWidth/2
                                andColor:[UIColor whiteColor]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getMore:(id)sender {
}

- (IBAction)productInfo:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 0:
            NSLog(@"0000");
            break;
        case 1:
            NSLog(@"1111");
            break;
        case 2:
            NSLog(@"2222");
            break;
        case 3:
            NSLog(@"3333");
            break;
            
        default:
            break;
    }
    
}

@end
