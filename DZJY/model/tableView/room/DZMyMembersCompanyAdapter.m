//
//  DZMyMembersCompanyAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyMembersCompanyAdapter.h"
#import "DZMyMembersCell.h"

@implementation DZMyMembersCompanyAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 87;
    }
    return 49;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        DZMyMembersLogoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"logoCell"];
        if (cell == nil) {
            cell = [[DZMyMembersLogoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"logoCell"];
        }
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl, [self.dataSource lastObject][@"compLogo"]]]];
        return cell;
    }
    DZMyMembersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"membersCell"];
    if (cell == nil){
        cell = [[DZMyMembersCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"membersCell"];
    }
    [cell setDic:[self.dataSource lastObject]];
    [cell setCompanyContent:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7;
}
@end
