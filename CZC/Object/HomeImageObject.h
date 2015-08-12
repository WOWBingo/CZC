//
//  HomeImage.h
//  CZC
//
//  Created by 周德艺 on 15/8/12.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	首页图片展示
 */
#import <Foundation/Foundation.h>

@interface HomeImageObject : NSObject


@property (nonatomic, assign) NSInteger homeImageID;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, assign) NSInteger configType;

@property (nonatomic, assign) NSInteger shopID;


@end
