//
//  DZSearchModel.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSearchModel.h"
#import "DZSearchResultViewController.h"

@implementation DZSearchModel
-(void)makeSearchViewController:(UIViewController *)currentController aimController:(UIViewController *)aimController didSearchBlock:(PYDidSearchBlock)block{
    PYSearchViewController *pySearch = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"请输入关键字" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        [searchViewController presentViewController:[[DZSearchResultViewController alloc]init] animated:NO completion:nil];
        if (self.block) {
            self.block(searchViewController, searchBar, searchText);
        }
        
    }];
    pySearch.searchBarBackgroundColor = UIBackgroundColor;
    pySearch.searchSuggestionHidden = YES;
    pySearch.searchHistoryHeader.textColor = UITitleColor;
    pySearch.searchHistoryHeader.font = [UIFont systemFontOfSize:15];
    pySearch.searchHistoryHeader.width = 150;
    [pySearch.emptyButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
    pySearch.searchHistoryStyle = PYSearchHistoryStyleBorderTag;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:pySearch];
    [currentController presentViewController:nav animated:YES completion:nil];
    block = _block;
}

+ (void)makeSearchViewController:(UIViewController *)controller{
    PYSearchViewController *pySearch = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"请输入关键字" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        DZSearchResultViewController *searchC =[[DZSearchResultViewController alloc]init];
        searchC.searchTitle = searchText;
        [searchViewController presentViewController:searchC animated:NO completion:nil];
    }];
    pySearch.searchBarBackgroundColor = UIBackgroundColor;
    pySearch.searchSuggestionHidden = YES;
    pySearch.searchHistoryHeader.textColor = UITitleColor;
    pySearch.searchHistoryHeader.font = [UIFont systemFontOfSize:15];
    pySearch.searchHistoryHeader.width = 150;
    [pySearch.emptyButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
    pySearch.searchHistoryStyle = PYSearchHistoryStyleBorderTag;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:pySearch];
    [controller presentViewController:nav animated:YES completion:nil];
//    [controller.navigationController pushViewController:nav animated:NO];
}
@end
