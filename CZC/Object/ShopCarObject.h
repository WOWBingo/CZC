//
//  ShopCarObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	购物车对象
 */
#import <Foundation/Foundation.h>
#import "ShopCarProductObject.h"

@interface ShopCarObject : NSObject


@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, copy) NSString *shop;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) CGFloat price;

@property (nonatomic, strong) NSMutableArray *productList;


@end
