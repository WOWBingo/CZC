//
//  SpecificationNumCell.m
//  CZC
//
//  Created by 周德艺 on 15/8/23.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "SpecificationNumCell.h"
#import "Masonry.h"

@implementation SpecificationNumCell

- (void)awakeFromNib {
    // 创建对象
    _numBtn = [[HJCAjustNumButton alloc] init];
    // 设置Frame，如不设置则默认为(0, 0, 110, 30)
    _numBtn.frame = CGRectMake(0, 0, 80, 25);
    // 内容更改的block回调
    // 防止block中的循环引用
    __weak typeof(self) weakSelf = self;
    _numBtn.callBack = ^(NSString *currentNum){
        NSLog(@"%@", currentNum);
        weakSelf.numBlock(currentNum.intValue);
    };
    // 加到父控件上
    [self addSubview:_numBtn];
    [_numBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-40.0);
        make.top.equalTo(weakSelf.mas_top).offset(16.0);
        make.height.mas_equalTo(25.0);
        make.width.mas_equalTo(80.0);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
