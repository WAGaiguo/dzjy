//
//  NSString+Common.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/7.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)
/*
    ios分类category里的方法调用了但不执行
 
 遇到的时候排查了很多情况，废话少说，结论就是对象为空。
 
 实例方法是通过对象调用的，当这个对象为空时调用方法的时候就不会执行。
 */
- (BOOL)isBlankString;
- (BOOL)isNullString;
- (NSString *)formatString;
+ (NSString *)isBlankString:(id)string;
+ (NSString *)formateString:(NSString *)string;
+ (BOOL)isNullString:(id)string;
+ (NSMutableAttributedString *)priceStr:(NSString *)priceStr unitStr:(NSString *)unitStr;
@end
