//
//  NSString+Base64.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/19.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)
/**
 * 转换为Base64编码
 */
- (NSString *)base64NativeEncodedString;

/**
 * 将Base64编码还原
 */
- (NSString *)base64DecodedString;
@end
