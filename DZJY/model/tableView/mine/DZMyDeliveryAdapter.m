//
//  DZDeliveryAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyDeliveryAdapter.h"
#import "DZMyDeliveryCell.h"

@implementation DZMyDeliveryAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 217;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyDeliveryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deliveryCell"];
    if (cell == nil){
        cell = [[DZMyDeliveryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deliveryCell"];
    }
    [cell setContent:self.dataSource[indexPath.row]];
    return cell;
}
@end
