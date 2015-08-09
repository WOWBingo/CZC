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

@property (nonatomic, copy) NSString *OutOfStockOperate;

@property (nonatomic, assign) NSInteger OderStatus;

@property (nonatomic, assign) NSInteger ShouldPayPrice;

@property (nonatomic, assign) NSInteger RefundStatus;

@property (nonatomic, copy) NSString *Email;

@property (nonatomic, copy) NSString *Mobile;

@property (nonatomic, assign) NSInteger IsBuyComment;

@property (nonatomic, assign) NSInteger JoinActiveType;

@property (nonatomic, copy) NSString *Payment;

@property (nonatomic, copy) NSString *TradeID;

@property (nonatomic, copy) NSString *ConfirmTime;

@property (nonatomic, copy) NSString *UsedFavourTicket;

@property (nonatomic, copy) NSString *ShopName;

@property (nonatomic, assign) NSInteger AlreadPayPrice;

@property (nonatomic, assign) NSInteger UseScore;

@property (nonatomic, assign) NSInteger PostType;

@property (nonatomic, assign) NSInteger ScorePrice;

@property (nonatomic, copy) NSString *RegionCode;

@property (nonatomic, assign) NSInteger PaymentStatus;

@property (nonatomic, copy) NSString *ShopID;

@property (nonatomic, copy) NSString *PayMemo;

@property (nonatomic, copy) NSString *InvoiceType;

@property (nonatomic, copy) NSString *ActivityGuid;

@property (nonatomic, assign) NSInteger Discount;

@property (nonatomic, copy) NSString *shopPhone;

@property (nonatomic, assign) NSInteger InvoiceTax;

@property (nonatomic, copy) NSString *Tel;

@property (nonatomic, copy) NSString *ShipmentNumber;

@property (nonatomic, assign) NSInteger BlessCardPrice;

@property (nonatomic, copy) NSString *ClientToSellerMsg;

@property (nonatomic, copy) NSString *CreateTime;

@property (nonatomic, assign) NSInteger ShipmentStatus;

@property (nonatomic, assign) NSInteger PaymentPrice;

@property (nonatomic, assign) NSInteger IsSellComment;

@property (nonatomic, assign) NSInteger DispatchType;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, copy) NSString *SubstationID;

@property (nonatomic, copy) NSString *PackGuid;

@property (nonatomic, copy) NSString *BlessCardGuid;

@property (nonatomic, copy) NSString *InvoiceTitle;

@property (nonatomic, copy) NSString *InvoiceContent;

@property (nonatomic, assign) NSInteger PackPrice;

@property (nonatomic, copy) NSString *PayTime;

@property (nonatomic, copy) NSString *DispatchTime;

@property (nonatomic, copy) NSString *Postalcode;

@property (nonatomic, assign) NSInteger Deposit;

@property (nonatomic, assign) NSInteger DispatchPrice;

@property (nonatomic, copy) NSString *PaymentName;

@property (nonatomic, copy) NSString *ActvieContent;

@property (nonatomic, copy) NSString *LogisticsCompanyCode;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *PaymentGuid;

@property (nonatomic, assign) NSInteger ProductPrice;

@property (nonatomic, assign) NSInteger ShopID2;

@property (nonatomic, copy) NSString *ShopTel;

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *OrderNumber;

@property (nonatomic, copy) NSString *Address;

@property (nonatomic, assign) NSInteger SurplusPrice;

@property (nonatomic, strong) NSMutableArray *productList;


@end
