//
//  DZCategoryAllAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryAllAdapter.h"
#import "DZCategoryAllCell.h"

@implementation DZCategoryAllAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZCategoryAllCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[DZCategoryAllCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.afterReuseCell) {
        self.afterReuseCell(cell,indexPath);
    }
    [cell setContent:self.dataSource[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
@end
