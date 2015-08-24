//
//  SpecificationOfPricceObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	根据规格得到价格对象
 */
#import <Foundation/Foundation.h>

@interface SpecificationOfPriceObject : NSObject


@property (nonatomic, assign) CGFloat goodsPrice;/**< 价格 */

@property (nonatomic, copy) NSString *goodColor;/**<  */

@property (nonatomic, assign) NSInteger goodsStock;/**< 库存数 */

@property (nonatomic, copy) NSString *goodsNumber;/**< 编号 */

@property (nonatomic, copy) NSString *specTotalId;/**<  */

@property (nonatomic, copy) NSString *tbProp;/**<  */

@property (nonatomic, copy) NSString *specDetail;/**< 传入规格值 */

@property (nonatomic, copy) NSString *shopID;/**< 店铺id */

@property (nonatomic, copy) NSString *productGuid;/**< 产品id */

@property (nonatomic, assign) CGFloat salesCount;/**<  */


@end
