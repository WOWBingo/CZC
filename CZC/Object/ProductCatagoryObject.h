//
//  ProductCatagoryObject.h
//  CZC
//
//  Created by  on 15/8/8.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCatagoryObject : NSObject


@property (nonatomic, assign) NSInteger orderID;

@property (nonatomic, copy) NSString *description;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, assign) BOOL isLastLevel;

@property (nonatomic, assign) NSInteger categoryLevel;

@property (nonatomic, assign) NSInteger fatherID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, assign) NSInteger shopID;

@end
