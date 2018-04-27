//
//  DZSettingAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSettingAdapter.h"
#import "DZSettingCell.h"

@implementation DZSettingAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"];
    if (cell == nil){
        cell = [[DZSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingCell"];
    }
    [cell setText:self.dataSource[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 7.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7.0;
}
@end
