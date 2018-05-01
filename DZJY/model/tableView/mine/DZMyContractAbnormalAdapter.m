//
//  DZMyContractAbnormal.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyContractAbnormalAdapter.h"
#import "DZMyContractAbormalCell.h"

@implementation DZMyContractAbnormalAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 223;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyContractAbormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contractAbormalCell"];
    if (cell == nil){
        cell = [[DZMyContractAbormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contractAbormalCell"];
    }
    return cell;
}
@end
