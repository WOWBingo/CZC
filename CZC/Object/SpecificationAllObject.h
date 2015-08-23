//
//  SpecificationProudctObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	商品规格列表
 */
#import <Foundation/Foundation.h>
#import "SpecificationObject.h"

@interface SpecificationAllObject : NSObject

@property (strong, nonatomic) NSMutableArray *specificationList;
@property (copy, nonatomic) NSString *specValueName;

@end
