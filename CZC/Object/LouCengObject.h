//
//  LouCengObject.h
//  CZC
//
//  Created by 周德艺 on 15/9/23.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LouCengObject : NSObject


@property (nonatomic, copy) NSString *code;/**<分类code，查询楼层商品的时候需要用这个字段*/

@property (nonatomic, copy) NSString *id;/**< 分类id*/

@property (nonatomic, copy) NSString *categorylevel;/**<分类层级*/

@property (nonatomic, copy) NSString *name;/**<分类名称*/

@property (nonatomic ,strong) NSMutableArray *loucengProList;/**< 楼层推荐*/


@end
