//
//  LouCengProductObject.h
//  CZC
//
//  Created by 周德艺 on 15/9/23.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LouCengProductObject : NSObject

@property (nonatomic, copy) NSString *Guid;/**<商品Guid*/

@property (nonatomic, copy) NSString *ShopID;/**<*/

@property (nonatomic, copy) NSString *ThumbImage;/**<商品图片*/

@property (nonatomic, copy) NSString *original;/**<商品图片*/

@property (nonatomic, copy) NSString *Name;/**<商品名称*/

@property (nonatomic, copy) NSString *ShortName;/**<商品名称*/

@property (nonatomic, copy) NSString *MoneySymbol;/**<价格符号*/

@property (nonatomic, copy) NSString *ShopPrice;/**<店铺价*/

@property (nonatomic, copy) NSString *MarketPrice;/**<市场价*/

@end
