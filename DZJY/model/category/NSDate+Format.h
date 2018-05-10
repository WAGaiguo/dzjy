//
//  NSDate+Format.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)
- (NSString *)stringDescription:(NSString *)format;
- (NSString *)stringDescription;
- (NSString *)stringDescriptionFull;

+ (NSString *)timestampToTime:(NSString *)string;
+ (NSString *)timestampToCommonTime:(NSString *)string;
+ (NSString *)timeToTimestamp:(NSString *)string;


// yyyy-MM-dd HH:mm:ss.SSS
+ (NSString *)compareCurrentTime:(NSString *)str;
// 时间戳格式 123456789
+ (NSString *)updateTimeForNow:(NSString *)timeString;
@end
