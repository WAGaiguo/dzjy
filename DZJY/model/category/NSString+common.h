//
//  NSString+common.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/7.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (common)
- (BOOL)isBlankString;
- (BOOL)isNullString;
- (NSString *) formatString:(NSString *)string;
@end
