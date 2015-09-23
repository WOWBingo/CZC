//
//  LouCengObject.h
//  CZC
//
//  Created by 周德艺 on 15/9/23.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LouCengObject : NSObject


@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *categorylevel;

@property (nonatomic, copy) NSString *name;

@property (nonatomic ,strong) NSMutableArray *loucengProList;/**< 楼层推荐*/


@end
