//
//  DZOrderCheckAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCheckAdapter.h"
#import "DZOrderCheckCell.h"
#import "DZOrderCheck2Cell.h"
#import "DZOrderCheck3Cell.h"

@implementation DZOrderCheckAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 504;
    }else if (indexPath.row == 1){
        return 400;
    }
    return 315;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        DZOrderCheckCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCheckCell"];
        if (cell == nil){
            cell = [[DZOrderCheckCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderCheckCell"];
        }
        return cell;
    }else if (indexPath.row == 1){
        DZOrderCheck2Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCheck2Cell"];
        if (cell == nil) {
            cell = [[DZOrderCheck2Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderCheck2Cell"];
        }
        return cell;
    }
    DZOrderCheck3Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCheck3Cell"];
    if (cell == nil) {
        cell = [[DZOrderCheck3Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderCheck3Cell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ONE_PIXEL;
}
@end
