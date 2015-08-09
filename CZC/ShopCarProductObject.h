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


@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *ExtensionAttriutes;

@property (nonatomic, copy) NSString *ShopID;

@property (nonatomic, assign) NSInteger RepertoryCount;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *OriginalImge;

@property (nonatomic, copy) NSString *SpecificationValue;

@property (nonatomic, assign) NSInteger BuyNumber;

@property (nonatomic, assign) NSInteger MarketPrice;

@property (nonatomic, assign) NSInteger IsPresent;

@property (nonatomic, assign) NSInteger BuyPrice;

@property (nonatomic, copy) NSString *CreateTime;

@property (nonatomic, copy) NSString *ShopName;

@property (nonatomic, copy) NSString *RepertoryNumber;

@property (nonatomic, copy) NSString *ProductGuid;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, copy) NSString *Attributes;

@property (nonatomic, assign) NSInteger IsJoinActivity;

@property (nonatomic, copy) NSString *SpecificationName;


@end
