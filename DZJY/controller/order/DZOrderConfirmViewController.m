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
#import "DZOrderConfirmCell.h"
//#import "DZOrderCheckViewController.h"
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
}
- (void)configAdapter{
    _adapter = [[DZOrderConfirmAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidScroll:^(UITableView *tableView) {
        [MAIN_WINDOW endEditing:YES];
    }];
    self.tableView.allowsSelection = NO;
}
- (void)configSubmitBtn{
    DZOrderConfrimBtnView *btnView = [[DZOrderConfrimBtnView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 48, SCREEN_WIDTH, 48)];
    [self.view addSubview:btnView];
    [btnView setSubmitBlock:^{
        [self submitOrder];
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

- (void)submitOrder{
    DZOrderConfirmCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    float currentNums = cell.numberButton.currentNumber;
    NSString *listId = _dataDic[@"id"];
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        DZOrderFinishController *finish = [DZOrderFinishController new];
        finish.dataDic = obj;
        [self.navigationController pushViewController:finish animated:YES];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putInteger:currentNums forKey:@"buyCount"];
    [params putString:listId forKey:@"listId"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory orderSubmit]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
@end
