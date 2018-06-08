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
#import "DZSearchModel.h"
#import "DZLoginViewController.h"
#import "DZSearchResultViewController.h"

#import "DZCategoryAllController.h"
#import "DZCategoryFirstController.h"
#import "NSDate+Format.h"
#import "DZDataSourceModel.h"

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
    [self requestData:currentPage pageSize:20];
    [self addInfinite];
    
    [[DZUserManager manager] isTokenExpired];
}
- (void)configSearchView{
    _searchView = [[DZSearchView alloc]initWithFrame:CGRectMake(0, (DZ_TOP) - 40, SCREEN_WIDTH, 40)];
    [self.titleView addSubview:_searchView];
    WEAK_SELF
    [_searchView setTapBlock:^{
        if (![[DZUserManager manager] isLogined]){
            [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];return ;
        }
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
        if (![[DZUserManager manager] isLogined]) {
            [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];return ;
        }
        DZSearchResultViewController *searchResult = [DZSearchResultViewController new];
        if (indexPath.item == 0){
            searchResult.categoryTitle = @"茄果菜类";
            searchResult.commCateSecondId = @"500283373999563365";
        }
        if (indexPath.item == 1){
            searchResult.categoryTitle = @"瓜果类";
            searchResult.commCateSecondId = @"4413840363314912797";
        }
        if (indexPath.item == 2){
            searchResult.categoryTitle = @"叶菜类";
            searchResult.commCateSecondId = @"500283373999563363";
        }
        if (indexPath.item == 3) {
            searchResult.categoryTitle = @"甘蓝类";
            searchResult.commCateSecondId = @"500283373999563361";
        }
        else if (indexPath.item == 4) {
            searchResult.categoryTitle = @"根茎菜类";
            searchResult.commCateSecondId = @"";
        }
        else if (indexPath.item == 5) {
            searchResult.categoryTitle = @"豆菜类";
            searchResult.commCateSecondId = @"";
        }
        else if (indexPath.item == 6) {
            searchResult.categoryTitle = @"葱姜蒜类";
            searchResult.commCateSecondId = @"";
        }
        else if (indexPath.item == 7) {
            searchResult.categoryTitle = @"全部菜类";
            searchResult.commCateSecondId = @"";
        }
        [me.navigationController pushViewController:searchResult animated:YES];
    }];
    [_headerView addSubview:_itemView];
}
- (void)configAdapter{
    _adapter = [[DZHomeAdapter alloc]initWithDataSource:nil];
    [self.tableView setAdapter:_adapter];
    DZUserManager *manager = [DZUserManager manager];
    DZLoginViewController *loginC = [DZLoginViewController new];
    WEAK_SELF
    __weak DZHomeAdapter *weak_adapter = _adapter;
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        if (![manager isLogined]){
            [me presentViewController:loginC animated:YES completion:nil];return;
        }
        DZWeb2ViewController *web = [DZWeb2ViewController new];
        web.dic = weak_adapter.dataSource[indexPath.row];
        web.buyCount = [weak_adapter.allowBuyDic[weak_adapter.dataSource[indexPath.row][@"data"][@"id"]] floatValue];
        [me.navigationController pushViewController:web animated:YES];
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
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (currentPage == 1) {
            if (_adapter.allowBuyDic == nil) {// 处理可购买量数据源
                _adapter.allowBuyDic = [NSMutableDictionary dictionaryWithDictionary:obj[@"listedAllowBuyCount"]];
            }else{
                [_adapter.allowBuyDic removeAllObjects];
                _adapter.allowBuyDic = obj[@"listedAllowBuyCount"];
            }
            [_adapter reloadData:[obj objectForKey:@"list"]];
        }
        if (currentPage > 1) {
            [_adapter appendData:[obj objectForKey:@"list"]];
            if (_adapter.allowBuyDic) {// 处理加载更多可购买量数据源
                [_adapter.allowBuyDic addEntriesFromDictionary:[obj objectForKey:@"listedAllowBuyCount"]];
            }else{
                _adapter.allowBuyDic = [NSMutableDictionary dictionaryWithDictionary:obj[@"listedAllowBuyCount"]];
            }
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
    [manager setUrlString:[DZURLFactory homeList]];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
}
- (void)Infinite{
    currentPage = currentPage + 1;
    [self requestData:currentPage pageSize:20];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
