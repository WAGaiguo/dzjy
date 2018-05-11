//
//  DZMyMembersAccountAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyMembersAccountAdapter.h"
#import "DZMyMembersCell.h"

@implementation DZMyMembersAccountAdapter
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
    [cell setDic:[self.dataSource lastObject]];
    [cell setAccountContent:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7;
}
@end
