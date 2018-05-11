//
//  DZCityModel.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCityModel.h"

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
    [provinceArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[obj objectForKey:@"code"] isEqualToString:prov]) {
            provs = [obj objectForKey:@"name"];
            [[obj objectForKey:@"children"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj[@"code"] isEqualToString:city]) {
                    citys = obj[@"name"];
                    [obj[@"children"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([obj[@"code"] isEqualToString:dist]) {
                            dists = obj[@"name"];
                            *stop = YES;
                        }
                    }];
                    *stop = YES;
                }
            }];
            *stop = YES;
        }
    }];
    return [NSString stringWithFormat:@"%@%@%@",provs, citys, dists];
}
@end
