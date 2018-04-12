//
//  DZCategoryDetailController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryDetailController.h"
#import "DZCategoryItemView.h"
#import "DZSearchView.h"
#import "DZVarietyView.h"
#import "DZSpecificationView.h"
#import "DZSortView.h"
#import "DZCitySelectView.h"
#import "DZHomeAdapter.h"

#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)

@interface DZCategoryDetailController (){
    DZCategoryItemView *_itemView;
    DZVarietyView *_varietyView;
    DZSpecificationView *_specificationView;
    DZSortView *_sortView;
    DZCitySelectView *_cityView;
    NSInteger currentTag;
    DZHomeAdapter *_adapter;
}

@end

@implementation DZCategoryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentTag = 33;
    [self setBackEnabled:YES];
    [self setTitle:@""];
    [self configAdapter];
    [self configSearchView];
    [self configItemV];
}

- (void)configAdapter{
    _adapter = [[DZHomeAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        
    }];
}

- (void)configSearchView{
    CGFloat s_width = self.titleView.leftView.right;
    DZSearchView *searchV = [[DZSearchView alloc]initWithFrame:CGRectMake(s_width, DZ_TOP - 40, SCREEN_WIDTH - s_width - 40, 40)];
    [searchV setPlaceholder:@"白菜"];
    [self.titleView addSubview:searchV];
    [self setHasRightBtn:YES];
    [self.titleView.rightView setImage:[UIImage imageNamed:@"全部分类"] forState:UIControlStateNormal];
}
- (void)more{
    [self.navigationController popViewControllerAnimated:YES];
}


// 一排 选择分类按钮
- (void)configItemV{
    _itemView = [[DZCategoryItemView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 43)];
    [self.view addSubview:_itemView];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSInteger index) {
        [me tapItem:index];
    }];
    [self configVarityView];
    [self configSpecificationView];
    [self configSortView];
    [self configCityView];
}
// *** 品种 ***
- (void)configVarityView{
    _varietyView = [[DZVarietyView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"白菜", @"白菜", @"白菜", @"白菜"];
    [self.view addSubview:_varietyView];
}
// *** 规格 ***
- (void)configSpecificationView{
    _specificationView = [[DZSpecificationView alloc]initWithFrame:COMMON_FRAME];
    _specificationView.dataSource = @[@[@"白菜", @"白菜", @"白菜", @"白菜"],@[@"白菜", @"白菜"],@[@"白菜", @"白菜", @"白菜"]];
    [self.view addSubview:_specificationView];
}
// *** 排序 ***
- (void)configSortView{
    _sortView = [[DZSortView alloc]initWithFrame:COMMON_FRAME];
    [self.view addSubview:_sortView];
}
// **** 城市选择 ***
- (void)configCityView{
    _cityView = [[DZCitySelectView alloc]initWithFrame:COMMON_FRAME];
    [self.view addSubview:_cityView];
}
// *** 横向选择item点击处理 ***
- (void)tapItem: (NSInteger)index{
    if (currentTag == index) {
        [_specificationView setSelfHide];
        [_varietyView setSelfHide];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        currentTag = 33;
        return;
    }
    if (index == 0) {
        [_specificationView setSelfHide];
        [_varietyView setAnimation];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
    }else if (index == 1){
        [_specificationView setAnimation];
        [_varietyView setSelfHide];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
    }else if (index == 2){
        [_varietyView setSelfHide];
        [_specificationView setSelfHide];
        [_sortView setSelfHide];
        [_cityView setAnimation];
    }else if (index == 3){
        [_varietyView setSelfHide];
        [_specificationView setSelfHide];
        [_sortView setAnimation];
        [_cityView setSelfHide];
    }
    currentTag = index;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
