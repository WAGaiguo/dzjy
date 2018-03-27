//
//  HZRequestParams.h
//  llhz
//
//  Created by kelamo on 2016/11/24.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZRequestParams : NSObject
{
    NSMutableDictionary<NSString *,NSString *> *_dictionary;
}
- (void)putString:(NSString *)value forKey:(NSString *)key;
- (void)putInteger:(NSInteger)value forKey:(NSString *)key;
- (void)putDouble:(double)value forKey:(NSString *)key;
- (void)putFloat:(float)value forKey:(NSString *)key;
- (void)putNumber:(NSNumber *)value forKey:(NSString *)key;
- (void)putObject:(NSObject *)value forKey:(NSString *)key;


- (NSDictionary *)params;

+ (NSDictionary *)defaultParams;
@end
