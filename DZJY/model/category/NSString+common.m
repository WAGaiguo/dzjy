//
//  NSString+common.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/7.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "NSString+common.h"

@implementation NSString (common)
- (BOOL)isBlankString{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isEqualToString:@"<null>"] || [self isEqualToString:@"<nil>"]) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}
- (BOOL)isNullString{
    if ([self isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}
- (NSString *) formatString:(NSString *)string{
    if ([string isEqual:[NSNull null]]) {
        return @"";
    }
    return string;
}
@end
