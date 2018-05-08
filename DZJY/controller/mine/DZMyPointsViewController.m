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
#import "NSDate+Format.h"

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
    [self reqeustDataSumCount];
    [self reqeustData];
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
            _headerView.timeLabel.text = @"本月";
        } else if([fromDate isEqualToString:toDate]){
            _headerView.timeLabel.text = fromDate;
            [self reqeustData:[NSDate timeToTimestamp:fromDate] endDate:[NSDate timeToTimestamp:toDate]];
        }else{
            _headerView.timeLabel.text = [NSString stringWithFormat:@"%@ 至 %@",fromDate, toDate];
//            [self reqeustData:[NSDate timeToTimestamp:fromDate] endDate:[NSDate timeToTimestamp:toDate]];
            [self reqeustData:fromDate endDate:toDate];
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

- (void)reqeustDataSumCount{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_headerView setBottomContent:obj];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory pointsSumCount]];
    [manager setHandler:handler];
    [manager post];
}

- (void)reqeustData:(NSString *)startDate endDate:(NSString *)endDate{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
         [HudUtils hide:MAIN_WINDOW];
         [_allAdapter reloadData:[obj objectForKey:@"list"]];
        if ([[obj objectForKey:@"list"] count] == 0) {
            NSLog(@"没有数据");
        }
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        [HudUtils hide:MAIN_WINDOW];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:startDate forKey:@"starDate"];
    [params putString:endDate forKey:@"endDate"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory pointsList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}

- (void)reqeustData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (obj != nil) {
            [_allAdapter reloadData:[obj objectForKey:@"list"]];
        } else{
            [HudUtils showMessage:@"没有数据"];
        }
        [HudUtils hide:MAIN_WINDOW];
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        [HudUtils hide:MAIN_WINDOW];
    }];
    DZRequestParams *params = [DZRequestParams new];
    //    [params putInteger:startDate.integerValue forKey:@"starDate"];
    //    [params putInteger:endDate.integerValue forKey:@"endDate"];
//    [params putString:[NSString stringWithFormat:@"%ld", startDate.integerValue]  forKey:@"starDate"];
//    [params putString:[NSString stringWithFormat:@"%ld", endDate.integerValue] forKey:@"endDate"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory pointsList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
