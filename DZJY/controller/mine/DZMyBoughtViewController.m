//
//  DZMyBoughtViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtViewController.h"
#import "SVSegmentedView.h"
#import "DZMyBoughtTipsView.h"
#import "DZMineCommenScrollView.h"
#import "DZMyBoughtAdapter.h"

@interface DZMyBoughtViewController ()<SVSegmentedViewDelegate>{
    DZMineCommenScrollView *_scrollView;
    DZMyBoughtAdapter *_allAdapter;
    DZMyBoughtAdapter *_normalAdapter;
    DZMyBoughtAdapter *_revocationAdapter;
    DZMyBoughtAdapter *_passAdapter;
    
}
@property (nonatomic, strong)SVSegmentedView *segmentView;

@end

@implementation DZMyBoughtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self configHeader];
    [self configSeveralItem];
    [self configScrollView];
    [self configAdapter];
}
- (void)configHeader{
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self setTitle:@"我的求购"];
    [self setRightImage:@"question_mark"];
}

-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"全部", @"正常", @"撤销", @"过期"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [self.view addSubview:_segmentView];
}
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"",@"",@"",@""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
}
- (void)configAdapter{
    _allAdapter = [[DZMyBoughtAdapter alloc]init];
    _normalAdapter = [[DZMyBoughtAdapter alloc]init];
    _revocationAdapter = [[DZMyBoughtAdapter alloc]init];
    _passAdapter = [[DZMyBoughtAdapter alloc]init];
    NSArray *adapterArr = @[_allAdapter, _normalAdapter, _revocationAdapter, _passAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adapterArr[idx]];
    }];
    [_allAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [HudUtils showMessage:@"测试成功"];
    }];
    [_normalAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
    [_revocationAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
    [_passAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
}

#pragma _segement delegate
- (void)segmentedDidChange:(NSInteger) index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)more{
    DZMyBoughtTipsView *tipView = [[DZMyBoughtTipsView alloc]init];
    [self.view addSubview:tipView];
    [tipView startAnimation];
}

@end
