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
    DZCategoryFirstItemView *_itemView;
    DZSortView *_sortView;
    DZCitySelectView *_cityView;
    NSInteger currentTag;
    DZNetErrorView *errorView;
    DZHomeAdapter *_adapter;
}
@end

@implementation DZSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentTag = 88;
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self makeRightBtn];
    [self hasNilView:YES];
    [self configItemView];
    [self getSearchData];
}
- (void)hasNilView:(BOOL)has{
    if (has){
        if (nilView == nil){
            nilView = [[DZSearchNilView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43) fatherView:self.view];}
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
    [self configCityView];
    [self configSortView];
}
// *** 排序 ***
- (void)configSortView{
    _sortView = [[DZSortView alloc]initWithFrame:COMMON_FRAME];
    [self.view addSubview:_sortView];
    [_sortView setTapSelect:^(NSInteger aaa) {
        
    }];
}
// **** 城市选择 ***
- (void)configCityView{
    _cityView = [[DZCitySelectView alloc]initWithFrame:COMMON_FRAME];
    [self.view addSubview:_cityView];
    [_cityView setTapCityBlock:^(NSString *nameStr) {
        
    }];
}
- (void)tapItem:(NSInteger)index{
    if (currentTag == index) {
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        currentTag = 33;
        return;
    }
    if (index == 0) {
        [_cityView setAnimation];
        [_sortView setSelfHide];
    }else if (index == 1){
        [_cityView setSelfHide];
        [_sortView setAnimation];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)getSearchData{
    DZRequestParams *params = [DZRequestParams new];
//    [params putInteger:1 forKey:@"pageNo"];
//    [params putInteger:30 forKey:@"pageSize"];
    [params putString:_searchTitle forKey:@"searchName"];
   
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeDefault | HZRequestManangerTypeLoadingOnly | HZRequestManangerTypeTipsOnly;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        NSLog(@"%@", [obj mj_JSONString]);
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        NSLog(@"--failed--");
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory search]];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
}

@end
