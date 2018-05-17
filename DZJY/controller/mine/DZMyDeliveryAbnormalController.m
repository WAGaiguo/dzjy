//
//  DZMyDeliveryAbnormalController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyDeliveryAbnormalController.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMySelectedView.h"
#import "DZMyDeliveryAdapter.h"
#import "DZMyDeliveryAbnormalAdapter.h"

@interface DZMyDeliveryAbnormalController ()<SVSegmentedViewDelegate>{
    UIImageView *_imageV;
    DZMySelectedView *_varietyView;
    BOOL _isSelected;
    DZMyDeliveryAdapter *_adapter1;
    DZMyDeliveryAdapter *_adapter2;
    DZMyDeliveryAdapter *_adapter3;
    DZMyDeliveryAdapter *_adapter4;
    DZMyDeliveryAdapter *_adapter5;
    DZMyDeliveryAdapter *_adapter6;
    DZMyDeliveryAdapter *_adapter7;
    DZMyDeliveryAdapter *_adapter8;
    DZMyDeliveryAdapter *_adapter9;
    DZMyDeliveryAbnormalAdapter *_goodsAdapter;
    DZMyDeliveryAbnormalAdapter *_ticktAdapter;
}
@property (nonatomic, strong) DZMineCommenScrollView *scrollView;
@property (nonatomic, strong) SVSegmentedView *segmentView;
@end

@implementation DZMyDeliveryAbnormalController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"交收异常处理"];
    _isSelected = YES;
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self setRightImage:@"question_mark"];
    [self configSeveralItem];
//    [self configSelectItem];
    [self configScrollView];
//    [self configAdapter];
//    [self configVerity];
    [self configNowAdapter];
    [self requestGoodsData];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"验货异议", @"验票异议"];
    //@[@"全部", @"待交收", @"交手中", @"待评价", @"解除", @"终止", @"强制解除", @"强制终止", @"已完成"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = UITitleColor;
    _segmentView.minTitleMargin = 12;
    _segmentView.horizontalMargin = 0;
    _segmentView.delegate = self;
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
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"验货异议", @"验票异议"];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
        if (num == 0) {
            [me requestGoodsData];
        }else if (num == 1){
            [me requestTicktData];
        }
    }];
}
- (void)configAdapter{
    _adapter1 = _adapter2 = _adapter3 = _adapter4 = _adapter5 = _adapter6 = _adapter7 = _adapter8 = _adapter9 =   [[DZMyDeliveryAdapter alloc]init];
    NSArray *adpterArr = @[_adapter1, _adapter2, _adapter3, _adapter4, _adapter5, _adapter6, _adapter7, _adapter8, _adapter9];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
}
- (void)configVerity{
    _varietyView = [[DZMySelectedView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"全部", @"待交收", @"交手中", @"待评价", @"解除", @"终止", @"强制解除", @"强制终止", @"已完成"];
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
    if (index == 0) {
        [self requestGoodsData];
    }else if (index == 1){
        [self requestTicktData];
    }
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

- (void)configNowAdapter{
    _goodsAdapter = [DZMyDeliveryAbnormalAdapter new];
    _ticktAdapter = [DZMyDeliveryAbnormalAdapter new];
    NSArray *adpterArr = @[_goodsAdapter, _ticktAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
}

- (void)requestGoodsData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_goodsAdapter reloadData:obj[@"list"]];
    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory deliveryGoodsList]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)requestTicktData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_ticktAdapter reloadData:obj[@"list"]];
    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory deliveryTicketList]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
