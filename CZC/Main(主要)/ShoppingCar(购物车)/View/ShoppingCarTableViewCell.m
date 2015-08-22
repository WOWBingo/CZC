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
    HJCAjustNumButton *btn = [[HJCAjustNumButton alloc] init];
    // 设置Frame，如不设置则默认为(0, 0, 110, 30)
    btn.frame = CGRectMake(0, 0, 80, 25);
    // 内容更改的block回调
    btn.callBack = ^(NSString *currentNum){
        NSLog(@"%@", currentNum);
    };    
    // 加到父控件上
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleImg.mas_right).offset(8.0);
        make.bottom.equalTo(_titleImg.mas_bottom);
        make.height.mas_equalTo(25.0);
        make.width.mas_equalTo(80.0);
    }];
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
