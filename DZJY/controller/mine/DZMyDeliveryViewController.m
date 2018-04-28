//
//  DZDeliveryViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyDeliveryViewController.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMySelectedView.h"
#import "DZMyDeliveryAdapter.h"

@interface DZMyDeliveryViewController ()<SVSegmentedViewDelegate>{
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
}
@property (nonatomic, strong) DZMineCommenScrollView *scrollView;
@property (nonatomic, strong) SVSegmentedView *segmentView;
@end

@implementation DZMyDeliveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的交收"];
    _isSelected = YES;
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self setRightImage:@"question_mark"];
    [self configSeveralItem];
    [self configSelectItem];
    [self configScrollView];
    [self configAdapter];
    [self configVerity];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH - 44, 44)];
    _segmentView.titles = @[@"全部", @"待交收", @"交手中", @"待评价", @"解除", @"终止", @"强制解除", @"强制终止", @"已完成"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = UITitleColor;
    _segmentView.minTitleMargin = 12;
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
    _scrollView.dataSource =@[@"全部", @"待交收", @"交手中", @"待评价", @"解除", @"终止", @"强制解除", @"强制终止", @"已完成"];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
