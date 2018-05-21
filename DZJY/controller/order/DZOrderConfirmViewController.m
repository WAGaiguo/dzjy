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
#import "DZOrderFinishController.h"

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
    [self requestData];
}
- (void)configHeader{
    [self setTitle:@"确认订单"];
    [self setBackEnabled:YES];
    [self setBackImageGray];
//    [self setBackGroudHidden];
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
        [self.navigationController pushViewController:[DZOrderFinishController new] animated:YES];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 手续费 计算规则
- (void)requestData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (_dataDic != nil) {
            [_adapter reloadData:@[_dataDic, @(_buyCount), obj]];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putInteger:[_cid integerValue] forKey:@"id"];
    [params putInteger:_buyCount forKey:@"buyCount"];
    [params putString:_membId forKey:@"membId"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory orderGet]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
@end
