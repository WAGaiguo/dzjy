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
        self.loginName  = [user[@"loginname"] description];
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
    return info;
}

@end
