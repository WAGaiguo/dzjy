//
//  DZCityModel.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCityModel.h"
#import "NSString+common.h"

@implementation DZCityModel
// 根据返回的code进行拼接城市地址
+ (NSString *)prov:(NSString*)prov city:(NSString *)city dist:(NSString *)dist{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"wag" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray * provinceArray = [NSArray arrayWithArray:jsonArr];
    static NSString *provs = @"";
    static NSString *citys = @"";
    static NSString *dists = @"";
    if ([prov isBlankString]) {
        return @"";
    }
    [provinceArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {// 第一次循环 *省*
        if ([[obj objectForKey:@"code"] isEqualToString:prov]) {
            provs = [obj objectForKey:@"name"];
            if (![city isBlankString]) {
                [[obj objectForKey:@"children"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {// 第二次循环 *市*
                    if ([obj[@"code"] isEqualToString:city]) {
                        citys = obj[@"name"];
                        if (![dist isBlankString]) {
                            [obj[@"children"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {// 第三次循环 *县* 地区
                                if ([obj[@"code"] isEqualToString:dist]) {
                                    dists = obj[@"name"];
                                    *stop = YES;
                                }
                            }];
                        }
                        *stop = YES;
                    }
                }];
            }
            
            *stop = YES;
        }
    }];
    return [NSString stringWithFormat:@"%@%@%@",provs, citys, dists];
}
@end
