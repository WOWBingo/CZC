//
//  PublicObject.h
//  CZC
//
//  Created by 周德艺 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface PublicObject : NSObject

+ (PublicObject*)sharePublicObject;
+(NSString*)convertNullString:(NSString *)oldString;
+(NSNumber*)convertNullNumber:(NSNumber*)oldNum;

+ (void)drawHorizontalLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andColor:(UIColor*)color;
+ (void)drawVerticalLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andHeigt:(CGFloat)height andColor:(UIColor*)color;

+ (UIImage *)fixOrientation:(UIImage *)aImage;//图片旋转

@end
