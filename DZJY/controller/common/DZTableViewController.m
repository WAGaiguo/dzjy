//
//  DZTableViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewController.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface DZTableViewController ()
@property (nonatomic, assign)UITableViewStyle style;
@end

@implementation DZTableViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super init];
    if (self) {
        self.style = style;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - (DZ_TOP)) style:_style];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setBackgroundColor:UIBackgroundColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:_tableView];
    
}

/*
 *  下拉刷新
 */
- (void)addPullToRefresh{
    WEAK_SELF
    _tableView.showsPullToRefresh = YES;
    [_tableView addPullToRefreshWithActionHandler:^{
        [me pullToRefresh];
    }];
}

- (void)pullToRefresh{
//    [_tableView.pullToRefreshView startAnimating];
}
- (void)startToRefesh{
    [_tableView triggerPullToRefresh];
}
- (void)stopRefresh{
    [_tableView.pullToRefreshView stopAnimating];
}
- (void)noRefresh{
    _tableView.showsPullToRefresh = NO;
}
/*
 *  上拉加载
 */
- (void)addInfinite{
    WEAK_SELF
    [_tableView addInfiniteScrollingWithActionHandler:^{
        [me Infinite];
    }];
//    [self addNoMoreData];
}
- (void)Infinite{
    
}
- (void)stopInfinite{
    [_tableView.infiniteScrollingView stopAnimating];
}

- (void)addNoMoreData{
    UILabel *label = [[UILabel alloc]init];
    label.width = SCREEN_WIDTH;
    label.height = 40;
    label.backgroundColor = UIBackgroundColor;
    label.textColor = UISubTitleColor;
    label.text = @"没有更多数据了";
    label.textAlignment = NSTextAlignmentCenter;
    [_tableView.infiniteScrollingView setCustomView:label forState:SVInfiniteScrollingStateStopped];
    [self stopInfinite];
    _tableView.infiniteScrollingView.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
