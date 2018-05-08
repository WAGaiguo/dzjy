//
//  HZRequestParams.m
//  llhz
//
//  Created by kelamo on 2016/11/24.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import "DZRequestParams.h"
#import "NSString+common.h"

@implementation DZRequestParams
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
    if ([[DZUserManager manager] isLogined]) {
        if ([[[DZUserManager manager] user].parentId isBlankString]) {
            [_dictionary setObject:[[DZUserManager manager] user].id  forKey:@"membId"];
        }else{
            [_dictionary setObject:[[DZUserManager manager] user].parentId forKey:@"membId"];
        }
    }
    return [_dictionary copy];
}
- (NSDictionary *)dicParams{
    return [_dictionary copy];
}

+ (NSDictionary *)defaultParams{
    DZRequestParams *p = [DZRequestParams new];
    return [p params];
}
@end
