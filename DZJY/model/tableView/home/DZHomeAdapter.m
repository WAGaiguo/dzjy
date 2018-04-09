//
//  DZHomeAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/8.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeAdapter.h"

@implementation DZHomeAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.afterReuseCell) {
        self.afterReuseCell(cell,indexPath);
    }
    return cell;
}
@end
