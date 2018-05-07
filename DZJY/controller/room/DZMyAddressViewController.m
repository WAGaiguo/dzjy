//
//  DZMyAddressViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressViewController.h"
#import "DZMyAddressAdapter.h"
#import "DZMyAddressAddController.h"
#import "NSString+common.h"
#import "DZMyAddressCell.h"
#import "DZAlertview.h"
#import "DZMyAddressEditController.h"

@interface DZMyAddressViewController (){
//    DZMyAddressAdapter *_adapter;
}
@property (nonatomic, strong)DZMyAddressAdapter *adapter;
@end

@implementation DZMyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的常用地址"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configAdapter];
    [self configHeaderLineView];
    [self requestData];

}
- (void)configAdapter{
    _adapter = [DZMyAddressAdapter new];
    [self.tableView setAdapter:_adapter];
    [self.tableView setSectionFooterHeight:0.01];
    [self.tableView setTableFooterView:[self configFooterBtn:@"添加地址"]];
    WEAK_SELF
    [_adapter setAfterReuseCell:^(DZMyAddressCell *cell, NSIndexPath *indexPath) {
        [cell setTapBlock:^(NSInteger integer) {
            __weak DZMyAddressCell *weak_cell = cell;
            [me tapBtn:integer cell:weak_cell dic:me.adapter.dataSource[indexPath.row]];
        }];
    }];
}
- (void)configHeaderLineView{
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.width = SCREEN_WIDTH;
    imageV.height = 4;
    imageV.image = [UIImage imageNamed:@"fengexian"];
    [self.tableView setTableHeaderView:imageV];
}
- (UIView *)configFooterBtn:(NSString *)title{
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(7, 7, SCREEN_WIDTH - 14, 43);
    [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"新增"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -15, 0.0, 0.0)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn bk_addEventHandler:^(id sender) {
        DZMyAddressAddController *addController = [DZMyAddressAddController new];
        [addController setBackBlock:^{
            [self requestData];
        }];
        [self.navigationController pushViewController:addController animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [backV addSubview:btn];
    return backV;
}
#pragma 地址列表数据请求操作
- (void)requestData{
    DZUserManager *userManager = [DZUserManager manager];
    DZLoginUser *user = [userManager user];
    NSString *membId = @"";
    if ([user.parentId isBlankString]) {
        membId = user.id;
    }else {
        membId = user.parentId;
    }
    DZRequestParams *params = [DZRequestParams new];
    [params putString:membId forKey:@"membId"];
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_adapter reloadData:obj];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory addressList]];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
}
/*
 * 点击编辑相关操作
 */
- (void)tapBtn:(NSInteger )integer cell:(DZMyAddressCell *)cell dic:(NSDictionary *)dic{
    DZAlertview *alertView = [DZAlertview new];
    DZMyAddressEditController *editController = [DZMyAddressEditController new];
    editController.dic = dic;
    switch (integer) {
        case 1:
            [cell.editView setDefalut:NO];
            break;
        case 2:
            [self.navigationController pushViewController:editController animated:YES];
            break;
        case 3:
            [alertView showAlert:@"是否删除" controller:self confirm:^{
                // 数据请求删除操作
            }];
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
