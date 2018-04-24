//
//  DZMyPointsViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyPointsViewController.h"
#import "DZMyPointsHeaderView.h"
#import "SVSegmentedView.h"
#import "DZMyPointsAdapter.h"
#import "DZMineCommenScrollView.h"

@interface DZMyPointsViewController ()<SVSegmentedViewDelegate>{
    DZMyPointsHeaderView *_headerView;
    DZMyPointsAdapter *_allAdapter;
    DZMyPointsAdapter *_tradeAdapter;
    DZMyPointsAdapter *_evaluateAdapter;
    DZMineCommenScrollView *_scrollView;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;

@end

@implementation DZMyPointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self configTableHeader];
    [self configScrollView];
    [self configAdapter];
}

- (void)configHeader{
    [self.titleView setIsTitleWhite:YES];
    [self setBackEnabled:YES];
    [self setTitle:@"我的积分"];
}
- (void)configTableHeader{
    UIView *tableHeader = [[UIView alloc]init];
    tableHeader.width = SCREEN_WIDTH;
    tableHeader.height = 216;
    tableHeader.backgroundColor = UIBackgroundColor;
    _headerView = [[DZMyPointsHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 165)];
    [tableHeader addSubview:_headerView];
    self.tableView.frame = SCREEN_BOUNDS;
    self.tableView.tableHeaderView = tableHeader;
    [_headerView setTapBlock:^{
        [HudUtils showMessage:@"右侧日历选择按钮"];
    }];
    
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, 172, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"全部", @"交易额积分", @"评价积分"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [tableHeader addSubview:_segmentView];
}
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - 216)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"",@"",@""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
    self.tableView.tableFooterView = _scrollView;
}
- (void)configAdapter{
    _allAdapter = [[DZMyPointsAdapter alloc]init];
    _evaluateAdapter = [DZMyPointsAdapter new];
    _tradeAdapter = [DZMyPointsAdapter new];
    NSArray *adapterArr = @[_allAdapter, _tradeAdapter, _evaluateAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adapterArr[idx]];
    }];
    [_allAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [HudUtils showMessage:@"点击测试"];
    }];
}
#pragma _segement delegate
- (void)segmentedDidChange:(NSInteger) index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
