//
//  ZDYCheckButton.h
//  CZC
//
//  Created by 周德艺 on 15/9/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDYCheckButton : UIButton

@property(nonatomic, assign)BOOL isSelected;
@property(nonatomic, assign)BOOL allIsSelected;
@property(nonatomic, strong)UIImage *selectedImage;
@property(nonatomic, strong)UIImage *unSelectedImage;
@property(nonatomic, strong)NSIndexPath *index;

- (BOOL)changeSelected;
- (void)setSelectedWithBool:(BOOL)selected;

@end
