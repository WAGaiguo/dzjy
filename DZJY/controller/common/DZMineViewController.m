//
//  DZMineViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineViewController.h"
#import "DZTestAdapter.h"

@interface DZMineViewController (){
    DZTestAdapter *_adapter;
}

@end

@implementation DZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的"];
    self.view.backgroundColor = UICyanColor;
    
    _adapter = [[DZTestAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
//    [self addPullToRefresh];
    [self addInfinite];
    [self.tableView setTop:88];
    [self.tableView setHeight:SCREEN_HEIGHT - 88 - 64];
    
    [self addBtn];
}
- (void)addBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    btn.frame = CGRectMake(200, 200, 100, 100);
    btn.backgroundColor = UIOrangeColor;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickBtn{
    [self stopRefresh];
    [self stopInfinite];
}

- (void)pullToRefresh{
    [HudUtils showMessage:@"下拉刷新测试"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
