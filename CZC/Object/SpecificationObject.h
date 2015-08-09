//
//  SpecificationObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	单个规格属性
 */
#import <Foundation/Foundation.h>

@interface SpecificationObject : NSObject

@property (nonatomic, copy) NSString *specValueName;

@property (nonatomic, copy) NSString *specName;

@property (nonatomic, assign) NSInteger specid;

@property (nonatomic, assign) NSInteger guid;

@property (nonatomic, assign) NSInteger specValueid;

@property (nonatomic, copy) NSString *detail;

@end
