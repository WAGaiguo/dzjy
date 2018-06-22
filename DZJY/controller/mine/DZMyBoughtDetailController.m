//
//  DZMyBoughtDetailController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtDetailController.h"
#import "DZMyBoughtDetailHeaderView.h"
#import "DZMyBoughtDetailAdapter.h"
#import "DZWeb2ViewController.h"

@interface DZMyBoughtDetailController (){
    DZMyBoughtDetailHeaderView *_headerView;
}
@property (nonatomic, strong)DZMyBoughtDetailAdapter *adapter;
@end

@implementation DZMyBoughtDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self setTitle:@"求购详情"];
    [self setHeaderBackGroud:YES];
    [self configTableHeader];
    [self configAdapter];
    [self requestInforData];
}
- (void)configTableHeader{
    _headerView = [[DZMyBoughtDetailHeaderView alloc]init];
    [self.tableView setTableHeaderView:_headerView];
}
- (void)configAdapter{
    _adapter = [[DZMyBoughtDetailAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    WEAK_SELF
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        DZWeb2ViewController *web = [DZWeb2ViewController new];
        web.dic = @{@"data": me.adapter.dataSource[indexPath.row]};
        web.buyCount = [[me.adapter.dataSource[indexPath.row] objectForKey:@"allowBuyCount"] floatValue];
        [me.navigationController pushViewController:web animated:YES];
    }];
}
- (void)requestInforData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_headerView setContent:obj];
        [_adapter reloadData:obj[@"listingInfoListVo"]];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_commId forKey:@"id"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory boughtDetail]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
