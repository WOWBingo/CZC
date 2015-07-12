//
//  HomeViewCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HomeViewCell.h"
#import "HomeViewButton.h"


@implementation HomeViewCell

- (void)awakeFromNib {
    // Initialization code
    CGFloat lineWidth = SCREEN_WIDTH/3;
    [PublicObject drawHorizontalLineOnView:self.showView
                                      andX:0
                                      andY:lineWidth
                                  andWidth:SCREEN_WIDTH
                                  andColor:[UIColor whiteColor]];
    [PublicObject drawVerticalLineOnView:self.showView
                                    andX:SCREEN_WIDTH/2
                                    andY:0
                                andHeigt:lineWidth
                                andColor:[UIColor whiteColor]];
    [PublicObject drawVerticalLineOnView:self.showView
                                    andX:lineWidth
                                    andY:lineWidth
                                andHeigt:lineWidth
                                andColor:[UIColor whiteColor]];
    [PublicObject drawVerticalLineOnView:self.showView
                                    andX:lineWidth*2
                                    andY:lineWidth
                                andHeigt:lineWidth
                                andColor:[UIColor whiteColor]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getMore:(id)sender {
}

- (IBAction)shopInfo:(id)sender{
    HomeViewButton *button = (HomeViewButton*)sender;
    NSLog(@"%d-----%d",button.cellNum,button.tag);

}
//设置cell上button标识符
- (void)buttonAddCellNum:(NSInteger)cellNum{
    _moreBtn.tag = cellNum;
    _topLeftBtn.cellNum = cellNum;
    _topRightBtn.cellNum = cellNum;
    _bottomLeftBtn.cellNum = cellNum;
    _bottomMidBtn.cellNum = cellNum;
    _bottomRightBtn.cellNum = cellNum;
}

@end
