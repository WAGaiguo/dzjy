//
//  DZMyLadingAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyLadingAdapter.h"
#import "DZMyLadingCell.h"

@implementation DZMyLadingAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyLadingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ladingCell"];
    if (cell == nil){
        cell = [[DZMyLadingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ladingCell"];
    }
    [cell setContent:self.dataSource[indexPath.row]];
    [cell setCallBlock:^{
        [self makePhoneCall:self.dataSource[indexPath.row][@"salerMobile"]];
    }];
    return cell;
}

@end
