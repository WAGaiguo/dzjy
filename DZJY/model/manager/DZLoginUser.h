//
//  DZLoginUser.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZLoginUser : NSObject



- (id)initWithJsonString:(NSString *)jsonString;
- (id)initWithJsonObject:(NSDictionary *)info;

- (id)jsonObject;
@end
