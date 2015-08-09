//
//  ShopCarProductObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	购物车产品对象
 */
#import <Foundation/Foundation.h>

@interface ShopCarProductObject : NSObject


@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *extensionAttriutes;

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, assign) NSInteger repertoryCount;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *originalImge;

@property (nonatomic, copy) NSString *specificationValue;

@property (nonatomic, assign) NSInteger buyNumber;

@property (nonatomic, assign) NSInteger marketPrice;

@property (nonatomic, assign) NSInteger isPresent;

@property (nonatomic, assign) NSInteger buyPrice;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *repertoryNumber;

@property (nonatomic, copy) NSString *productGuid;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, copy) NSString *attributes;

@property (nonatomic, assign) NSInteger isJoinActivity;

@property (nonatomic, copy) NSString *specificationName;


@end
