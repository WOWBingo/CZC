//
//  AppDelegate.m
//  CZC
//
//  Created by 周德艺 on 15/7/5.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *mainVC = [[MainViewController alloc]init];
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    
    //注册推送通知（注意iOS8注册方法发生了变化）
    if (IS_IOS8_OR_ABOVE) {
        [application registerForRemoteNotifications];
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound) categories:nil];
        [application registerUserNotificationSettings:settings];
    } else {
        [application registerForRemoteNotificationTypes:
         UIRemoteNotificationTypeBadge |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeSound];
    }
    
    //判断是否由远程消息通知触发应用程序启动
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]!=nil) {
        //获取应用程序消息通知标记数（即小红圈中的数字）
        NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
        if (badge>0) {
            //如果应用程序消息通知标记数（即小红圈中的数字）大于0，清除标记。
            badge--;
            //清除标记。清除小红圈中数字，小红圈中数字为0，小红圈才会消除。
            [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
        }
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark 注册推送通知之后
//在此接收设备令牌
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [self addDeviceToken:deviceToken];
    NSLog(@"device token:%@",deviceToken);
}

#pragma mark 获取device token失败后
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError:%@",error.localizedDescription);
    [self addDeviceToken:nil];
}

#pragma mark 接收到推送通知之后
// 接收到远程通知以后的处理
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"receiveRemoteNotification,userInfo is %@",userInfo);
    // 将应用的icon上，未读推送+1
    application.applicationIconBadgeNumber ++;
    
    // 取出后台推送过来的信息（取值方法一般都一样，这里只需要改处理方法）
    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"] != NULL) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alert show];
    }
}



#pragma mark - 私有方法
/**
 *  添加设备令牌到服务器端
 *
 *  @param deviceToken 设备令牌
 */
-(void)addDeviceToken:(NSData *)deviceToken{
    NSString *key=@"DeviceToken";
    NSString *dvsToken = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    NSString *oldToken= [[NSUserDefaults standardUserDefaults]objectForKey:key];
    //如果偏好设置中的已存储设备令牌和新获取的令牌不同则存储新令牌并且发送给服务器端
    if (![oldToken isEqualToString:dvsToken]) {
        [[NSUserDefaults standardUserDefaults] setObject:dvsToken forKey:key];
        [self sendDeviceTokenWidthOldDeviceToken:oldToken newDeviceToken:dvsToken];
    }
}

-(void)sendDeviceTokenWidthOldDeviceToken:(NSString *)oldToken newDeviceToken:(NSString *)newToken{
    //注意一定确保真机可以正常访问下面的地址
    
    NSString *urlStr=@"http://192.168.1.107:8080/PushService/servlet/PushServlet";
    urlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSMutableURLRequest *requestM=[NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:100.0];
    [requestM setHTTPMethod:@"POST"];
    NSString *bodyStr=[NSString stringWithFormat:@"oldToken=%@&newToken=%@",oldToken,newToken];
    NSData *body=[bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [requestM setHTTPBody:body];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask= [session dataTaskWithRequest:requestM completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Send failure,error is :%@",error.localizedDescription);
        }else{
            NSLog(@"Send Success!");
        }
        
    }];
    [dataTask resume];
}

@end
