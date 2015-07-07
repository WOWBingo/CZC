//
//  Key.h
//  CZC
//
//  Created by 周德艺 on 15/7/5.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef CZC_Key_h
#define CZC_Key_h


#pragma mark - 网络

#define APIService [CZCAPIService getCZCAPIService]

#define kConnectionFailureError @"连接失败，请检查网络连接"
#define kRequestTimedOutError   @"请求超时，请检查连接网络"
#define kAuthenticationError    @"认证失败，请检查网络连接"

#define kPublic_URL @"http://app.czctgw.com/api/"

#pragma mark - 常量
#define kHUDTime 1.0f
#define kAnimaTime 0.30f
#define kLastCatchTime @"LastCatchTime"
#define kLastCatchInfoTime @"LastCatchTime_Info"
#define kIsNetConnect @"isNetConnect"
#define PASSWORD @"password"//密码
#define USERINFO @"userInfo"//用户信息
#define ISAUTOLOGIN @"isAutoLogin"//是否自动登录的key

//程序主色调
#define DominantColor [UIColor colorWithRed:28.0/255.0 green:164.0/255.0 blue:247.0/255.0 alpha:1.0]
#define NavigationColor [UIColor colorWithRed:0/255.0 green:150.0/255.0 blue:245.0/255.0 alpha:1.0]
#define BackGroundColor [UIColor colorWithRed:243.0/255.0 green:244.0/255.0 blue:250.0/255.0 alpha:1.0]
#define PlaceholderColor [UIColor colorWithRed:89.0/255.0 green:190.0/255.0 blue:231.0/255.0 alpha:0.6]

#define NormalFontSize 16               //普通字体大小
#define LeftSpace 35                    //控件左边距
#define ElementHeight 50                //控件高度
#define ButtonHeight 40                 //按钮高度
#define VerifyCodeTime 90               //验证码等待时间

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#pragma mark - 方法

#pragma mark - 全局变量
//typedef enum _OpinionType {//指南状态
//    OpinionTypeReport   = 1,
//    OpinionTypeSuggest  = 2,
//    OpinionTypeConsult  = 3
//} OpinionType;

//extern double KLongitude;
//extern double KLatitude;
//extern NSString *KLocation;

//#define APP_URL @""
//
//#define kReportArray [NSArray arrayWithObjects:@"营销诈骗",@"淫秽色情",@"地域攻击",@"其他理由",nil]//举报类型


#endif
