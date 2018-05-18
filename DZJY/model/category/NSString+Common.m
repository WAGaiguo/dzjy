//
//  NSString+common.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/7.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)
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
- (NSString *)formatString{
    if ([self isEqual:[NSNull null]]) {
        return @"";
    }
    return self;
}
+ (NSString *)isBlankString:(NSString *)string{
    if (string == nil || string == NULL) {
        return @"";
    }
    if ([string isEqualToString:@"<null>"] || [string isEqualToString:@"<nil>"]) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return @"";
    }
    return string;
}
@end
