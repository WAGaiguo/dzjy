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
+ (NSString *)logout;
+ (NSString *)homeList;


// 地址相关
+ (NSString *)addressList;
+ (NSString *)addressInsert;
+ (NSString *)addressDelete;
+ (NSString *)addressGet;
+ (NSString *)addressUpdate;
+ (NSString *)addressDefault;

// 发票相关
+ (NSString *)invoiceList;
+ (NSString *)invoiceUpdate;
+ (NSString *)invoiceInsert;
+ (NSString *)invoiceDelete;
+ (NSString *)invoiceDefault;
+ (NSString *)invoiceUpdateInit;

// 站内信
+ (NSString *)messageList;  //站内信列表
+ (NSString *)messageUpdate;//查看站内信 更新站内信已读、未读标志

// 我的积分
+ (NSString *)pointsList;
+ (NSString *)pointsSumCount;


+ (NSString *)searchWantToBuy;
+ (NSString *)hotSuppliseList;

+ (NSString *)search;
+ (NSString *)getFileByName;

@end
