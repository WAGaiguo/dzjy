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
#import "NSString+Common.h"

@interface DZMyFundViewController ()<SVSegmentedViewDelegate>{
    DZMyPointsHeaderView *_headerView;
    DZMineCommenScrollView *_scrollView;
    DZMyFundAdapter *_allAdapter;
    DZMyFundAdapter *_expendAdapter;
    DZMyFundAdapter *_incomeAdapter;
    NSString *_startDate;
    NSString *_endDate;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;

@end

@implementation DZMyFundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self setTitle:@"我的资金"];
    [self.titleView setIsTitleWhite:YES];
    [self configTableHeader];
    [self configScrollView];
    [self configAdapter];
    [self getMonthFirstAndLastDayWith];
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

        } else if([fromDate isEqualToString:toDate]){
            _headerView.timeLabel.text = fromDate;
            _startDate = fromDate;
            _endDate = toDate;
            [self reqeustData];
            [self requestTotalData];
        }else{
            _headerView.timeLabel.text = [NSString stringWithFormat:@"%@ 至 %@",fromDate, toDate];
            _startDate = fromDate;
            _endDate = toDate;
            [self reqeustData];
            [self requestTotalData];
        }
     }];
    WEAK_SELF
    [_headerView setTapBlock:^{
        [me presentViewController:calendarV animated:YES completion:nil];
    }];
    [_headerView setBottomContent:@"总支出：0  总收入：0"];
    
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
        [me reqeustData];
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
//        [HudUtils showMessage:@"点击测试"];
    }];
}

#pragma segmente delegate
- (void)segmentedDidChange:(NSInteger)index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
    [self reqeustData];
}

- (void)requestTotalData{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.is20000Code = YES;
    [handler setType:HZRequestManangerTypeBackground];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self setTotleContent:[obj[@"list"] firstObject]];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_startDate forKey:@"dateTimeStart"];
    [params putString:[NSString stringWithFormat:@"%@ %@", _endDate, @"23:59:59"] forKey:@"dateTimeEnd"];
    [params putString:[[DZUserManager manager] user].id forKey:@"accId"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory fundInfo]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)setTotleContent:(NSDictionary *)dic{
    [_headerView setBottomFundContent:([dic[@"totalDisbMoney"] isEqual:[NSNull null]] || (dic[@"totalDisbMoney"] == nil)) ? @"0":dic[@"totalDisbMoney"] reve: ([dic[@"totalReveMoney"] isEqual:[NSNull null]] || (dic[@"totalReveMoney"] == nil)) ? @"0":dic[@"totalReveMoney"]];
}
- (void)reqeustData{
    if (_segmentView.selectedIndex == 0) {
        [self requestDataType:@""];
    }else if (_segmentView.selectedIndex == 1){
        [self requestDataType:@"2"];
    }else if (_segmentView.selectedIndex == 2){
        [self requestDataType:@"1"];
    }
}
- (void)requestDataType:(NSString *)type{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.is20000Code = YES;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [HudUtils hide:MAIN_WINDOW];
        if ([type isEqualToString:@""]) {
            [_allAdapter reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"2"]){
            [_expendAdapter reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"1"]){
            [_incomeAdapter reloadData:[obj objectForKey:@"list"]];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:type forKey:@"capitalType"];
    [params putString:_startDate forKey:@"dateTimeStart"];
    [params putString:[NSString stringWithFormat:@"%@ %@", _endDate, @"23:59:59"] forKey:@"dateTimeEnd"];
    if ([[DZUserManager manager] isLogined]){
        if ([[[DZUserManager manager] user].parentId isBlankString]) {
            [params putString:[[DZUserManager manager] user].id forKey:@"accId"];
        }else{
            [params putString:[[DZUserManager manager] user].parentId forKey:@"accId"];
        }
    }
    NSDictionary *dic1 = @{@"pageInfo":@{@"pageNo":@"1", @"pageSize":@"100"}};
    NSMutableDictionary *dicAll = [NSMutableDictionary dictionary];
    [dicAll addEntriesFromDictionary:dic1];
    [dicAll addEntriesFromDictionary:[params params]];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory fundList]];
    [manager setParams: dicAll];
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
    [self requestDataType:@""];
    [self requestTotalData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
