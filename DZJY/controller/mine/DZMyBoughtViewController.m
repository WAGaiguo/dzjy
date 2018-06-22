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
#import "DZMyBoughtDetailController.h"

@interface DZMyBoughtViewController ()<SVSegmentedViewDelegate>{
    DZMineCommenScrollView *_scrollView;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;
@property (nonatomic, strong)DZMyBoughtAdapter *allAdapter;
@property (nonatomic, strong)DZMyBoughtAdapter *normalAdapter;
@property (nonatomic, strong)DZMyBoughtAdapter *revocationAdapter;
@property (nonatomic, strong)DZMyBoughtAdapter *passAdapter;
@end

@implementation DZMyBoughtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self configSeveralItem];
    [self configScrollView];
    [self configAdapter];
//    [self reqeustData:@""];
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
    _segmentView.selectedIndex = _integer;
    [self.view addSubview:_segmentView];
}
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"",@"",@"",@""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
        [me requestDataType:num];
    }];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * _integer, 0)];
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
    WEAK_SELF
    [_allAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [me toDetail:cell indexPath:indexPath commId:me.allAdapter.dataSource[indexPath.row][@"wtbId"]];
    }];
    [_normalAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [me toDetail:cell indexPath:indexPath commId:me.normalAdapter.dataSource[indexPath.row][@"wtbId"]];
    }];
    [_revocationAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [me toDetail:cell indexPath:indexPath commId:me.revocationAdapter.dataSource[indexPath.row][@"wtbId"]];
    }];
    [_passAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        [me toDetail:cell indexPath:indexPath commId:me.passAdapter.dataSource[indexPath.row][@"wtbId"]];
    }];
}

- (void)toDetail:(id)cell indexPath:(NSIndexPath *)indexPath commId:(NSString *)commId{
    DZMyBoughtDetailController *detailC = [DZMyBoughtDetailController new];
    detailC.commId = commId;
    [self.navigationController pushViewController:detailC animated:YES];
}

#pragma _segement delegate
- (void)segmentedDidChange:(NSInteger) index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
    [self requestDataType:index];
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

- (void)reqeustData:(NSString *)type{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if ([type isEqualToString:@""]) {
            [_allAdapter reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"0"]){
            [_normalAdapter reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"2"]){
            [_revocationAdapter reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"1"]){
            [_passAdapter reloadData:[obj objectForKey:@"list"]];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:type forKey:@"wantToBuyState"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory boughtList]];
    NSDictionary *dic1 = @{@"pageInfo":@{@"pageNo":@"1", @"pageSize":@"100"}};
    NSMutableDictionary *dicAll = [NSMutableDictionary dictionary];
    [dicAll addEntriesFromDictionary:dic1];
    [dicAll addEntriesFromDictionary:[params dicParams]];
    [manager setParams: dicAll];
    [manager setHandler:handler];
    [manager post];
}

- (void)requestDataType:(NSInteger)integer{
    if (integer == 0) {
        [self reqeustData:@""];
    }else if (integer == 1){
        [self reqeustData:@"0"];
    }else if (integer == 2){
        [self reqeustData:@"2"];
    }else if (integer == 3){
        [self reqeustData:@"1"];
    }
}

@end
