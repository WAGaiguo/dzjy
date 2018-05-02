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
#import "DZWeb2ViewController.h"
#import <SDCycleScrollView.h>
#import "DZHomeAdapter.h"
#import "DZCategoryAllController.h"
#import "DZSearchModel.h"
#import "DZCategoryFirstController.h"
#import "DZLoginViewController.h"

#import "DZRegisterViewController.h"
#import <MJExtension.h>
#import "DZOrderFinishController.h"
#import "DZOrderConfirmViewController.h"

@interface DZHomeViewController (){
    DZSearchView *_searchView;
    SDCycleScrollView *_bannerView;
    DZHomeItemView *_itemView;
    UIView *_headerView;
    DZHomeAdapter *_adapter;
    NSInteger currentPage;
}

@end

@implementation DZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHeaderBackGroud:YES];
    [self configSearchView];
    [self configHeaderView];
    [self configBannerView];
    [self configItemView];
    [self configAdapter];
    currentPage = 1;
    [self requestData:currentPage pageSize:10];
    [self addInfinite];
   
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
    _bannerView.pageDotImage = [UIImage imageNamed:@"轮播未选中"];
    _bannerView.currentPageDotImage = [UIImage imageNamed:@"轮播选中"];
    [_headerView addSubview:_bannerView];
}
- (void)configItemView{
    _itemView = [[DZHomeItemView alloc]initWithFrame:CGRectMake(7, 127, SCREEN_WIDTH - 14, 206)];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSIndexPath *indexPath) {
        if (indexPath.item == 0){
            [me.navigationController pushViewController:[[DZOrderFinishController alloc]init] animated:YES];
            return ;
        }
        if (indexPath.item == 1){
            DZWeb2ViewController *web = [DZWeb2ViewController new];
            web.content = @"https://www.baidu.com/";
            [me.navigationController pushViewController:web animated:YES];
            return;
        }
        if (indexPath.item == 2){
            [me.navigationController pushViewController:[DZOrderConfirmViewController new] animated:YES];return;
        }
        if (indexPath.item < 4) {
            [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];return;
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
    DZUserManager *manager = [DZUserManager manager];
    DZLoginViewController *loginC = [DZLoginViewController new];
    WEAK_SELF
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        if (![manager isLogined]){
            [me presentViewController:loginC animated:YES completion:nil];
        }
        
    }];
}
- (void)tapToSearch{
    [DZSearchModel makeSearchViewController:self];
}

- (void)requestData:(NSInteger)pageNo pageSize:(NSInteger)pageSize{
    DZRequestParams *params = [DZRequestParams new];
    [params putInteger:pageNo forKey:@"pageNo"];
    [params putInteger:pageSize forKey:@"pageSize"];
    [params putString:@"releDateLong" forKey:@"orderBy"];
    [params putString:@"DESC" forKey:@"sortOrder"];
    DZResponseHandler *handler = [DZResponseHandler new];
//    handler.type = HZRequestManangerTypeLoadingOnly ;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (currentPage == 1) {
            [_adapter reloadData:[obj objectForKey:@"list"]];
        }
        if (currentPage > 1) {
            [_adapter appendData:[obj objectForKey:@"list"]];
            [self stopInfinite];
            if ([[obj objectForKey:@"list"] count] < pageSize) {
                [self addNoMoreData];
            }
        }
        
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        [self stopInfinite];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:@"http://192.168.20.5/synth/searchApp"];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
    
}
- (void)Infinite{
    currentPage = currentPage + 1;
    [self requestData:currentPage pageSize:10];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
