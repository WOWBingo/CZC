//
//  CommentObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	店铺评价
 */
#import <Foundation/Foundation.h>

@interface CommentObject : NSObject

@property (nonatomic, assign) NSInteger commentType;

@property (nonatomic, copy) NSString *commentTime;

@property (nonatomic, copy) NSString *reply;

@property (nonatomic, copy) NSString *continueComment;

@property (nonatomic, assign) NSInteger continueState;

@property (nonatomic, copy) NSString *continueReply;

@property (nonatomic, assign) NSInteger speed;

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *specValue;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, copy) NSString *continueTime;

@property (nonatomic, copy) NSString *continueReplyTime;

@property (nonatomic, assign) CGFloat productPrice;

@property (nonatomic, assign) NSInteger buyerAttitude;

@property (nonatomic, copy) NSString *productName;

@property (nonatomic, assign) NSInteger attitude;

@property (nonatomic, assign) NSInteger character;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *orderGuid;

@property (nonatomic, copy) NSString *replyTime;

@property (nonatomic, copy) NSString *shopLoginId;

@property (nonatomic, copy) NSString *productGuid;

@property (nonatomic, assign) NSInteger isAudit;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, assign) NSInteger isNick;


@end
