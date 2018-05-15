//
//  DZMyAttentionAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAttentionAdapter.h"
#import "DZMyAttentionCell.h"

@implementation DZMyAttentionAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 8;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"attentionCell"];
    if (cell == nil){
        cell = [[DZMyAttentionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"attentionCell"];
    }
    [cell setCancelBlock:^(UITableViewCell *cell) {
        [HudUtils showMessage:@"取消"];
    }];
    [cell setDic:self.dataSource[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
@end
