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
#import "DZSearchNilView.h"
#import "DZHomeCategoryView.h"
#import "DZSearchModel.h"
#import "DZWeb2ViewController.h"
#import "NSString+Common.h"

#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)

@interface DZCategoryDetailController (){
   
    DZHomeCategoryView *_categoryView;
    DZVarietyView *_varietyView;
    DZSpecificationView *_specificationView;
    DZSortView *_sortView;
    DZCitySelectView *_cityView;
    NSInteger currentTag;
    DZHomeAdapter *_adapter;
    DZSearchNilView *nilView;
    
    NSInteger currentPage;
    NSString *checkArea;
    NSString *orderBy;
}
@property (nonatomic, strong) DZCategoryItemView *itemView;
// 一级分类
@property (nonatomic, strong)NSString *commFirstId;
// 二级分类
@property (nonatomic, strong)NSString *commCateSecondId;
// 品种选择
@property (nonatomic, strong)NSString *varietyId;
// 规格选择
@property (nonatomic, strong)NSArray *commSetAttrildArr;
@property (nonatomic, strong)NSArray *commAttrildArr;
@property (nonatomic, strong)NSArray *commAttribtValArr;
@end

@implementation DZCategoryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentTag = 33;
    [self setBackEnabled:YES];
    [self setTitle:@""];
    [self setHeaderBackGroud:YES];
    [self configAdapter];
    [self configSearchView];
    [self configItemV];
    
    [self initRequestValues];
    [self requestFirstData];
}
- (void)initRequestValues{
    checkArea = @"";
    orderBy = @"";
    _commFirstId = @"";
    _commCateSecondId = @"";
    _varietyId = @"";
    _commSetAttrildArr = @[];
    _commAttrildArr =    @[];
    _commAttribtValArr = @[];
}
- (void)configAdapter{
    _adapter = [[DZHomeAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    WEAK_SELF
    __weak DZHomeAdapter *weak_adapter = _adapter;
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        DZWeb2ViewController *web = [DZWeb2ViewController new];
        web.dic = weak_adapter.dataSource[indexPath.row];
        web.buyCount = [weak_adapter.allowBuyDic[weak_adapter.dataSource[indexPath.row][@"data"][@"id"]] floatValue];
        [me.navigationController pushViewController:web animated:YES];
    }];
}

