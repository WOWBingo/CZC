//
//  AccoutObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	用户信息
 */
#import <Foundation/Foundation.h>

@interface AccoutObject : NSObject

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *Url;

@property (nonatomic, copy) NSString *QQ;

@property (nonatomic, copy) NSString *PayPwd;

@property (nonatomic, copy) NSString *Email;

@property (nonatomic, assign) NSInteger Score;

@property (nonatomic, assign) NSInteger MemberRank;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *Mobile;

@property (nonatomic, copy) NSString *Pwd;

@property (nonatomic, assign) CGFloat AdvancePayment;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, assign) BOOL RememberMe;

@property (nonatomic, copy) NSString *RealName;

@end
