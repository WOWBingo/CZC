//
//  RegionObject.h
//  CZC
//
//  Created by 张浩 on 15/9/19.
//  Copyright © 2015年 周德艺. All rights reserved.
//
/**
 *	省市区对象
 */
#import <Foundation/Foundation.h>

@interface RegionObject : NSObject

@property (nonatomic, copy) NSString *categoryLevel;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *fatherID;

@property (nonatomic, copy) NSString *isDeleted;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *orderID;

@property (nonatomic, strong) NSMutableArray *subClassArr;

@end
