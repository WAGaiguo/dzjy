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
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressCell"];
    if (cell == nil){
        cell = [[DZMyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addressCell"];
    }
    if (self.afterReuseCell) {
        self.afterReuseCell(cell, indexPath);
    }
    [cell setContent:self.dataSource[indexPath.row]];
//    __weak DZMyAddressCell *weak_cell = cell;
    
    return cell;
}
- (void)tapBtn:(NSInteger )integer cell:(DZMyAddressCell *)cell dic:(NSDictionary *)dic{
    DZAlertview *alertView = [DZAlertview new];
    DZMyAddressEditController *editController = [DZMyAddressEditController new];
    editController.dic = dic;
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
