//
//  HZResponseHandler.m
//  llhz
//
//  Created by kelamo on 2016/11/20.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import "HZResponseHandler.h"
#import "HudUtils.h"
//#import "KickoutUtils.h"
//#import "HZIdentityVerifyViewController.h"

@interface HZResponseHandler()

@end

@implementation HZResponseHandler
- (instancetype)init
{
    self = [super init];
    if (self) {
        _willParseData = YES;
        _logEnabled = NO;
        _type = HZRequestManangerTypeDefault;
    }
    return self;
}
+ (HZResponseHandler *)handlerWithView:(UIView *)view{
    HZResponseHandler *handler  = [HZResponseHandler new];
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
    [HudUtils show:self.hudView];
}

- (void)requestStarted:(HZRequestMananger *)request{
    if ([self willShowLoading]) {
        [self showLoading];
    }
}
- (void)callOnSuccess:(NSData *)responseData request:(HZRequestMananger *)request{
    NSError *jsonError;
    id object = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&jsonError];
    if (jsonError != nil) {
        [self requestFailed:request error:jsonError];
        return;
    }
    NSInteger errorCode = [[object objectForKey:@"error"] integerValue];
    if (errorCode == 0) {
        if (!_willParsedDataContainsDataKey) {
            object = [object objectForKey:@"data"];
        }
        _didSuccess(request,object);
    }else{
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[object objectForKey:@"msg"]                                                                      forKey:NSLocalizedDescriptionKey];
        NSError  *error = [NSError errorWithDomain:@"HZReuestError" code:errorCode userInfo:userInfo];
        [self requestFailed:request error:error];
    }
}
- (void)request:(HZRequestMananger *)request success:(id)responseData{
    [self dismissLoading];
    if(_logEnabled){
        NSLog(@"%@",[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
    }
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
- (void)requestFailed:(HZRequestMananger *)request error:(NSError *)error{
    [self dismissLoading];
    NSString  *message = [error localizedDescription];
    if(error.code == 3840){
        message = @"数据解析错误";
    }
    if(error.code == -1001){
        message = @"网络连接超时";
    }
    if (error.code == 3) {
//        [request cancelAll];
//        [KickoutUtils kickout];
    }else if(error.code == 2){
        [HudUtils showMessage:@"请先完成实名认证!"];
//        HZIdentityVerifyViewController *idc = [HZIdentityVerifyViewController new];
//        [APPDELEGATE.navigationController pushViewController:idc animated:YES];
    }else if([self willShowTips]){
        [HudUtils showMessage:message view:self.hudView duration:1.4f];
    }
    if (_didFailed) {
        _didFailed(request);
    }
    NSLog(@"request error %@",error);
}
@end
