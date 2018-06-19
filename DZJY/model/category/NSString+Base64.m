//
//  NSString+Base64.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/19.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)
- (NSString *)base64NativeEncodedString{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    NSString *base64String = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    return base64String;
}
- (NSString *)base64DecodedString{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
@end
