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
@end
