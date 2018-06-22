//
//  DZMyAttentionViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAttentionViewController.h"
#import "DZMyAttentionAdapter.h"
#import "DZMyAttentionCell.h"

@interface DZMyAttentionViewController (){
    DZMyAttentionAdapter *_adapter;
    NSInteger currentPage;
}
@end

@implementation DZMyAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self setTitle:@"我的关注"];
    [self setHeaderBackGroud:YES];
    _adapter = [[DZMyAttentionAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidCellSelected:^(DZMyAttentionCell * cell, NSIndexPath *indexPath) {

    }];
    currentPage = 1;
    [self addInfinite];
    [self requestData];
}

- (void)requestData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (currentPage == 1) {
            [_adapter reloadData:obj[@"list"]];
        }else{
            [_adapter appendData:obj[@"list"]];
        }
        if ([obj[@"list"] count] < 20) {
            [self addNoMoreData];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    NSDictionary *dic1 = @{@"pageInfo":@{@"pageNo":@(currentPage), @"pageSize":@(20)}};
    NSMutableDictionary *dicAll = [NSMutableDictionary dictionary];
    [dicAll addEntriesFromDictionary:dic1];
    [dicAll addEntriesFromDictionary:[params params]];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory attentionList]];
    [manager setParams:dicAll];
    [manager setHandler:handler];
    [manager post];
}

- (void)Infinite{
    currentPage ++;
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
