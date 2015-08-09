//
//  ProductCatagoryObject.h
//  CZC
//
//  Created by  on 15/8/8.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCatagoryObject : NSObject


@property (nonatomic, assign) NSInteger OrderID;

@property (nonatomic, copy) NSString *Description;

@property (nonatomic, copy) NSString *Code;

@property (nonatomic, assign) BOOL IsLastLevel;

@property (nonatomic, assign) NSInteger CategoryLevel;

@property (nonatomic, assign) NSInteger FatherID;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *Keywords;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *MemLoginID;

@property (nonatomic, assign) NSInteger ShopID;

@end
