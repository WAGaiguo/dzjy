//
//  DZCategoryFirstController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryFirstController.h"
#import "DZCategoryFirstItemView.h"
#import "DZSearchView.h"
#import "DZSearchModel.h"
#import "DZSortView.h"
#import "DZCitySelectView.h"
#import "DZCategoryAllController.h"
#import "DZNetErrorView.h"

#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)

@interface DZCategoryFirstController ()
{
    DZCategoryFirstItemView *_itemView;
    DZSortView *_sortView;
    DZCitySelectView *_cityView;
    NSInteger currentTag;
    DZNetErrorView *errorView;
}
@end

@implementation DZCategoryFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentTag = 33;
      errorView = [[DZNetErrorView alloc]initWithFrame:COMMON_FRAME fatherView:self.view];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configSearchView];
    [self configItemView];
    
  
}
- (void)configSearchView{
    CGFloat s_width = self.titleView.leftView.right;
    DZSearchView *searchV = [[DZSearchView alloc]initWithFrame:CGRectMake(s_width, DZ_TOP - 40, SCREEN_WIDTH - s_width - 40, 40)];
    [searchV setPlaceholder:@"请输入商品名称"];
    [self.titleView addSubview:searchV];
    [self setHasRightBtn:YES];
    [self.titleView.rightView setImage:[UIImage imageNamed:@"全部分类"] forState:UIControlStateNormal];
    [searchV setTapBlock:^{
        [DZSearchModel makeSearchViewController:self];
    }];
}
- (void)more{
    [self.navigationController pushViewController:[DZCategoryAllController new] animated:YES];
}
- (void)configItemView{
    _itemView = [[DZCategoryFirstItemView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 43)];
    [self.view addSubview:_itemView];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSInteger index) {
        [me tapItem:index];
    }];
//    [self configCityView];
//    [self configSortView];
}
// *** 排序 ***
- (void)configSortView{
    _sortView = [[DZSortView alloc]initWithFrame:COMMON_FRAME];
    _sortView.alpha = 0;
    [self.view addSubview:_sortView];
    [UIView animateWithDuration:0.33 animations:^{
        _sortView.alpha = 1;
    }];
    [_sortView setTapSelect:^(NSInteger aaa, NSString *bbb) {
        
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
    [_cityView setTapCityBlock:^(NSString *nameStr) {
        
    }];
}
- (void)tapItem:(NSInteger)index{
    if (currentTag == index) {
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        _sortView = nil;
        _cityView = nil;
        [_itemView setSelectedNone];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
