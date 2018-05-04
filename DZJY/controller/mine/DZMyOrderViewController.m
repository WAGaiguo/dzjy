//
//  DZMyOrderViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyOrderViewController.h"
#import "DZMyOrderTipsView.h"
#import "DZMyOrderAdapter.h"
#import "SVSegmentedView.h"
#import "DZMySelectedView.h"
#import "DZMineCommenScrollView.h"

#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)

@interface DZMyOrderViewController ()<SVSegmentedViewDelegate>{
    DZMyOrderAdapter *_allAdapter;
    DZMyOrderAdapter *_bothAdapter;
    DZMyOrderAdapter *_buyAdapter;
    DZMyOrderAdapter *_sellAdapter;
    DZMyOrderAdapter *_contractAdapter;
    DZMyOrderAdapter *_cancelAdapter;
    DZMyOrderAdapter *_repealAdapter;
    UIImageView *_imageV;
    BOOL _isSelected;
    DZMySelectedView *_varietyView;
}
@property (nonatomic, strong) DZMineCommenScrollView *scrollView;
@property (nonatomic, strong) SVSegmentedView *segmentView;
@end

@implementation DZMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSelected = YES;
    [self configTitle];
    [self configSeveralItem];
    [self configSelectItem];
    [self configScrollView];
    [self configVerity];
    [self configAdapter];
}
- (void)configTitle{
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self setTitle:@"我的订单"];
    [self setRightImage:@"question_mark"];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH - 44, 44)];
    _segmentView.titles = @[@"全部", @"待双方支付", @"待买方支付", @"待卖方支付", @"已生成合同", @"取消", @"撤销"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = UITitleColor;
    _segmentView.minTitleMargin = 12;
    _segmentView.delegate = self;
    _segmentView.selectedIndex = _integer;
    [self.view addSubview:_segmentView];
}
- (void)configSelectItem{
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 44, DZ_TOP, 44, 44)];
    [self.view addSubview:backV];
    _imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"未展开"]];
    _imageV.centerY = 22;
    _imageV.centerX = 22;
    [backV addSubview:_imageV];
    [backV bk_whenTapped:^{
        [self imageVisSelected];
    }];
}
- (void)imageVisSelected{
    if (_isSelected) {
        _imageV.transform = CGAffineTransformMakeRotation(-M_PI);
        [_varietyView setAnimation];
    }else{
        _imageV.transform = CGAffineTransformMakeRotation(0);
        [_varietyView setSelfHide];
    }
    _isSelected = ! _isSelected;
}
- (void)configVerity{
    _varietyView = [[DZMySelectedView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"全部", @"待双方支付", @"待买方支付", @"待卖方支付", @"已生成合同", @"取消", @"撤销"];
    [self.view addSubview:_varietyView];
    [_varietyView bringSubviewToFront:_scrollView];
    WEAK_SELF
    [_varietyView setSelectIndex:^(NSIndexPath *indexPath) {
        me.segmentView.selectedIndex = indexPath.item;
        [me.scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * indexPath.item, 0) animated:YES];
        [me imageVisSelected];
    }];
}
- (void)segmentedDidChange:(NSInteger)index{
    _isSelected = NO;
    [self imageVisSelected];
    [_varietyView setCurrent:index];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
- (void)more{
    DZMyOrderTipsView *tipView = [[DZMyOrderTipsView alloc]init];
    [self.view addSubview:tipView];
    [tipView startAnimation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 * tableView —— scrollView 相关
 */
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"全部", @"待双方支付", @"待买方支付", @"待卖方支付", @"已生成合同", @"取消", @"撤销"];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * _integer, 0)];
}
- (void)configAdapter{
    _allAdapter = _bothAdapter = _buyAdapter = _sellAdapter = _contractAdapter = _cancelAdapter = _repealAdapter =  [[DZMyOrderAdapter alloc]init];
    NSArray *adpterArr = @[_allAdapter, _bothAdapter, _buyAdapter, _sellAdapter, _contractAdapter, _cancelAdapter, _repealAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
}

@end
