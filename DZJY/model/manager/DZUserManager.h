//
//  DZUserManager.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZLoginUser.h"

@interface DZUserManager : NSObject
+ (DZUserManager *)manager;

- (void)login:(NSDictionary *)info;
- (BOOL)isLogined;
- (DZLoginUser *)user;

- (void)logout;
@end
