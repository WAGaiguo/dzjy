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

@interface DZHomeViewController (){
    DZSearchView *_searchView;
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
}

- (void)tapToSearch{
    PYSearchViewController *pySearch = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        [searchViewController presentViewController:[[DZSearchResultViewController alloc]init] animated:NO completion:nil];
    }];
    pySearch.searchBarBackgroundColor = UICyanColor;
    pySearch.searchSuggestionHidden = YES;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:pySearch];
    [pySearch.cancelButton setTitle:@"取消"];
//    pySearch.searchBar.searchBarStyle =
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
