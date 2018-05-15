//
//  DZMyDeliveryAbnormalAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/15.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyDeliveryAbnormalAdapter.h"
#import "DZMyDeliveryAbnormalCell.h"

@implementation DZMyDeliveryAbnormalAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 297;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyDeliveryAbnormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deliveryCell"];
    if (cell == nil){
        cell = [[DZMyDeliveryAbnormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deliveryCell"];
    }
    [cell setContent:self.dataSource[indexPath.row]];
    [cell setCallBlock:^{
        [self makePhoneCall:self.dataSource[indexPath.row][@"sellerPhone"]];
    }];
    return cell;
}
@end
