//
//  AddressObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	收货地址
 */

#import <Foundation/Foundation.h>

@interface AddressObject : NSObject

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *modifyTime;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *postalcode;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *createUser;

@property (nonatomic, copy) NSString *addressCode;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *addressValue;

@property (nonatomic, assign) NSInteger isDefault;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, copy) NSString *modifyUser;


@end
