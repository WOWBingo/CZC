//
//  ZDYCheckButton.m
//  CZC
//
//  Created by 周德艺 on 15/9/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ZDYCheckButton.h"

@implementation ZDYCheckButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect {
    _selectedImage = [UIImage imageNamed:@"chooseYes"];
    _unSelectedImage = [UIImage imageNamed:@"chooseNO"];
    [self setImage:_isSelected ? _selectedImage:_unSelectedImage forState:UIControlStateNormal];
}


- (BOOL)changeSelected{
    _isSelected = !_isSelected;
    [self setImage:_isSelected ? _selectedImage:_unSelectedImage forState:UIControlStateNormal];
    return _isSelected;
}

- (void)setSelectedWithBool:(BOOL)selected{
    _isSelected = selected;
    [self setImage:_isSelected ? _selectedImage:_unSelectedImage forState:UIControlStateNormal];
}


@end
