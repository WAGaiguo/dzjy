//
//  DZCityModel.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCityModel.h"
#import "NSString+Common.h"

@implementation DZCityModel
// *** 根据返回的code进行拼接城市地址 ***
+ (NSString *)prov:(NSString*)prov city:(NSString *)city dist:(NSString *)dist{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"areas" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray * provinceArray = [NSArray arrayWithArray:jsonArr];
    __block NSString *provs = @"";
    __block NSString *citys = @"";
    __block NSString *dists = @"";
    if ([NSString isNullString:prov]) {
        return @"";
    }
    [provinceArray enumerateObjectsUsingBlock:^(NSDictionary * provObj, NSUInteger idx, BOOL * _Nonnull stop) {// 第一次循环 *省*
        @autoreleasepool{
            if ([[provObj objectForKey:@"value"] isEqualToString:prov]) {
                provs = [provObj objectForKey:@"label"];
//                citys = @"";
//                dists = @"";
                if (![NSString isNullString: city]) {
                    [[provObj objectForKey:@"children"] enumerateObjectsUsingBlock:^(NSDictionary *cityObj, NSUInteger idx, BOOL * _Nonnull stop) {// 第二次循环 *市*
                        @autoreleasepool{
                            if ([cityObj[@"value"] isEqualToString:city]) {
                                citys = cityObj[@"label"];
//                                dists = @"";
                                if (![NSString isNullString: dist]) {
                                    [cityObj[@"children"] enumerateObjectsUsingBlock:^(NSDictionary *distObj, NSUInteger idx, BOOL * _Nonnull stop) {// 第三次循环 *县* 地区
                                        @autoreleasepool{
                                            if ([distObj[@"value"] isEqualToString:dist]) {
                                                dists = distObj[@"label"];
                                                *stop = YES;
                                            }
                                        }
                                    }];
                                }
                                *stop = YES;
                            }
                        }
                    }];
                }
                *stop = YES;
            }
        }
    }];
    return [NSString stringWithFormat:@"%@%@%@",provs, citys, dists];
}
@end
