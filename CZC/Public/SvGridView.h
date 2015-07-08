//
//  SvGridView.h
//  CZC
//
//  Created by 周德艺 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SvGridView : UIView

/** * @brief 网格间距，默认30 */
@property (nonatomic, assign) CGFloat gridSpacing;
/** * @brief 网格线宽度，默认为1 pixel (1.0f / [UIScreen mainScreen].scale) */
@property (nonatomic, assign) CGFloat gridLineWidth;
/** * @brief 网格颜色，默认蓝色 */
@property (nonatomic, strong) UIColor *gridColor;

@end
