//
//  APIService.m
//  CZC
//
//  Created by 周德艺 on 15/7/5.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "CZCAPIService.h"

static CZCAPIService *CAS;
@implementation CZCAPIService
+ (CZCAPIService *)shareService{
    if (CAS == nil)
    {
        CAS = [[CZCAPIService alloc]init];
    }
    return CAS;
}


- (void)GETmethod:(NSString *)methodName andParameters:(NSString *)parameters andHandle:(void (^)(NSDictionary *))handle{
    NSString *requrl = [NSString stringWithFormat:@"%@%@%@",kPublic_URL,methodName,parameters];
    requrl = [requrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@" 请求地址：%@",requrl);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", @"text/json", @"text/javascript", nil];
    [manager GET:requrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"____成功");
        NSLog(@"JSON: %@", responseObject);
        handle((NSDictionary *) responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"____失败");
        NSLog(@"error: %@",error);
        handle(nil);
    }];
}

- (void)GETMethodWithWWW:(NSString *)urlStr andHandle:(void (^)(NSDictionary *))handle{
    NSString *requrl = [NSString stringWithFormat:@"%@%@",kImage_URL,urlStr]; ;
    requrl = [requrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@" 请求地址：%@",requrl);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", @"text/json", @"text/javascript", nil];
    [manager GET:requrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"____成功");
        NSLog(@"JSON: %@", responseObject);
        handle((NSDictionary *) responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"____失败");
        NSLog(@"error: %@",error);
        handle(nil);
    }];
}

- (void)POSTmethod:(NSString *)methodName andParameters:(NSString *)parameters andHandle:(void (^)(NSDictionary *))handle{
    
    NSString *requrl = [NSString stringWithFormat:@"%@%@",kPublic_URL,methodName];
    requrl = [requrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json",@"text/plain",@"text/html", @"text/json", @"text/javascript", nil];
    [manager POST:requrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handle((NSDictionary *) responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        handle(nil);
    }];
}

- (void)POSTmethod:(NSString *)methodName andDicParameters:(NSDictionary *)parameters andHandle:(void (^)(NSDictionary *))handle{
    NSString *requrl = [NSString stringWithFormat:@"%@%@",kPublic_URL,methodName];
    requrl = [requrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json",@"text/plain",@"text/html", @"text/json", @"text/javascript", nil];
    [manager POST:requrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handle((NSDictionary *) responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        handle(nil);
    }];
}

- (void)POSTUploadWithUrlmethod:(NSString *)methodName andDicParameters:(NSDictionary *)parameters andHandle:(void (^)(NSDictionary *))handle{
    NSString *requrl = methodName;
    requrl = [requrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json",@"text/plain",@"text/html", @"text/json", @"text/javascript", nil];
    [manager POST:requrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handle((NSDictionary *) responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        handle(nil);
    }];
}


-(void)postUploadWithUrl:(NSString *)urlStr fileImageData:(NSData *)imageData fileName:(NSString *)fileName success:(void (^)(id responseObject))success fail:(void (^)())fail
{
    // 本地上传给服务器时,没有确定的URL,不好用MD5的方式处理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json",@"text/plain",@"text/html", @"text/json", @"text/javascript", nil];
    NSDictionary *dic = @{@"memloginid":@"111111" ,
                          @"originalimage":imageData};
    [manager POST:urlStr parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        //        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"loginBackGround.png" withExtension:nil];
        //
        //        // 要上传保存在服务器中的名称
        //        // 使用时间来作为文件名 2014-04-30 14:20:57.png
        //        // 让不同的用户信息,保存在不同目录中
        //        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        //        // 设置日期格式
        //        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        //        NSString *fileName = [formatter stringFromDate:[NSDate date]];
        
//        NSData *data;
//        if (UIImagePNGRepresentation(image) == nil) {
//            data = UIImageJPEGRepresentation(image, 1);
//        } else {
//            data = UIImagePNGRepresentation(image);
//        }
        [formData appendPartWithFileData:imageData name:fileName fileName:fileName mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *doubi = responseObject;
        NSString *shabi =  [[NSString alloc]initWithData:doubi encoding:NSUTF8StringEncoding];
        NSLog(@"success========%@====%@",responseObject,shabi);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
