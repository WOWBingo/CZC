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

@property (nonatomic, copy) NSString *ShopID;

@property (nonatomic, copy) NSString *ShopName;

@property (nonatomic, copy) NSString *Banner;

@property (nonatomic, copy) NSString *CollectTime;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, copy) NSString *MemLoginID2;

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, assign) NSInteger CollectCount;

@end
