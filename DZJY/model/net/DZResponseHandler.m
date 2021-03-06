//
//  HZResponseHandler.m
//  llhz
//
//  Created by kelamo on 2016/11/20.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import "DZResponseHandler.h"
#import "HudUtils.h"
//#import "KickoutUtils.h"
//#import "HZIdentityVerifyViewController.h"

@interface DZResponseHandler()

@end

@implementation DZResponseHandler
- (instancetype)init
{
    self = [super init];
    if (self) {
        _willParseData = YES;
        _logEnabled = NO;
        _is20000Code = NO;
        _type = HZRequestManangerTypeDefault;
    }
    return self;
}
+ (DZResponseHandler *)handlerWithView:(UIView *)view{
    DZResponseHandler *handler  = [DZResponseHandler new];
    handler.hudView = view;
    return handler;
}

- (BOOL)willShowLoading{
    return _type == HZRequestManangerTypeDefault || _type == HZRequestManangerTypeLoadingOnly;
}

- (BOOL)willShowTips{
    return _type == HZRequestManangerTypeDefault || _type == HZRequestManangerTypeTipsOnly;
}
- (UIView *)hudView{
    if (_hudView == nil) {
        return MAIN_WINDOW;
    }
    return _hudView;
}

- (void)dismissLoading{
    if ([self willShowLoading]) {
        [HudUtils hide:self.hudView];
    }
}
- (void)showLoading{
    if ([self willShowLoading]) {
        [HudUtils show:self.hudView];
    }
}

- (void)requestStarted:(DZRequestMananger *)request{
    if ([self willShowLoading]) {
        [self showLoading];
    }
}
- (void)callOnSuccess:(NSData *)responseData request:(DZRequestMananger *)request{
    NSError *jsonError;
    id object = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&jsonError];
    if (jsonError != nil) {
        [self requestFailed:request error:jsonError];
        return;
    }
    NSInteger errorCode;
    if (!_willParsedDataContainsDataKey) { // 添加只返回结果处理 不包含code msg result
        errorCode = [[object objectForKey:@"code"] integerValue];
    }else{
        errorCode = 0;
    }
    if (errorCode == 0) {
        if (!_willParsedDataContainsDataKey) {
            object = [object objectForKey:@"result"];
        }
        _didSuccess(request,object);
    } else if (errorCode == 20000){
        if (_is20000Code) { // 判断是否是返回20000， 20000则成功否则失败 目前支付20000
            object = [object objectForKey:@"result"];
            _didSuccess(request, object);
        }
    }else{
       
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[object objectForKey:@"msg"]                                                                      forKey:NSLocalizedDescriptionKey];
        NSError  *error = [NSError errorWithDomain:@"HZReuestError" code:errorCode userInfo:userInfo];
        [self requestFailed:request error:error];
    }
}
- (void)request:(DZRequestMananger *)request success:(id)responseData{
    [self dismissLoading];
//    if(_logEnabled){
//        NSLog(@"%@",[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
//    }
    if(_willParseData){
        if(_didSuccess){
            [self callOnSuccess:responseData request:request];
        }
    }else{
        if(_didSuccess){
            _didSuccess(request,responseData);
        }
    }
}
- (void)requestFailed:(DZRequestMananger *)request error:(NSError *)error{
    [self dismissLoading];
    NSString  *message = [error localizedDescription];
    if (error.code == -1011) {
        NSDictionary *errorDic = [NSJSONSerialization JSONObjectWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:NSJSONReadingMutableContainers error:nil];
        if ([[errorDic[@"error_description"] description] containsString:@"Access token expired"]) {
            message = @"登录过期，请重新登录";
            [[DZUserManager manager] logout];
        }
    }else if(error.code == 3840){
        message = @"数据解析错误";
    }else if(error.code == -1001){
        message = @"网络连接超时";
    }else if (error.code == 401) {
        if ([message containsString:@"Access token expired"]) {
            [[DZUserManager manager] logout];
            message = @"登录过期，请重新登录";
        }
    }
//    if (error.code == 3) {
//        [request cancelAll];
//        [KickoutUtils kickout];
//    }else if(error.code == 2){
//        [HudUtils showMessage:@"请先完成实名认证!"];
//        HZIdentityVerifyViewController *idc = [HZIdentityVerifyViewController new];
//        [APPDELEGATE.navigationController pushViewController:idc animated:YES];
//    }

    if([self willShowTips]){
        [HudUtils showMessage:message view:self.hudView duration:1.4f];
    }
    if (_didFailed) {
        _didFailed(request);
    }
    NSLog(@"request error %@", error);
}
@end
