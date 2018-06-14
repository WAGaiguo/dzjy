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
#import "DZCalendarViewController.h"

@interface DZMyPointsViewController ()<SVSegmentedViewDelegate>{
    DZMyPointsHeaderView *_headerView;
    DZMyPointsAdapter *_allAdapter;
    DZMyPointsAdapter *_tradeAdapter;
    DZMyPointsAdapter *_evaluateAdapter;
    DZMineCommenScrollView *_scrollView;
    NSString *_startDate;
    NSString *_endDate;
//    NSInteger _current;
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
//    [self reqeustDataSumCount];
    [self getMonthFirstAndLastDayWith];
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
    self.tableView.sectionHeaderHeight = 0.01;
    self.tableView.sectionFooterHeight = 0.01;
    
    // 日历选择按钮触发事件
    DZCalendarViewController *calendarV = [DZCalendarViewController new];
    [calendarV setDateBlock:^(NSString *fromDate, NSString *toDate) {
        if (fromDate == nil) {
//            _headerView.timeLabel.text = @"本月";
        } else if([fromDate isEqualToString:toDate]){
            _headerView.timeLabel.text = fromDate;
            _startDate = fromDate;
            _endDate = toDate;
            [self reqeustDataSumCount];
            [self requestDataType];
        }else{
            _headerView.timeLabel.text = [NSString stringWithFormat:@"%@ 至 %@",fromDate, toDate];
            _startDate = fromDate;
            _endDate = toDate;
            [self reqeustDataSumCount];
            [self requestDataType];
        }
    }];
    WEAK_SELF
    [_headerView setTapBlock:^{
         [me presentViewController:calendarV animated:YES completion:nil];
    }];
    
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, 172, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"全部", @"交易额积分", @"评价积分"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [tableHeader addSubview:_segmentView];
}
- (void)requestDataType{
    if (_segmentView.selectedIndex == 0) {
        [self reqeustData:@""];
    }else if(_segmentView.selectedIndex == 1){
        [self reqeustData:@"1"];
    }else if(_segmentView.selectedIndex == 2){
        [self reqeustData:@"0"];
    }
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
        [me requestDataType];
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
    [self requestDataType];
}

// *** 积分总量数据请求 ***
- (void)reqeustDataSumCount{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setType:HZRequestManangerTypeTipsOnly];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_headerView setBottomContent:obj];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_startDate forKey:@"startDateTime"];
    [params putString:_endDate forKey:@"endDateTime"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory pointsSumCount]];
    [manager setHandler:handler];
    [manager setParams:[params dicParams]];
    [manager post];
}
// *** list数据请求 ***
- (void)reqeustData:(NSString *)type{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if ([type isEqualToString:@""]) {
            [_allAdapter reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"1"]){
            [_tradeAdapter reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"0"]){
            [_evaluateAdapter reloadData:[obj objectForKey:@"list"]];
        }
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_startDate forKey:@"starDate"];
    [params putString:_endDate forKey:@"endDate"];
    [params putString:type forKey:@"integType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory pointsList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}


#pragma 获取本月的第一天和最后一天
- (void)getMonthFirstAndLastDayWith{
    NSDate *newDate = [NSDate date];
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:& firstDate interval:&interval forDate:newDate];
    
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
    }else {
//        return @[@"",@""];
    }
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *firstString = [myDateFormatter stringFromDate: firstDate];
    NSString *lastString = [myDateFormatter stringFromDate: lastDate];
    
    _startDate = firstString;
    _endDate = lastString;
    [self reqeustDataSumCount];
    [self reqeustData:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
