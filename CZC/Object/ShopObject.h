//
//  ShopObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	店铺信息
 */
#import <Foundation/Foundation.h>

@interface ShopObject : NSObject


@property (nonatomic, copy) NSString *addressValue;/**< 地区*/

@property (nonatomic, copy) NSString *tel;/**< 电话 */

@property (nonatomic, assign) CGFloat attitudeBL;/**< 服务态度高于同行 */

@property (nonatomic, copy) NSString *name;/**< 店主名称 */

@property (nonatomic, assign) NSInteger shopID;/**< 店铺id */

@property (nonatomic, copy) NSString *address;/**< 地址 */

@property (nonatomic, assign) CGFloat haoPingLV;/**< 好评率 */

@property (nonatomic, copy) NSString *banner;/**< 店铺图片 */

@property (nonatomic, assign) CGFloat characterBL;/**<发货速度高于同行 */

@property (nonatomic, copy) NSString *phone;/**< 手机 */

@property (nonatomic, assign) NSInteger collectCount;/**< 收藏数量*/

@property (nonatomic, copy) NSString *pic;/**< 信誉图片 */

@property (nonatomic, copy) NSString *shopName;/**< 店铺名称*/

@property (nonatomic, assign) CGFloat *shopCharacter;/**< 发货速度 */

@property (nonatomic, assign) CGFloat speedBL;/**< 描述高于同行*/

@property (nonatomic, assign) CGFloat *shopAttitude;/**< 服务态度 */

@property (nonatomic, assign) CGFloat *shopSpeed;/**< 描述相符 */

@property (nonatomic, copy) NSString *guid;/**< 店铺guid */

@property (nonatomic, copy) NSString *shopUrl;/**< */

@property (nonatomic, copy) NSString *memLoginID;/**< */

@property (nonatomic, assign) NSInteger clickCount;/**< */

@property (nonatomic, assign) NSInteger shopReputation;/**< */

@property (nonatomic, copy) NSString *salesRange;/**< */

@property (nonatomic, copy) NSString *email;/**< */

@property (nonatomic, copy) NSString *mainGoods;/**< */

@property (nonatomic, copy) NSString *companyIntroduce;/**< */

@property (nonatomic, copy) NSString *applyTime;/**< */

@property (nonatomic, copy) NSString *addressCode;/**< */


@end
