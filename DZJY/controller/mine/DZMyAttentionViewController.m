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
        [HudUtils showMessage:@"tip_Tips"];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
