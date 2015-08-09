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


@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *ExtensionAttriutes;

@property (nonatomic, copy) NSString *ShopID;

@property (nonatomic, copy) NSString *SpecificationValue;

@property (nonatomic, copy) NSString *ProductName;

@property (nonatomic, assign) NSInteger BuyNumber;

@property (nonatomic, copy) NSString *ProductImg;

@property (nonatomic, assign) NSInteger ShopPrice;

@property (nonatomic, assign) NSInteger BuyPrice;

@property (nonatomic, assign) NSInteger IsShipment;

@property (nonatomic, copy) NSString *SpecificationName;

@property (nonatomic, copy) NSString *Attributes;

@property (nonatomic, copy) NSString *ProductGuid;

@property (nonatomic, copy) NSString *OrderInfoGuid;

@property (nonatomic, copy) NSString *MemLoginID;


@end
