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

@property (nonatomic, copy) NSString *sendTime;

@property (nonatomic, assign) NSInteger isRead;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger isDeleted;

@end
