//
//  HZRequestParams.m
//  llhz
//
//  Created by kelamo on 2016/11/24.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import "HZRequestParams.h"

@implementation HZRequestParams
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}
- (void)putString:(NSString *)value forKey:(NSString *)key{
    [_dictionary setObject:value forKey:key];
}
- (void)putInteger:(NSInteger)value forKey:(NSString *)key{
    [self putNumber:@(value) forKey:key];
}
- (void)putDouble:(double)value forKey:(NSString *)key{
    [self putNumber:@(value) forKey:key];
}
- (void)putFloat:(float)value forKey:(NSString *)key{
    [self putNumber:@(value) forKey:key];
}
- (void)putNumber:(NSNumber *)value forKey:(NSString *)key{
    [self putString:[value stringValue] forKey:key];
}
- (void)putObject:(NSObject *)value forKey:(NSString *)key{
    [self putString:[value description] forKey:key];
}
- (NSDictionary *)params{
//    if ([[HZUserManager manager] isLogined]) {
//            [_dictionary setObject:[[HZUserManager manager] user].token forKey:@"token"];
//            [_dictionary setObject:[[HZUserManager manager] user].username forKey:@"username"];
//    }
    return [_dictionary copy];
}
+ (NSDictionary *)defaultParams{
    HZRequestParams *p = [HZRequestParams new];
    return [p params];
}
@end
