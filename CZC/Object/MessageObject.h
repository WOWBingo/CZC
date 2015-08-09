//
//  MessageObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	消息列表
 */
#import <Foundation/Foundation.h>

@interface MessageObject : NSObject

@property (nonatomic, copy) NSString *SendTime;

@property (nonatomic, assign) NSInteger IsRead;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, copy) NSString *Type;

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, copy) NSString *Title;

@property (nonatomic, copy) NSString *Content;

@property (nonatomic, assign) NSInteger IsDeleted;

@end
