//
//  DZTableViewAdapter.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZTableViewAdapter : NSObject<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithDataSource:(NSArray *)dataSource;
- (void)reloadData:(NSArray *)data;
- (void)appendData:(NSArray *)data;

@property (nonatomic, weak)UITableView *view;
@property (nonatomic, readonly)NSMutableArray *dataSource;
@property (nonatomic, copy)void (^didCellSelected)(id cell, NSIndexPath *indexPath);
@property (nonatomic, copy)void (^afterReuseCell)(id cell, NSIndexPath *indexPath);
@property (nonatomic, copy)void (^didScroll)(UITableView *tableView);

@property (nonatomic,assign)BOOL deselectedAnimated;
- (void)goTop:(BOOL)animated;

- (UIViewController *)firstViewController;

@end
