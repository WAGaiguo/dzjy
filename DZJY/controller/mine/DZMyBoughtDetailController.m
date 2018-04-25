//
//  DZMyBoughtDetailController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtDetailController.h"
#import "DZMyBoughtDetailHeaderView.h"
#import "DZHomeAdapter.h"

@interface DZMyBoughtDetailController (){
    DZMyBoughtDetailHeaderView *_headerView;
    DZHomeAdapter *_adapter; // 目前公用的一个adapter  后期如果大的改动在进行修改
}

@end

@implementation DZMyBoughtDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self setTitle:@"求购详情"];
    [self setHeaderBackGroud:YES];
    [self configTableHeader];
    [self configAdapter];
}
- (void)configTableHeader{
    _headerView = [[DZMyBoughtDetailHeaderView alloc]init];
    [self.tableView setTableHeaderView:_headerView];
}
- (void)configAdapter{
    _adapter = [[DZHomeAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
