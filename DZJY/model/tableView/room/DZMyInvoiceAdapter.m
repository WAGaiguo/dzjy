//
//  DZMyInvoiceAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceAdapter.h"
#import "DZMyInvoiceCell.h"
#import "DZAlertview.h"
#import "DZMyInvoiceEditViewController.h"

@implementation DZMyInvoiceAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 343;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyInvoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"invoiceCell"];
    if (cell == nil){
        cell = [[DZMyInvoiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"invoiceCell"];
    }
    __weak DZMyInvoiceCell *weak_cell = cell;
    [cell setTapBlock:^(NSInteger integer) {
        [self tapBtn:integer cell:weak_cell];
    }];
    return cell;
}
/**
 *  点击设置默认1  编辑2  删除3  对应按钮处理事件
 **/
- (void)tapBtn:(NSInteger )integer cell:(DZMyInvoiceCell *)cell{
    DZAlertview *alertView = [DZAlertview new];
    DZMyInvoiceEditViewController *editController = [DZMyInvoiceEditViewController new];
    switch (integer) {
        case 1:
            [cell.editView setDefalut:NO];
            break;
        case 2:
            editController.editTitle = @"编辑增值税专用发票";
            [[self firstViewController].navigationController pushViewController:editController animated:YES];
            
            break;
        case 3:
            [alertView showAlert:@"是否删除" controller:[self firstViewController] confirm:^{
                
            }];
            break;
        default:
            break;
    }
}
@end
