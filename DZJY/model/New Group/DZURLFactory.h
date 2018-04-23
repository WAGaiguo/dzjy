//
//  DZURLFactory.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZURLFactory : NSObject
FOUNDATION_EXPORT NSString *const DZBaseUrl;
FOUNDATION_EXPORT NSString *const DZCommonUrl;

+ (NSString *)login;
+ (NSString *)homeList;

+ (NSString *)searchWantToBuy;
+ (NSString *)hotSuppliseList;

+ (NSString *)search;
+ (NSString *)getFileByName;

@end
