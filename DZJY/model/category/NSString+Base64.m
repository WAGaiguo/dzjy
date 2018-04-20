//
//  NSString+Base64.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/19.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)
- (NSString *)base64EncodedString{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"%@",[data base64EncodedDataWithOptions:0]];
}
- (NSString *)base64DecodedString{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
