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

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *QQ;

@property (nonatomic, copy) NSString *payPwd;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, assign) NSInteger memberRank;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *pwd;

@property (nonatomic, assign) CGFloat advancePayment;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, assign) BOOL rememberMe;

@property (nonatomic, copy) NSString *realName;

@end
