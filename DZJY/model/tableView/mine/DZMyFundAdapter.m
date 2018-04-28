//
//  DZMyFundAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyFundAdapter.h"
#import "DZMyFundCell.h"

@implementation DZMyFundAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 97;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMyFundCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fundCell"];
    if (cell == nil){
        cell = [[DZMyFundCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fundCell"];
    }
    return cell;
}
@end
