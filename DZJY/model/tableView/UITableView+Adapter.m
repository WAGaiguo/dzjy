//
//  UITableView+Adapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "UITableView+Adapter.h"

@implementation UITableView (Adapter)
- (void)setAdapter:(DZTableViewAdapter *)adapter{
    [self setDataSource:adapter];
    [self setDelegate:adapter];
    [adapter setView:self];
}
@end
