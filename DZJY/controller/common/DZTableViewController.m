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
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:_style];
//    _tableView.sectionFooterHeight = 0;
//    _tableView.sectionHeaderHeight = 0;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView setSeparatorColor:UISeperatorColor];
    [_tableView setBackgroundColor:UIWhiteColor];
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

//    _tableView.showsPullToRefresh = YES;
    [_tableView addPullToRefreshWithActionHandler:^{
        [me pullToRefresh];
    }];
//    [_tableView.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateTriggered];
//    [_tableView.pullToRefreshView setTitle:@"正在加载中..." forState:SVPullToRefreshStateLoading];
//    [_tableView.pullToRefreshView setTitle:@"刷新完成" forState:SVPullToRefreshStateStopped];
//    self.tableView.pullToRefreshView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
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

/*
 *  上拉加载
 */
- (void)addInfinite{
    WEAK_SELF
    [_tableView addInfiniteScrollingWithActionHandler:^{
        [me Infinite];
    }];
}
- (void)Infinite{
    
}
- (void)stopInfinite{
    [_tableView.infiniteScrollingView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
