//
//  DZLoginUser.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZLoginUser.h"

@implementation DZLoginUser

- (id)initWithJsonString:(NSString *)jsonString{
    self = [self initWithJsonObject:[NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil]];
    if (self) {
        
    }
    return self;
}

- (id)initWithJsonObject:(NSDictionary *)info{
    self = [super init];
    if (self) {
        self.tokenType = [[info objectForKey:@"tokenType"] description];
        self.accessToken = [[info objectForKey:@"accessToken"] description];
        self.refreshToken = [[info objectForKey:@"refreshToken"] description];
        
        NSDictionary *user = [info objectForKey:@"user"];
        self.id         = [user[@"id"] description];
        self.createDate = [user[@"createDate"] description];
        self.updateDate = [user[@"updateDate"] description];
        self.remarks    = [user[@"remarks"] description];
        self.openId     = [user[@"openId"] description];
        self.clientId   = [user[@"clientId"] description];
        self.parentId   = [user[@"parentId"] description];
        self.loginName  = [user[@"loginName"] description];
        self.email      = [user[@"email"] description];
        self.mobile     = [user[@"mobile"] description];
        self.userType   = [user[@"userType"] description];
        self.activeFlag = [user[@"activeFalg"] description];
        self.authFalg   = [user[@"authFalg"] description];
        self.loginFlag  = [user[@"loginFlag"] description];
        self.availableDate = [user[@"availableDate"] description];
    }
    return self;
}

- (id)jsonObject{
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    if (self.tokenType != nil) {
        [info setObject:self.tokenType forKey:@"tokenType"];
    }
    if (self.accessToken != nil) {
        [info setObject:self.accessToken forKey:@"accessToken"];
    }
    if (self.refreshToken != nil) {
        [info setObject:self.refreshToken forKey:@"refreshToken"];
    }
    NSMutableDictionary *user = [NSMutableDictionary dictionary];
    if (self.id != nil) {
        [user setObject:self.id forKey:@"id"];
    }
    if (self.createDate != nil) {
        [user setObject:self.createDate forKey:@"createDate"];
    }
    if (self.remarks != nil) {
        [user setObject:self.remarks forKey:@"remarks"];
    }
    if (self.openId != nil) {
        [user setObject:self.openId forKey:@"openId"];
    }
    if (self.clientId != nil) {
        [user setObject:self.clientId forKey:@"clientId"];
    }
    if (self.parentId != nil) {
        [user setObject:self.parentId forKey:@"parentId"];
    }
    if (self.loginName != nil) {
        [user setObject:self.loginName forKey:@"loginName"];
    }
    if (self.email != nil) {
        [user setObject:self.email forKey:@"email"];
    }
    if (self.mobile != nil) {
        [user setObject:self.mobile forKey:@"mobile"];
    }
    if (self.userType != nil) {
        [user setObject:self.userType forKey:@"userType"];
    }
    if (self.activeFlag != nil) {
        [user setObject:self.activeFlag forKey:@"activeFlag"];
    }
    if (self.authFalg != nil) {
        [user setObject:self.authFalg forKey:@"authFalg"];
    }
    if (self.loginFlag != nil) {
        [user setObject:self.loginFlag forKey:@"loginFlag"];
    }
    if (self.availableDate != nil) {
        [user setObject:self.availableDate forKey:@"availableDate"];
    }
    [info setObject:user forKey:@"user"];
    return info;
}

@end
