//
//  DZURLFactory.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZURLFactory.h"

NSString * const DZBaseUrl = @"";

@implementation DZURLFactory
+ (NSString *)baseUrl{
    return DZBaseUrl;
}
+ (NSString *)absulteString: (NSString *)url{
    return [NSString stringWithFormat:@"%@%@",DZBaseUrl,url];
}

@end