- (void)configSearchView{
    CGFloat s_width = self.titleView.leftView.right;
    DZSearchView *searchV = [[DZSearchView alloc]initWithFrame:CGRectMake(s_width, DZ_TOP - 40, SCREEN_WIDTH - s_width - 40, 40)];
    [searchV setPlaceholder:_searchTitle];
    [searchV setTapBlock:^{
        if (![_searchTitle isBlankString]) {
            NSInteger index=[[self.navigationController viewControllers]indexOfObject:self];
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-2]animated:NO];
        }else{
            [DZSearchModel makeSearchViewController:self];
        }
    }];
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
    _itemView.titleLabel.text = _navTitle;
    [self.view addSubview:_itemView];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSInteger index) {
        [me tapItem:index];
    }];
    [self configVarityView];
    [self configSpecificationView];
}
// *** 选择品类 ***
- (void)configCatgoryView{
    _categoryView = [[DZHomeCategoryView alloc]initWithFrame:COMMON_FRAME];
    _categoryView.alpha = 0;
    [self.view addSubview:_categoryView];
    [UIView animateWithDuration:0.33 animations:^{
        _categoryView.alpha = 1;
    }];
    if (_categoryDataArr != nil) {
        [_categoryView setDataSource:_categoryDataArr];
    }
    WEAK_SELF
    [_categoryView setTapAllBlock:^(NSString *cid, NSString *title) {
        me.itemView.titleLabel.text = [NSString stringWithFormat:@"全部%@", title];
        _commFirstId = cid;
        _commCateSecondId = @"";
        _thirdId = @"";
        me.commFirstId = cid;
        me.varietyDataArr = nil;
        [me tapItem:-1];
        [me requestFirstData];
    }];
    [_categoryView setTapHeaderBlock:^(NSString *cid, NSString *title) {
        me.itemView.titleLabel.text = title;
        me.commCateSecondId = cid;
        _commFirstId = @"";
        _thirdId = @"";
        me.varietyDataArr = nil;
        [me tapItem:-1];
        [me requestFirstData];
    }];
    [_categoryView setTapItemBlock:^(NSString *cid, NSString *title, NSArray *verityData) {
        me.thirdId = cid;
        _commFirstId = @"";
        _commCateSecondId = @"";
        me.itemView.titleLabel.text = title;
        me.varietyDataArr = verityData;
        [me tapItem:-1];
        [me requestFirstData];
    }];
}
- (void)setVarietyDataArr:(NSArray *)varietyDataArr{
    _varietyDataArr = varietyDataArr;
    if (varietyDataArr != nil) {
        [_varietyView setDataSource:varietyDataArr];
    }
}
// *** 品种 ***
- (void)configVarityView{
    _varietyView = [[DZVarietyView alloc]initWithFrame:COMMON_FRAME];
    WEAK_SELF
    [_varietyView setSelectIndex:^(NSString *title, NSString *titleId) {
        _varietyId = titleId;
        [me requestFirstData];
        [me tapItem:0];
    }];
    [self setVarietyDataArr:_varietyDataArr];
    [self.view addSubview:_varietyView];
}
// *** 规格 ***
- (void)configSpecificationView{
    _specificationView = [[DZSpecificationView alloc]initWithFrame:COMMON_FRAME];
    [self.view addSubview:_specificationView];
    WEAK_SELF
    [_specificationView setSelectBlock:^(NSArray *commSetAttrildArr, NSArray *commAttrildArr, NSArray *commAttribtValArr) {
        _commSetAttrildArr = commSetAttrildArr;
        _commAttrildArr = commAttrildArr;
        _commAttribtValArr = commAttribtValArr;
        [me requestFirstData];
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
        [me.itemView.titleLabel setText:nameStr];
        //        [me.itemView setSelectedNone];
        [me requestFirstData];
        currentTag = 33;
    }];
}
// *** 横向选择item点击处理 ***
- (void)tapItem: (NSInteger)index{
    if (currentTag == index) {
        [_categoryView removeSelfFromSuperview];
        [_specificationView setSelfHide];
        [_varietyView setSelfHide];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        _categoryView = nil;
        _sortView = nil;
        _cityView = nil;
        currentTag = 33;
        return;
    }
    if (index == 0) {
        [_categoryView removeSelfFromSuperview];
        [_specificationView setSelfHide];
        [_varietyView setAnimation];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        _categoryView = nil;
        _sortView = nil;
        _cityView = nil;
    }else if (index == 1){
        [self requestSpecificationData];
        [_categoryView removeSelfFromSuperview];
        [_specificationView setAnimation];
        [_varietyView setSelfHide];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        _categoryView = nil;
        _sortView = nil;
        _cityView = nil;
    }else if (index == 2){
        [_categoryView removeSelfFromSuperview];
        [_varietyView setSelfHide];
        [_specificationView setSelfHide];
        [_sortView setSelfHide];
        [self configCityView];
        _categoryView = nil;
        _sortView = nil;
    }else if (index == 3){
        [_categoryView removeSelfFromSuperview];
        [_varietyView setSelfHide];
        [_specificationView setSelfHide];
        [self configSortView];
        [_cityView setSelfHide];
        _categoryView = nil;
        _cityView = nil;
    }else if (index == -1){
        [_specificationView setSelfHide];
        [_varietyView setSelfHide];
        [_sortView setSelfHide];
        [_cityView setSelfHide];
        _categoryView = nil;
        _sortView = nil;
        _cityView = nil;
        [self configCatgoryView];
    }
    currentTag = index;
}

