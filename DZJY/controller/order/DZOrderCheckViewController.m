//
//  DZOrderCheckViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCheckViewController.h"
#import "DZOrderCheckAdapter.h"

@interface DZOrderCheckViewController (){
    DZOrderCheckAdapter *_adapter;
}

@end

@implementation DZOrderCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"订单查看"];
    [self setBackImageGray];
    [self setBackEnabled:YES];
    [self configAdapter];
}
- (void)configAdapter{
    _adapter = [DZOrderCheckAdapter new];
    [self.tableView setAdapter:_adapter];
    self.tableView.allowsSelection = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
