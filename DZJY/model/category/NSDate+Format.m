//
//  NSDate+Format.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)
- (NSString *)stringDescription:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:self];
    return strDate;
}
- (NSString *)stringDescription{
    return [self stringDescription:@"yy-MM-dd"];
}
- (NSString *)stringDescriptionFull{
    return [self stringDescription:@"yy-MM-dd HH:mm:ss"];
}
@end
