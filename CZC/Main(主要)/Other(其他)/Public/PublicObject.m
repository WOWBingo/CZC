//
//  PublicObject.m
//  CZC
//
//  Created by 周德艺 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicObject.h"
#import "TestObject.h"
#import "ProductsObject.h"


#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@implementation PublicObject

static PublicObject *publicObject = nil;

- (id)init{
    self = [super init];
    //    if (self) {
    //        NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    //        [dateForm setDateFormat:@"yyyy-MM-dd"];
    //        self.dateFormate = dateForm;
    //    }
    return self;
}



+(PublicObject*)sharePublicObject{
    if(publicObject==nil){
        publicObject = [[PublicObject alloc]init];
    }
    return publicObject;
}

/**
 *	获取用户信息
 *
 *	@return 用户对象
 */
+(AccoutObject *)getAccoutInfoDefault{
    //restore data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *accoutDic = [defaults objectForKey:kAccoutInfo_Default];
    AccoutObject *accout = [[AccoutObject alloc]init];
    if(accoutDic == nil)
    {
        return nil;
    }
    else{
        accout = [AccoutObject objectWithKeyValues:accoutDic];
        return accout;
    }
}

/**
 *  将null转换为空
 *
 *  @param oldString 源字符串
 *
 *  @return 新字符串
 */
+ (NSString *)convertNullString:(NSString *)oldString {
    if (oldString != nil && (NSNull *)oldString != [NSNull null]) {
        if ([oldString length] != 0) {
            return  oldString;
        } else {
            return @"";
        }
    } else {
        return @"";
    }
}

+ (NSNumber *)convertNullNumber:(NSNumber *)oldNum {
    if (oldNum!=nil && (NSNull *)oldNum != [NSNull null]) {
        return  oldNum;
    } else {
        return [NSNumber numberWithInt:0];
    }
}
/**
 *	画一条水平线
 *
 *	@param view		所在View
 *	@param x			起点x
 *	@param y			起点y
 *	@param width	长度
 *	@param color	颜色
 */
+ (void)drawHorizontalLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andColor:(UIColor*)color{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    [lineView setFrame:CGRectMake(x, y - SINGLE_LINE_ADJUST_OFFSET, width, SINGLE_LINE_WIDTH)];
    [lineView setBackgroundColor:color == nil ? [UIColor blackColor] : color];
    [view addSubview:lineView];
}
/**
 *	画一条竖直线
 *
 *	@param view		所在View
 *	@param x			起点x
 *	@param y			起点y
 *	@param height	高度
 *	@param color	颜色
 */
+ (void)drawVerticalLineOnView:(UIView *)view andX:(CGFloat)x andY:(CGFloat)y andHeigt:(CGFloat)height andColor:(UIColor*)color{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    [lineView setFrame:CGRectMake(x - SINGLE_LINE_ADJUST_OFFSET, y, SINGLE_LINE_WIDTH, height)];
    [lineView setBackgroundColor:color == nil ? [UIColor blackColor] : color];
    [view addSubview:lineView];
}

/**
 *	Dci转JSON字符串
 *
 *	@param object	dic数据
 *
 *	@return JSON字符串
 */
+ (NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

/**
 *	图片旋转
 *
 *	@param aImage	输入图片
 *
 *	@return 输出图片
 */
+(UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile {
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//身份证号
+ (BOOL)validateCardNo:(NSString *)cardNo {
    BOOL flag;
    if (cardNo.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:cardNo];
}

//密码验证
+ (BOOL)validatePassword:(NSString *)password {
    BOOL flag;
    if (password.length < 6 || password.length > 16) {
        flag = NO;
        return flag;
    }
    //    NSString *passwordTest = @"[A-Za-z0-9]{6,20}";
    //    NSPredicate *passwordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passwordTest];
    //    return [passwordPredicate evaluateWithObject:password];
    return YES;
}

@end
