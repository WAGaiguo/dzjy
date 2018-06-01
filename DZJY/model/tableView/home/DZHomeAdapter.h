//
//  DZHomeAdapter.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/8.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewAdapter.h"

@interface DZHomeAdapter : DZTableViewAdapter
// *** 允许可购买量数据源 ***
@property (nonatomic, strong)NSMutableDictionary *allowBuyDic;
@end
