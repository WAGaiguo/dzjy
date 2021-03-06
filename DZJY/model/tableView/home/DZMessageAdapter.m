//
//  DZMessageAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageAdapter.h"
#import "DZMessageCell.h"
#import "DZTabBarViewController.h"

@implementation DZMessageAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMessageModel *model = self.dataSource[indexPath.row];
//    DZMessageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell setIsFolder: model.isFolder];
    if (model.isFolder) {
        return 84 + model.height + 10;
    }
    return 84;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMessageModel *model = self.dataSource[indexPath.row];
    if (model.isFolder) {
        DZMessageCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell2"];
        if (cell == nil) {
            cell = [[DZMessageCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageCell2"];
        }
        [cell setContent:model integer:indexPath.row];
        [cell setIsFolder:YES];
        return cell;
    }
    DZMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    if (cell == nil){
        cell = [[DZMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageCell"];
    }
    [cell setContent: model integer:indexPath.row];
    [cell setIsFolder:NO];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DZMessageModel *model = self.dataSource[indexPath.row];
   
    model.isFolder = ! model.isFolder;
    if (model.isFolder) {
        DZMessageCell2 *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setIsFolder:model.isFolder];
    }else{
        DZMessageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setIsFolder: model.isFolder];
    }
    [tableView reloadData];
    if (model.isFolder) {
        if ([model.readFlag isEqualToString:@"1"]) {
            [self requestData:model];
        }
    }
}
- (void)requestData:(DZMessageModel *)model{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setType:HZRequestManangerTypeBackground];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        model.readFlag = @"0";
        [self.view reloadData];
        DZTabBarViewController *tabbarV =(DZTabBarViewController *) [self firstViewController].parentViewController;
        [tabbarV setDecreaseBadageValue];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:model.id forKey:@"id"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory messageUpdate]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
@end

@implementation DZMessageModel

- (void)hightForContent:(NSString *)content{
    _height = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 100, CGFLOAT_MAX)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}
                                  context:nil].size.height;
}

@end
