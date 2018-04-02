//
//  DZLoginUser.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZLoginUser.h"

@implementation DZLoginUser

- (id)initWithJsonString:(NSString *)jsonString{
    self = [self initWithJsonObject:[NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil]];
    if (self) {
        
    }
    return self;
}

- (id)initWithJsonObject:(NSDictionary *)info{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)jsonObject{
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    return info;
}

@end
