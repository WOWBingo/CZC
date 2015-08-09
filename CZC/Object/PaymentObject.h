//
//  PaymentObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	支付方式
 */
#import <Foundation/Foundation.h>

@interface PaymentObject : NSObject

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, assign) NSInteger IsCOD;

@property (nonatomic, assign) NSInteger Charge;

@property (nonatomic, copy) NSString *Email;

@property (nonatomic, assign) NSInteger IsPercent;

@property (nonatomic, assign) NSInteger OrderID;

@property (nonatomic, copy) NSString *paytype;

@property (nonatomic, copy) NSString *PaymentType;

@property (nonatomic, copy) NSString *SecondKey;

@property (nonatomic, copy) NSString *NAME;

@property (nonatomic, copy) NSString *MerchantCode;

@property (nonatomic, copy) NSString *Public_Key;

@property (nonatomic, assign) NSInteger ForAdvancePayment;

@property (nonatomic, copy) NSString *Private_Key;

@end
