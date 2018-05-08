//
//  DZMyPointsAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyPointsAdapter.h"
#import "DZMyPointsCell.h"

@implementation DZMyPointsAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyPointsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pointsCell"];
    if (cell == nil){
        cell = [[DZMyPointsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pointsCell"];
    }
    [cell setContent:self.dataSource[indexPath.row]];
    return cell;
}
@end
