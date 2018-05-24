//
//  DZMessageViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageViewController.h"
#import "DZMessageNilView.h"
#import "DZMessageSearchView.h"
#import "DZMessageAdapter.h"
#import "DZTabBarViewController.h"

@interface DZMessageViewController(){
    DZMessageNilView *nilView;
    DZMessageSearchView *searchView;
    DZMessageAdapter *_adapter;
}
@end

@implementation DZMessageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"站内信"];
    [self setHeaderBackGroud:YES];
//    [self configSearchView];
    [self configAdapter];
    [self reqeustData];
    
    DZTabBarViewController *tabbarV =(DZTabBarViewController *) self.parentViewController;
    [tabbarV setBadageValue:@"20"];
}

- (void)configSearchView{
    searchView = [[DZMessageSearchView alloc]init];
    [self.tableView setTableHeaderView:searchView];
    [searchView setSearchBlock:^(NSString *text) {
        
    }];
}
- (void)configAdapter{
    _adapter = [[DZMessageAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidScroll:^(UITableView *tableView) {
        [MAIN_WINDOW endEditing:YES];
    }];
}
/**
     空---nilView处理
 **/
- (void)configNilView{
    if (nilView == nil) {
        nilView = [DZMessageNilView new];
        [self.view addSubview:nilView];
    }
}
- (void)removeNilView{
    [nilView removeFromSuperview];
    nilView = nil;
}

- (void)reqeustData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self modelData:[obj objectForKey:@"list"]];
        if ([[obj objectForKey:@"list"] count] == 0) {
            [self configNilView];
        }else{
            if (nilView != nil) {
                [self removeNilView];
            }
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory messageList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}
- (void)modelData:(NSArray *)data{
    NSMutableArray *dataArr = [NSMutableArray array];
    [data enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZMessageModel *model = [DZMessageModel new];
        model.title =   [obj[@"titile"] description];
        model.time =    [obj[@"sendTime"] description];
        model.content = [obj[@"content"] description];
        model.id =      [obj[@"id"] description];
        model.readFlag = [obj[@"readFlag"] description];
        model.isFolder = NO;
        [model hightForContent:model.content]; // 设置height高度
        [dataArr addObject:model];
    }];
    [_adapter reloadData:dataArr];
}
@end
