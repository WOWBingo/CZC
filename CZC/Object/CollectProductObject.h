//
//  CollectProductObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	收藏产品列表
 */
#import <Foundation/Foundation.h>

@interface CollectProductObject : NSObject

@property (nonatomic, copy) NSString *SmallImage;

@property (nonatomic, copy) NSString *ShopName;

@property (nonatomic, copy) NSString *SellLoginID;

@property (nonatomic, copy) NSString *CollectTime;

@property (nonatomic, copy) NSString *ProductGuid;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, assign) NSInteger ShopPrice;

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *Name;

@end
