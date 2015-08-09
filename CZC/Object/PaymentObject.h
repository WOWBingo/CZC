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

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, assign) NSInteger isCOD;

@property (nonatomic, assign) NSInteger charge;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, assign) NSInteger isPercent;

@property (nonatomic, assign) NSInteger orderID;

@property (nonatomic, copy) NSString *payType;

@property (nonatomic, copy) NSString *paymentType;

@property (nonatomic, copy) NSString *secondKey;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *merchantCode;

@property (nonatomic, copy) NSString *public_Key;

@property (nonatomic, assign) NSInteger forAdvancePayment;

@property (nonatomic, copy) NSString *private_Key;

@end
