//
//  HZRequestMananger.m
//  llhz
//
//  Created by kelamo on 2016/11/20.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import "DZRequestMananger.h"

@interface DZRequestMananger()

@end

@implementation DZRequestMananger
AFHTTPSessionManager* defaultRequestManager;
- (AFHTTPSessionManager*)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultRequestManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        
        AFHTTPResponseSerializer* responseSerializer = [AFHTTPResponseSerializer
                                                        serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"image/png", nil];
        
        [defaultRequestManager setResponseSerializer:responseSerializer];
       
        // 请求格式
//        AFHTTPRequestSerializer* requestSerializer = [AFHTTPRequestSerializer serializer];
        AFJSONRequestSerializer * requestSerializer = [AFJSONRequestSerializer serializer];
        
        // 设置请求头
        if ([[DZUserManager manager] isLogined]) {
             [requestSerializer setValue:[NSString stringWithFormat:@"%@ %@",[[DZUserManager manager] user].tokenType,[[DZUserManager manager] user].accessToken] forHTTPHeaderField:@"Authorization"];
        }
   
        
        [requestSerializer setTimeoutInterval:30];
        [defaultRequestManager setRequestSerializer:requestSerializer];
        
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [securityPolicy setValidatesDomainName:NO];
        securityPolicy.allowInvalidCertificates = YES;
        defaultRequestManager.securityPolicy = securityPolicy;
        
        [defaultRequestManager.operationQueue setMaxConcurrentOperationCount:4];
    });
    return defaultRequestManager;
}

- (void)callOnStart{
    [_handler requestStarted:self];
}

- (void)callOnFailure:(NSError *)error{
    [_handler requestFailed:self error:error];
}

- (void)callOnSuccess:(id)object{
    [_handler request:self success:object];
}



- (void)get{
    [self performSelectorOnMainThread:@selector(callOnStart) withObject:nil waitUntilDone:YES];
    [[self defaultManager] GET:_urlString parameters:_params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self callOnSuccess:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self callOnFailure:error];
    }];
}

- (void)post{
    [self performSelectorOnMainThread:@selector(callOnStart) withObject:nil waitUntilDone:YES];
    [[self defaultManager] POST:_urlString parameters:_params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self callOnSuccess:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self callOnFailure:error];
    }];
}
- (void)post:(void (^)(id <AFMultipartFormData> formData))block{
    [self performSelectorOnMainThread:@selector(callOnStart) withObject:nil waitUntilDone:YES];
    [[self defaultManager] POST:_urlString parameters:_params constructingBodyWithBlock:block progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self callOnSuccess:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self callOnFailure:error];
    }];
}
- (void)cancelAll{
    [defaultRequestManager.operationQueue cancelAllOperations];
}
@end
