//
//  APIService.h
//  CZC
//
//  Created by 周德艺 on 15/7/5.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface CZCAPIService : NSObject{
    void(^myresulthandle)(NSDictionary *myresult);
}

+ (CZCAPIService *)shareService;

- (void)GETmethod:(NSString *)methodName andParameters:(NSString *)parameters andHandle:(void(^)(NSDictionary *myresult))handle;
- (void)POSTmethod:(NSString *)methodName andParameters:(NSString *)parameters andHandle:(void(^)(NSDictionary *myresult))handle;

- (void)POSTmethod:(NSString *)methodName andDicParameters:(NSDictionary *)parameters andHandle:(void (^)(NSDictionary *myresult))handle;

- (void)POSTUploadWithUrlmethod:(NSString *)methodName andDicParameters:(NSDictionary *)parameters andHandle:(void (^)(NSDictionary *myresult))handle;

- (void)postUploadWithUrl:(NSString *)urlStr fileImageData:(NSData *)imageData fileName:(NSString *)fileName success:(void (^)(id responseObject))success fail:(void (^)())fail;

@end
