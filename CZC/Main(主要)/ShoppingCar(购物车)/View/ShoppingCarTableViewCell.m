//
//  ShoppingCarTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShoppingCarTableViewCell.h"
#import "Masonry.h"

@implementation ShoppingCarTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    // 创建对象
    _numBtn = [[HJCAjustNumButton alloc] init];
    // 设置Frame，如不设置则默认为(0, 0, 110, 30)
    _numBtn.frame = CGRectMake(0, 0, 90, 28);
    // 内容更改的block回调
//    _numBtn.callBack = ^(NSString *currentNum){
//        NSLog(@"%@", currentNum);
//    };    
    // 加到父控件上
    [self addSubview:_numBtn];
    [_numBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleImg.mas_right).offset(8.0);
        make.bottom.equalTo(_titleImg.mas_bottom);
        make.height.mas_equalTo(28.0);
        make.width.mas_equalTo(90.0);
    }];
    [self setBackgroundColor:BackGroundColor];
    [_infoView setBackgroundColor:BackGroundColor];
    [_numBtn setBackgroundColor:BackGroundColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addClick:(id)sender {
}

- (IBAction)delClick:(id)sender {
}
@end
