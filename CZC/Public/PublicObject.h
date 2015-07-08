//
//  PublicObject.h
//  CZC
//
//  Created by 周德艺 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PublicObject : NSObject

+ (PublicObject*)sharePublicObject;

+ (void)oneLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andHeigt:(CGFloat)height;

@end
