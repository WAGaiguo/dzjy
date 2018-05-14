//
//  DZMyOrderAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyOrderAdapter.h"
#import "DZMyOrderCell.h"

@implementation DZMyOrderAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 242;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[DZMyOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell setCallBlock:^{
        [self makePhoneCall:self.dataSource[indexPath.row][@"mobile"]];
    }];
    [cell setContent:self.dataSource[indexPath.row]];
    return cell;
}
@end
