//
//  DZMyInvoiceNormalAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceNormalAdapter.h"
#import "DZMyInvoiceNormalCell.h"
#import "DZAlertview.h"
#import "DZMyInvoiceNormalEditController.h"

@implementation DZMyInvoiceNormalAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48 * 3 + 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyInvoiceNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"invoiceCell"];
    if (cell == nil){
        cell = [[DZMyInvoiceNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"invoiceCell"];
    }
    __weak DZMyInvoiceNormalCell *weak_cell = cell;
    [cell setTapBlock:^(NSInteger integer) {
        [self tapBtn:integer cell:weak_cell dic:self.dataSource[indexPath.row]];
    }];
    [cell setContent:self.dataSource[indexPath.row]];
    return cell;
}
/**
 *  点击设置默认1  编辑2  删除3  对应按钮处理事件
 **/
- (void)tapBtn:(NSInteger )integer cell:(DZMyInvoiceNormalCell *)cell dic:(NSDictionary *)dic{
    DZAlertview *alertView = [DZAlertview new];
    DZMyInvoiceNormalEditController *editController = [DZMyInvoiceNormalEditController new];
    [editController setSuccessBlock:^{
        [self requestDedicateData:[dic[@"invoType"] description]];
    }];
    switch (integer) {
        case 1:
            if ([dic[@"defaultFlag"] isEqualToString:@"1"]) {
                [self setDefault:dic];
            }
            break;
        case 2:
            if ([dic[@"invoType"] isEqualToString:@"0"]) {
                editController.editTitle = @"编辑增值税普通发票";
                editController.invoType = @"0";
            }else if([dic[@"invoType"] isEqualToString:@"1"]){
                editController.editTitle = @"编辑增值税专用发票";
                editController.invoType = @"1";
            }
            editController.dic = dic;
            [[self firstViewController].navigationController pushViewController:editController animated:YES];
            break;
        case 3:
        {
            [alertView showAlert:@"是否删除" controller:[self firstViewController] confirm:^{
                [self deleteData:dic];
            }];
            break;
        }
        default:
            break;
    }
}
/**
 *  删除
 **/
- (void)deleteData:(NSDictionary *)dic{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self requestDedicateData:[dic[@"invoType"] description]];
        [HudUtils showMessage:@"删除成功"];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:[dic[@"id"] description] forKey:@"id"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory invoiceDelete]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
/**
 *  设置默认
 **/
- (void)setDefault:(NSDictionary *)dic{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self requestDedicateData:[dic[@"invoType"] description]];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:[dic[@"id"] description] forKey:@"id"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory invoiceDefault]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
/**
 *  刷新数据
 **/
- (void)requestDedicateData:(NSString *)type{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setType:HZRequestManangerTypeBackground];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self reloadData:obj];
    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [params putString:type forKey:@"invoType"];
    [manager setUrlString:[DZURLFactory invoiceList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}

@end
