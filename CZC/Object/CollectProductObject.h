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

@property (nonatomic, copy) NSString *smallImage;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *sellLoginID;

@property (nonatomic, copy) NSString *collectTime;

@property (nonatomic, copy) NSString *productGuid;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, assign) NSInteger shopPrice;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *name;

@end
