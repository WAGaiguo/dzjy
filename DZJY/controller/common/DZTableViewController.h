//
//  DZTableViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZTableViewController : DZBaseViewController
- (id)initWithStyle:(UITableViewStyle)style;
@property (nonatomic, strong, readonly)UITableView *tableView;

- (void)addPullToRefresh;
- (void)stopRefresh;
- (void)noRefresh;

- (void)addInfinite;
- (void)stopInfinite;
- (void)addNoMoreData;
@end
