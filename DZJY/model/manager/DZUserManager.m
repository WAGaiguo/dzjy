//
//  DZUserManager.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZUserManager.h"
#import "DZPathGetter.h"
#import "CWLSynthesizeSingleton.h"

@interface DZUserManager()
{
    DZLoginUser *_user;
    NSTimeInterval  _lastSign;
}
@end

@implementation DZUserManager
CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(DZUserManager, manager);
- (instancetype)init{
    self = [super init];
    if (self) {
        NSString *encodeString = [[NSString alloc]initWithContentsOfFile:UIDocumentFile(@"user.bat") encoding:NSUTF8StringEncoding error:nil];
        if (encodeString != nil) {
            id userInfo = [NSJSONSerialization JSONObjectWithData:[encodeString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
            if (userInfo != nil) {
                _user = [[DZLoginUser alloc]initWithJsonObject:userInfo];
            }
        }
    }
    return self;
}
- (BOOL)isLogined{
    if (_user == nil) {
        return NO;
    }
    return YES;
}
- (DZLoginUser *)user{
    return _user;
}

- (void)save:(NSDictionary *)info{
    if (info == nil) {
        return;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (jsonString.length != 0) {
        [jsonString writeToFile:UIDocumentFile(@"user.bat") atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}
- (void)login:(NSDictionary *)info{
    _user = [[DZLoginUser alloc]initWithJsonObject:info];
    [self save:info];
    
    _lastSign = [[NSDate date] timeIntervalSince1970];
    [[NSUserDefaults standardUserDefaults]setDouble:_lastSign forKey:@"sign_time"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (BOOL)isTokenExpired{
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    _lastSign = [[NSUserDefaults standardUserDefaults]doubleForKey:@"sign_time"];
    NSLog(@"---%f---%f---%f---", currentTime, _lastSign, currentTime - _lastSign);
    if ((currentTime - _lastSign) < 24 * 3600) {
        return YES;
    }else{
        if ([self isLogined]) {
            [self logout];
        }
        return NO;
    }
}
- (void)logout{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sign_time"];
    [[NSFileManager defaultManager] removeItemAtPath:UIDocumentFile(@"user.bat") error:nil];
    _user = nil;
    _lastSign = 0;
}
@end
