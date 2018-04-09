//
//  DZHomeViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeViewController.h"
#import <PYSearch.h>
#import "DZSearchView.h"
#import "DZSearchResultViewController.h"
#import "DZHomeItemView.h"
#import "DZLoginViewController.h"
#import "DZWebViewController.h"
#import <SDCycleScrollView.h>
#import "DZHomeAdapter.h"

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
   
}
- (void)configSearchView{
    _searchView = [[DZSearchView alloc]init];
    [self.titleView addSubview:_searchView];
    WEAK_SELF
    [_searchView setTapBlock:^{
        [me tapToSearch];
    }];
}
- (void)configHeaderView{
    _headerView = [[UIView alloc]init];
    _headerView.width = SCREEN_WIDTH;
    _headerView.height = 325;
    self.tableView.tableHeaderView = _headerView;
}
- (void)configBannerView{
    _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120) imageNamesGroup:@[@"", @""]];
    _bannerView.autoScrollTimeInterval = 5;
    _bannerView.currentPageDotColor = UICommonColor;
    [_headerView addSubview:_bannerView];
}
- (void)configItemView{
    _itemView = [[DZHomeItemView alloc]initWithFrame:CGRectMake(5, 125, SCREEN_WIDTH - 10, 210)];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSIndexPath *indexPath) {
        if (indexPath.item < 4) {
            DZWebViewController *web = [[DZWebViewController alloc]init];
            web.content = @"https://www.baidu.com/";
            [me.navigationController pushViewController:web animated:YES];return ;
        }
        [me.navigationController pushViewController:[DZLoginViewController new] animated:YES];
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
    PYSearchViewController *pySearch = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"请输入关键字" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        [searchViewController presentViewController:[[DZSearchResultViewController alloc]init] animated:NO completion:nil];
    }];
    pySearch.searchBarBackgroundColor = UICyanColor;
    pySearch.searchSuggestionHidden = YES;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:pySearch];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