// *** 数据请求 ***
- (void)getSearchData:(NSInteger)pageNo pageSize:(NSInteger)pageSize{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeDefault;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (pageNo == 1) {
            if ([obj[@"list"] count] <= 0) {
                self.tableView.tableHeaderView = [[DZSearchNilView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)];
                self.tableView.scrollEnabled = NO;
            }else{
                [self.tableView setTableHeaderView:nil];
                [_adapter reloadData:obj[@"list"]];
                self.tableView.scrollEnabled = YES;
                if (_adapter.allowBuyDic == nil) {// 处理可购买量数据源
                    _adapter.allowBuyDic = [NSMutableDictionary dictionaryWithDictionary:obj[@"listedAllowBuyCount"]];
                }else{
                    [_adapter.allowBuyDic removeAllObjects];
                    _adapter.allowBuyDic = obj[@"listedAllowBuyCount"];
                }
            }
        }else if (pageNo > 1){
            [_adapter appendData:obj[@"list"]];
            if (_adapter.allowBuyDic) {// 处理加载更多可购买量数据源
                [_adapter.allowBuyDic addEntriesFromDictionary:[obj objectForKey:@"listedAllowBuyCount"]];
            }else{
                _adapter.allowBuyDic = [NSMutableDictionary dictionaryWithDictionary:obj[@"listedAllowBuyCount"]];
            }
            [self stopInfinite];
        }
        if ([[obj objectForKey:@"list"] count] < pageSize) {
            [self addNoMoreData];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putInteger:pageNo forKey:@"pageNo"];
    [params putInteger:pageSize forKey:@"pageSize"];
    [params putString:(_searchTitle != nil)?_searchTitle:@"" forKey:@"commName"];
    [params putString:checkArea forKey:@"checkArea"];
    [params putString:orderBy forKey:@"orderBy"];
    [params putString:_commFirstId forKey:@"commFirstId"];
    [params putString:_commCateSecondId forKey:@"commCateSecondId"];
    [params putString:_thirdId forKey:@"commCatgId"];
    NSMutableDictionary *dicParams = [NSMutableDictionary dictionary];
    NSDictionary *commSetAttriIdDic = @{@"commSetAttriId": _commSetAttrildArr};
    NSDictionary *commAttriIdDic = @{@"commAttriId": _commAttrildArr};
    NSDictionary *commAttribtValDic = @{@"commAttribtVal": _commAttribtValArr};
    NSDictionary *dic = @{@"commVarietList": @[_varietyId]};
    [dicParams addEntriesFromDictionary:[params params]];
    [dicParams addEntriesFromDictionary:dic];
    [dicParams addEntriesFromDictionary:commSetAttriIdDic];
    [dicParams addEntriesFromDictionary:commAttriIdDic];
    [dicParams addEntriesFromDictionary:commAttribtValDic];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory search]];
    [manager setHandler:handler];
    [manager setParams:dicParams];
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

// *** 请求规格数据处理 ***
- (void)requestSpecificationData{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.willParsedDataContainsDataKey = YES;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self dealData:obj];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_thirdId forKey:@"commId"];
    [params putString:@"0" forKey:@"transModeType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory searchSpecification]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)dealData:(id)obj{
    NSMutableArray *dataSource = [NSMutableArray array];
    [obj enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZSpecificationModel *model = [DZSpecificationModel new];
        model.attribtId = [obj[@"attribtId"] description];
        model.id = [obj[@"id"] description];
        model.currentIndex = -1;
        model.currentSection = -1;
        if (obj[@"commAttriMage"] != nil) {
            NSDictionary *dic = obj[@"commAttriMage"];
            model.commAttribtName = [dic[@"commAttribtName"] description];
            if (![dic[@"dictTaxt"] isEqual:[NSNull null]]) {
                model.dictTaxt = [NSDictionary dictionaryWithDictionary:dic[@"dictTaxt"]];
            }
        }
        [dataSource addObject:model];
    }];
    [_specificationView setDataSource:dataSource];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
