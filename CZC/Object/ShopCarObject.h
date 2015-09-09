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


@property (nonatomic, copy) NSString *shopID;/**< 店id */

@property (nonatomic, copy) NSString *shop;/**< 店名 */

@property (nonatomic, assign) NSInteger count;/**< 数量 */

@property (nonatomic, assign) CGFloat price;/**< 总价 */

@property (nonatomic, strong) NSMutableArray *productList;/**< 商品列表 */

@property (nonatomic, assign) BOOL isSelected;/**< 是否被选中 */


@end
