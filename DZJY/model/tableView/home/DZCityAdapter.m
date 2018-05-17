//
//  DZCityAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCityAdapter.h"
#import "DZCityCell.h"

@implementation DZCityAdapter
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZCityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell"];
    if (cell == nil){
        cell = [[DZCityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cityCell"];
    }
    if (self.afterReuseCell) {
        self.afterReuseCell(cell,indexPath);
    }
    [cell setContent:self.dataSource[indexPath.row]];
    return cell;
}
@end

@implementation DZProvinceAdapter
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZProvinceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"proviceCell"];
    if (cell == nil){
        cell = [[DZProvinceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"proviceCell"];
    }
    if (self.afterReuseCell) {
        self.afterReuseCell(cell,indexPath);
    }
    [cell setContent:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}
@end
