//
//  DZSearchResultViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSearchResultViewController.h"
#import "DZSearchNilView.h"
#import "DZSearchView.h"
#import "DZCategoryFirstItemView.h"
#import "DZSearchView.h"
#import "DZSearchModel.h"
#import "DZSortView.h"
#import "DZCitySelectView.h"
#import "DZCategoryAllController.h"
#import "DZNetErrorView.h"
#import "DZHomeAdapter.h"

#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)

@interface DZSearchResultViewController ()
{
    DZSearchNilView *nilView;
    DZSortView *_sortView;
    DZCitySelectView *_cityView;
    NSInteger currentTag;
    DZNetErrorView *errorView;
    DZHomeAdapter *_adapter;
    NSInteger currentPage;
    
    NSString *checkArea;
    NSString *orderBy;
}
@property (nonatomic, strong)DZCategoryFirstItemView *itemView;
@end

@implementation DZSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentTag = 88;
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self makeRightBtn];
    [self configItemView];
    [self configAdapter];
    currentPage = 1;
    checkArea = @"";
    orderBy = @"";
    [self getSearchData:1 pageSize:30];
}
- (void)hasNilView:(BOOL)has{
    if (has){
        if (nilView == nil){
            nilView = [[DZSearchNilView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)];
            [self.view addSubview:nilView];
        }
    }else{
        [nilView removeFromSuperview];
        nilView = nil;
    }
}
- (void)makeRightBtn{
    CGFloat s_width = self.titleView.leftView.right;
    DZSearchView *searchV = [[DZSearchView alloc]initWithFrame:CGRectMake(s_width, DZ_TOP - 40, SCREEN_WIDTH - s_width - 40, 40)];
    [searchV setTapBlock:^{
        [self back];
    }];
    [self.titleView addSubview:searchV];
    
    [self setHasRightBtn:YES];
    [self.titleView.rightView setTitle:@"取消" forState:UIControlStateNormal];

}
- (void)configItemView{
    _itemView = [[DZCategoryFirstItemView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 43)];
    if (_searchTitle != nil){
        _itemView.titleLabel.text = _searchTitle;
    }else{
        _itemView.titleLabel.text = @"全部";
    }
    [self.view addSubview:_itemView];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSInteger index) {
        [me tapItem:index];
    }];
}
// *** 排序 ***
- (void)configSortView{
    _sortView = [[DZSortView alloc]initWithFrame:COMMON_FRAME];
    _sortView.alpha = 0;
    [self.view addSubview:_sortView];
    [UIView animateWithDuration:0.33 animations:^{
        _sortView.alpha = 1;
    }];
    WEAK_SELF
    [_sortView setTapSelect:^(NSInteger aaa, NSString *name) {
        orderBy = name;
//        [me.itemView setSelectedNone];
        [me requestFirstData];
        currentTag = 33;
    }];
}
// **** 城市选择 ***
- (void)configCityView{
    _cityView = [[DZCitySelectView alloc]initWithFrame:COMMON_FRAME];
    _cityView.alpha = 0;
    [self.view addSubview:_cityView];
    [UIView animateWithDuration:0.33 animations:^{
        _cityView.alpha = 1;
    }];
    WEAK_SELF
    [_cityView setTapCityBlock:^(NSString *nameStr) {
        checkArea = nameStr;
        [me.itemView setAddressName:nameStr];
//        [me.itemView setSelectedNone];
        [me requestFirstData];
        currentTag = 33;
    }];
}
- (void)tapItem:(NSInteger)index{
    if (currentTag == index) {
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        _sortView = nil;
        _cityView = nil;
//        [_itemView setSelectedNone];
        currentTag = 33;
        return;
    }
    if (index == 0) {
        [self configCityView];
        [_sortView setSelfHide];
        _sortView = nil;
        [_itemView setSelectedCity];
    }else if (index == 1){
        [self configSortView];
        [_cityView setSelfHide];
        _cityView = nil;
        [_itemView setSelectedOrder];
    }
    currentTag = index;
}
-(void)back{
    if (self.navigationController != nil){
        [self.navigationController popViewControllerAnimated:NO];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
- (void)more{
    [self back];
}
- (void)configAdapter{
    _adapter = [DZHomeAdapter new];
    [self.tableView setFrame:CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)];
    [self.tableView setAdapter:_adapter];
    [self addInfinite];
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
       
    }];
}
- (void)getSearchData:(NSInteger)pageNo pageSize:(NSInteger)pageSize{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeDefault | HZRequestManangerTypeLoadingOnly | HZRequestManangerTypeTipsOnly;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (pageNo == 1) {
            if ([obj[@"list"] count] <= 0) {
                [self hasNilView:YES];
            }else{
                [self hasNilView:NO];
                [_adapter reloadData:obj[@"list"]];
            }
        }else if (pageNo > 1){
            [_adapter appendData:obj[@"list"]];
            [self stopInfinite];
        }
        if ([[obj objectForKey:@"list"] count] < pageSize) {
            [self addNoMoreData];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putInteger:pageNo forKey:@"pageNo"];
    [params putInteger:pageSize forKey:@"pageSize"];
    [params putString:_searchTitle forKey:@"commName"];
    [params putString:checkArea forKey:@"checkArea"];
    [params putString:orderBy forKey:@"orderBy"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory search]];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
}
- (void)requestFirstData{
    currentPage = 1;
    [self getSearchData:currentPage pageSize:30];
}
- (void)Infinite{
    currentPage = currentPage + 1;
    [self getSearchData:currentPage pageSize:30];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
