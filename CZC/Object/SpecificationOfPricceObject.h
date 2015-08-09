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

@interface SpecificationOfPricceObject : NSObject


@property (nonatomic, copy) NSString *specTotalId;

@property (nonatomic, copy) NSString *tbProp;

@property (nonatomic, copy) NSString *specDetail;

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, copy) NSString *productGuid;

@property (nonatomic, assign) CGFloat goodsStock;

@property (nonatomic, assign) CGFloat salesCount;

@property (nonatomic, copy) NSString *goodsNumber;

@property (nonatomic, assign) CGFloat goodsPrice;

@property (nonatomic, copy) NSString *goodColor;


@end
