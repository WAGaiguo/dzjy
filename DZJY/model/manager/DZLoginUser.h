//
//  DZLoginUser.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZLoginUser : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *updateDate;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *openId;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *loginName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *activeFlag;
@property (nonatomic, strong) NSString *authFalg;
@property (nonatomic, strong) NSString *loginFlag;
@property (nonatomic, strong) NSString *availableDate;

@property (nonatomic, strong) NSString *tokenType;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *refreshToken;

- (id)initWithJsonString:(NSString *)jsonString;
- (id)initWithJsonObject:(NSDictionary *)info;

- (id)jsonObject;
@end
