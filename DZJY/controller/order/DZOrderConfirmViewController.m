//
//  DZOrderConfirmViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderConfirmViewController.h"
#import "DZOrderConfirmAdapter.h"
#import "DZOrderConfirmFooterView.h"
#import "DZOrderConfrimBtnView.h"

@interface DZOrderConfirmViewController (){
    DZOrderConfirmAdapter *_adapter;
}

@end

@implementation DZOrderConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self configAdapter];
    [self.tableView setTableFooterView:[DZOrderConfirmFooterView new]];
    [self.tableView setHeight:SCREEN_HEIGHT - DZ_TOP - 48];
    [self configSubmitBtn];
    
}
- (void)configHeader{
    [self setTitle:@"确认订单"];
    [self setBackEnabled:YES];
    [self setBackImageGray];
    [self setBackGroudHidden];
}
- (void)configAdapter{
    _adapter = [[DZOrderConfirmAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidScroll:^(UITableView *tableView) {
        [MAIN_WINDOW endEditing:YES];
    }];
}
- (void)configSubmitBtn{
    DZOrderConfrimBtnView *btnView = [[DZOrderConfrimBtnView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 48, SCREEN_WIDTH, 48)];
    [self.view addSubview:btnView];
    [btnView setSubmitBlock:^{
        [HudUtils showMessage:@"提交订单"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
