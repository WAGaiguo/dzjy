//
//  DZHomeAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/8.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeAdapter.h"
#import "DZHomeListCell.h"

@implementation DZHomeAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 147;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZHomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[DZHomeListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.afterReuseCell) {
        self.afterReuseCell(cell,indexPath);
    }
    [cell setContent:self.dataSource[indexPath.row][@"data"]];
    return cell;
}
@end
