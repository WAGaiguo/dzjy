//
//  DZMyAddressAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressAdapter.h"
#import "DZMyAddressCell.h"
#import "DZAlertview.h"
#import "DZMyAddressEditController.h"

@implementation DZMyAddressAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 173;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressCell"];
    if (cell == nil){
        cell = [[DZMyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addressCell"];
    }
    __weak DZMyAddressCell *weak_cell = cell;
    [cell setTapBlock:^(NSInteger integer) {
        [self tapBtn:integer cell:weak_cell];
    }];
    return cell;
}
- (void)tapBtn:(NSInteger )integer cell:(DZMyAddressCell *)cell{
    DZAlertview *alertView = [DZAlertview new];
    DZMyAddressEditController *editController = [DZMyAddressEditController new];
    switch (integer) {
        case 1:
            [cell.editView setDefalut:NO];
            break;
        case 2:
            [[self firstViewController].navigationController pushViewController:editController animated:YES];
            break;
        case 3:
            [alertView showAlert:@"是否删除" controller:[self firstViewController] confirm:^{
                // 数据请求删除操作
            }];
            break;
        default:
            break;
    }
}
@end
