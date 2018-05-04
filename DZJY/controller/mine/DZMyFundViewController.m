//
//  DZMyFundViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyFundViewController.h"
#import "DZMyPointsHeaderView.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMyFundAdapter.h"
#import "DZCalendarViewController.h"

@interface DZMyFundViewController ()<SVSegmentedViewDelegate>{
    DZMyPointsHeaderView *_headerView;
    DZMineCommenScrollView *_scrollView;
    DZMyFundAdapter *_allAdapter;
    DZMyFundAdapter *_expendAdapter;
    DZMyFundAdapter *_incomeAdapter;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;

@end

@implementation DZMyFundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self setTitle:@"我的资金"];
    [self configTableHeader];
    [self configScrollView];
    [self configAdapter];

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
    self.tableView.sectionHeaderHeight = 0.01;
    self.tableView.sectionFooterHeight = 0.01;
    DZCalendarViewController *calendarV = [DZCalendarViewController new];
    [calendarV setDateBlock:^(NSString *fromDate, NSString *toDate) {
        if (fromDate == nil) {
            _headerView.timeLabel.text = @"本月";
        } else if([fromDate isEqualToString:toDate]){
            _headerView.timeLabel.text = fromDate;
        }else{
            _headerView.timeLabel.text = [NSString stringWithFormat:@"%@ 至 %@",fromDate, toDate];
        }
     }];
    WEAK_SELF
    [_headerView setTapBlock:^{
        [me presentViewController:calendarV animated:YES completion:nil];
    }];
    [_headerView setBottomContent:@"总支出：55555 共收入：66666"];
    
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, 172, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"全部", @"支出", @"收入"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [tableHeader addSubview:_segmentView];
}
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, 216, SCREEN_WIDTH, SCREEN_HEIGHT - 216)];
    _scrollView.backgroundColor = UIGreenColor;
    [self.view addSubview:_scrollView];
    [_scrollView setMe_height:SCREEN_HEIGHT - 216];
    _scrollView.dataSource = @[@"",@"",@""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
    self.tableView.tableFooterView = _scrollView;
}
- (void)configAdapter{
    _allAdapter = [[DZMyFundAdapter alloc]init];
    _expendAdapter = [DZMyFundAdapter new];
    _incomeAdapter = [DZMyFundAdapter new];
    NSArray *adapterArr = @[_allAdapter, _expendAdapter, _incomeAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adapterArr[idx]];
    }];
    [_allAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [HudUtils showMessage:@"点击测试"];
    }];
}

#pragma segmente delegate
- (void)segmentedDidChange:(NSInteger)index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
