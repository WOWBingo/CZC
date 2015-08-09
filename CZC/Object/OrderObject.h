//
//  OrderObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	订单详情
 */
#import <Foundation/Foundation.h>

@interface OrderObject : NSObject

@property (nonatomic, copy) NSString *outOfStockOperate;

@property (nonatomic, assign) NSInteger oderStatus;

@property (nonatomic, assign) CGFloat shouldPayPrice;

@property (nonatomic, assign) NSInteger refundStatus;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, assign) NSInteger isBuyComment;

@property (nonatomic, assign) NSInteger joinActiveType;

@property (nonatomic, copy) NSString *payment;

@property (nonatomic, copy) NSString *tradeID;

@property (nonatomic, copy) NSString *confirmTime;

@property (nonatomic, copy) NSString *usedFavourTicket;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, assign) CGFloat alreadPayPrice;

@property (nonatomic, assign) NSInteger useScore;

@property (nonatomic, assign) NSInteger postType;

@property (nonatomic, assign) CGFloat scorePrice;

@property (nonatomic, copy) NSString *regionCode;

@property (nonatomic, assign) NSInteger paymentStatus;

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, copy) NSString *payMemo;

@property (nonatomic, copy) NSString *invoiceType;

@property (nonatomic, copy) NSString *activityGuid;

@property (nonatomic, assign) NSInteger discount;

@property (nonatomic, copy) NSString *shopPhone;

@property (nonatomic, assign) NSInteger invoiceTax;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *shipmentNumber;

@property (nonatomic, assign) CGFloat blessCardPrice;

@property (nonatomic, copy) NSString *clientToSellerMsg;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) NSInteger shipmentStatus;

@property (nonatomic, assign) CGFloat paymentPrice;

@property (nonatomic, assign) NSInteger isSellComment;

@property (nonatomic, assign) NSInteger dispatchType;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, copy) NSString *substationID;

@property (nonatomic, copy) NSString *packGuid;

@property (nonatomic, copy) NSString *blessCardGuid;

@property (nonatomic, copy) NSString *invoiceTitle;

@property (nonatomic, copy) NSString *invoiceContent;

@property (nonatomic, assign) CGFloat packPrice;

@property (nonatomic, copy) NSString *payTime;

@property (nonatomic, copy) NSString *dispatchTime;

@property (nonatomic, copy) NSString *postalcode;

@property (nonatomic, assign) NSInteger deposit;

@property (nonatomic, assign) CGFloat dispatchPrice;

@property (nonatomic, copy) NSString *paymentName;

@property (nonatomic, copy) NSString *actvieContent;

@property (nonatomic, copy) NSString *logisticsCompanyCode;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *paymentGuid;

@property (nonatomic, assign) CGFloat productPrice;

@property (nonatomic, assign) NSInteger shopID2;

@property (nonatomic, copy) NSString *shopTel;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *orderNumber;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) CGFloat surplusPrice;

@property (nonatomic, strong) NSMutableArray *productList;


@end
