//
//  DZDataSourceModel.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/8.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZDataSourceModel.h"

@implementation DZDataSourceModel
+ (NSString *)typeName:(NSString *)typeName value:(NSString *)value{
    static NSString *resultStr = nil;
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"dataSourceDict" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray * arr = [dataDic objectForKey:[[typeName description] mj_underlineFromCamel]];
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj[@"value"] isEqualToString:value]) {
            resultStr = obj[@"label"];
            * stop = YES;
        }
    }];
    return resultStr;
}
@end
