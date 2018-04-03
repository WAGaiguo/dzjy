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

@interface DZHomeViewController (){
    DZSearchView *_searchView;
    DZHomeItemView *_itemView;
}

@end

@implementation DZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@""];
    _searchView = [[DZSearchView alloc]init];
    [self.titleView addSubview:_searchView];
    WEAK_SELF
    [_searchView setTapBlock:^{
        [HudUtils showMessage:@"tapTest"];
        [me tapToSearch];
    }];
    _itemView = [[DZHomeItemView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 210)];
    [_itemView setSelectIndex:^(NSIndexPath *indexPath) {
        [HudUtils showMessage:[NSString stringWithFormat:@"%ld", indexPath.item]];
    }];
    [self.view addSubview:_itemView];
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
    // Dispose of any resources that can be recreated.
}

@end
