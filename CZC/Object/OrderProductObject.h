//
//  OrderProductObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	订单产品对象
 */
#import <Foundation/Foundation.h>

@interface OrderProductObject : NSObject


@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *extensionAttriutes;

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, copy) NSString *specificationValue;

@property (nonatomic, copy) NSString *productName;

@property (nonatomic, assign) NSInteger buyNumber;

@property (nonatomic, copy) NSString *productImg;

@property (nonatomic, assign) NSInteger shopPrice;

@property (nonatomic, assign) NSInteger buyPrice;

@property (nonatomic, assign) NSInteger isShipment;

@property (nonatomic, copy) NSString *specificationName;

@property (nonatomic, copy) NSString *attributes;

@property (nonatomic, copy) NSString *productGuid;

@property (nonatomic, copy) NSString *orderInfoGuid;

@property (nonatomic, copy) NSString *memLoginID;


@end
