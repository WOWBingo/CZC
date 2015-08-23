//
//  SpecificationNumCell.h
//  CZC
//
//  Created by 周德艺 on 15/8/23.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJCAjustNumButton.h"

@interface SpecificationNumCell : UITableViewCell
@property (nonatomic, strong) HJCAjustNumButton *numBtn;
@property (nonatomic, copy) void (^numBlock) (NSInteger num);

@end
