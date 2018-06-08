//
//  DZDataSourceModel.h
//  DZJY
//
//  Created by wangaiguo on 2018/6/8.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZDataSourceModel : NSObject
/*
 *  typeName 会自动处理成下划线 type_name
 *  value 对应筛选的名称
 */
+ (NSString *)typeName:(NSString *)typeName value:(NSString *)value;
@end
