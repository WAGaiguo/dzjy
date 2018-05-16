//
//  DZMyMembersViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyMembersViewController.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMyMembersAccountAdapter.h"
#import "DZMyMembersCompanyAdapter.h"
#import "DZMyMembersConnectAdapter.h"

@interface DZMyMembersViewController ()<SVSegmentedViewDelegate>{
    DZMineCommenScrollView *_scrollView;
    DZMyMembersAccountAdapter *_accountAdapter;
    DZMyMembersCompanyAdapter *_companyAdapter;
    DZMyMembersConnectAdapter *_connectAdapter;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;
@end

@implementation DZMyMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"系统设置"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self configSeveralItem];
    [self configScrollView];
    [self configAdapter];
    [self requestData];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"登录账号信息", @"公司基本信息", @"公司联系信息"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.delegate = self;
    [self.view addSubview:_segmentView];
}
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"", @"", @""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
}
- (void)configAdapter{
    _accountAdapter = [DZMyMembersAccountAdapter new];
    _companyAdapter = [DZMyMembersCompanyAdapter new];
    _connectAdapter = [DZMyMembersConnectAdapter new];
    NSArray *tableArr = @[_accountAdapter, _companyAdapter, _connectAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:tableArr[idx]];
    }];
}
- (void)segmentedDidChange:(NSInteger)index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
- (void)requestData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_accountAdapter reloadData:@[obj]];
        [_companyAdapter reloadData:@[obj]];
        [_connectAdapter reloadData:@[obj]];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory memberInfo]];
    [manager setHandler:handler];
    [manager post];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
