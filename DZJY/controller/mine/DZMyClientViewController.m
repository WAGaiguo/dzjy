//
//  DZMyClientViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyClientViewController.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMyClientAdapter.h"

@interface DZMyClientViewController ()<SVSegmentedViewDelegate>{
    DZMineCommenScrollView *_scrollView;
    DZMyClientAdapter *_adapter1;
    DZMyClientAdapter *_adapter2;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;
@end

@implementation DZMyClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self setTitle:@"我的供应商客户"];
    // 这些界面到时候改成数据加载完初始化 ~~~
    [self configSvsegmentView];
    [self configScrollView];
    [self configAdapter];
}

/**
 因为有数字关系动态的原因，等加载完数据再进行界面的初始化~~~用户体验不是很好了~~~
 **/
- (void)configSvsegmentView{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"定向供应商会员（10）", @"已交易过的（10）"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [self.view addSubview:_segmentView];
}
// 等加载完数据再进行界面的初始化
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"", @""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
}
- (void)configAdapter{
    _adapter1 = [[DZMyClientAdapter alloc]initWithDataSource:nil];
    _adapter2 = [[DZMyClientAdapter alloc]initWithDataSource:nil];
    NSArray *adpterArr = @[_adapter1, _adapter2];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
    [_adapter1 setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
    [_adapter2 setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
