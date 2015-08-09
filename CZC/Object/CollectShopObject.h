//
//  CollectShopObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	收藏店铺对象
 */
#import <Foundation/Foundation.h>

@interface CollectShopObject : NSObject

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *collectTime;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, copy) NSString *memLoginID2;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, assign) NSInteger collectCount;

@end
