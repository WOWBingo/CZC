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

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *Mobile;

@property (nonatomic, copy) NSString *ModifyTime;

@property (nonatomic, copy) NSString *Email;

@property (nonatomic, copy) NSString *Postalcode;

@property (nonatomic, copy) NSString *Tel;

@property (nonatomic, copy) NSString *NAME;

@property (nonatomic, copy) NSString *CreateUser;

@property (nonatomic, copy) NSString *AddressCode;

@property (nonatomic, copy) NSString *Address;

@property (nonatomic, assign) NSInteger IsDefault;

@property (nonatomic, copy) NSString *CreateTime;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, copy) NSString *ModifyUser;


@end
