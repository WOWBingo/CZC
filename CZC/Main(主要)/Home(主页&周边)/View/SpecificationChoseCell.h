//
//  SpecificationChoseCell.h
//  CZC
//
//  Created by 周德艺 on 15/8/23.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecificationOfPriceObject.h"

@interface SpecificationChoseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *specificationNameLabel;
@property (weak, nonatomic) IBOutlet UIView *specificationView;

#pragma mark - 数据
@property (nonatomic, strong) NSMutableArray *tags;


/**
 *	回调
 */
@property (nonatomic, copy) void (^specificationBlock)(NSString *specificationStr);


- (void)reloadView:(NSArray *)array;
- (IBAction)choseSpecification:(id)sender;

@end
