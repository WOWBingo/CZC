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

@property (nonatomic, assign) NSInteger CommentType;

@property (nonatomic, copy) NSString *CommentTime;

@property (nonatomic, copy) NSString *Reply;

@property (nonatomic, copy) NSString *ContinueComment;

@property (nonatomic, assign) NSInteger ContinueState;

@property (nonatomic, copy) NSString *ContinueReply;

@property (nonatomic, assign) NSInteger Speed;

@property (nonatomic, copy) NSString *ShopID;

@property (nonatomic, copy) NSString *Comment;

@property (nonatomic, copy) NSString *SpecValue;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, copy) NSString *ContinueTime;

@property (nonatomic, copy) NSString *ContinueReplyTime;

@property (nonatomic, assign) NSInteger ProductPrice;

@property (nonatomic, assign) NSInteger BuyerAttitude;

@property (nonatomic, copy) NSString *ProductName;

@property (nonatomic, assign) NSInteger Attitude;

@property (nonatomic, assign) NSInteger Character;

@property (nonatomic, copy) NSString *ShopName;

@property (nonatomic, copy) NSString *OrderGuid;

@property (nonatomic, copy) NSString *ReplyTime;

@property (nonatomic, copy) NSString *ShopLoginId;

@property (nonatomic, copy) NSString *ProductGuid;

@property (nonatomic, assign) NSInteger IsAudit;

@property (nonatomic, copy) NSString *Guid;

@property (nonatomic, assign) NSInteger IsNick;


@end
