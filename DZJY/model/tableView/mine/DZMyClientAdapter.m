//
//  DZMyClientAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyClientAdapter.h"
#import "DZMyClientCell.h"

@implementation DZMyClientAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyClientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"clientCell"];
    if (cell == nil){
        cell = [[DZMyClientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"clientCell"];
    }
    return cell;
}
@end
