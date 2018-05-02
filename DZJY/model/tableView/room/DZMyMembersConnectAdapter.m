//
//  DZMyMembersConnectAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyMembersConnectAdapter.h"
#import "DZMyMembersCell.h"

@implementation DZMyMembersConnectAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyMembersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"membersCell"];
    if (cell == nil){
        cell = [[DZMyMembersCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"membersCell"];
    }
    [cell setConnectContent:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7;
}
@end
