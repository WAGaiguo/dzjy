//
//  DZHomeViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeViewController.h"
#import "DZSearchView.h"
#import "DZHomeItemView.h"
#import "DZWebViewController.h"
#import <SDCycleScrollView.h>
#import "DZHomeAdapter.h"
#import "DZCategoryAllController.h"
#import "DZSearchModel.h"
#import "DZCategoryFirstController.h"

#import "DZLoginViewController.h"
#import "DZRegisterViewController.h"
#import <MJExtension.h>

@interface DZHomeViewController (){
    DZSearchView *_searchView;
    SDCycleScrollView *_bannerView;
    DZHomeItemView *_itemView;
    UIView *_headerView;
    DZHomeAdapter *_adapter;
}

@end

@implementation DZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@""];
    [self configSearchView];
    [self configHeaderView];
    [self configBannerView];
    [self configItemView];
    [self configAdapter];
    [self requestData];
   
}
- (void)configSearchView{
    _searchView = [[DZSearchView alloc]initWithFrame:CGRectMake(0, (DZ_TOP) - 40, SCREEN_WIDTH, 40)];
    [self.titleView addSubview:_searchView];
    WEAK_SELF
    [_searchView setTapBlock:^{
        [me tapToSearch];
    }];
}
- (void)configHeaderView{
    _headerView = [[UIView alloc]init];
    _headerView.width = SCREEN_WIDTH;
    _headerView.height = 333;
    self.tableView.tableHeaderView = _headerView;
}
- (void)configBannerView{
    _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120) imageNamesGroup:@[@"banner1", @"banner2"]];
    _bannerView.autoScrollTimeInterval = 5;
    _bannerView.currentPageDotColor = UICommonColor;
    [_headerView addSubview:_bannerView];
}
- (void)configItemView{
    _itemView = [[DZHomeItemView alloc]initWithFrame:CGRectMake(7, 127, SCREEN_WIDTH - 14, 206)];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSIndexPath *indexPath) {
        if (indexPath.item < 4) {
//            DZWebViewController *web = [[DZWebViewController alloc]init];
//            web.content = @"https://www.baidu.com/";
//            [me.navigationController pushViewController:web animated:YES];return ;
            [me.navigationController pushViewController:[DZRegisterViewController new] animated:YES];
            return;
            
        }
        if (indexPath.item >= 4 && indexPath.item < 7) {
            [me.navigationController pushViewController:[DZCategoryFirstController new] animated:YES];
            return;
        }
        if (indexPath.item == 7) {
            [me.navigationController pushViewController:[DZCategoryAllController new] animated:YES];
        }

    }];
    [_headerView addSubview:_itemView];
}
- (void)configAdapter{
    _adapter = [[DZHomeAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
}
- (void)tapToSearch{
    [DZSearchModel makeSearchViewController:self];
}

- (void)requestData{
    DZRequestParams *params = [DZRequestParams new];
//    [params putString:@"1" forKey:@"pageNo"];
    [params putInteger:1 forKey:@"pageNo"];
    [params putInteger:20 forKey:@"pageSize"];
    [params putString:@"releDateLong" forKey:@"orderBy"];
    [params putString:@"DESC" forKey:@"sortOrder"];
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        NSLog(@"%@",[obj mj_JSONString]);
        [_adapter reloadData:[obj objectForKey:@"list"]];
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        NSLog(@"-----failed------");
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
//    [manager setUrlString:[DZURLFactory hotSuppliseList]];
    [manager setUrlString:@"http://192.168.20.5/synth/searchApp"];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
