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
    DZMyDeliveryAdapter *_adapter10;
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
//    [self requestData:@""];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH - 44, 44)];
    _segmentView.titles = @[@"全部", @"待发货", @"待验货", @"待验票", @"验货异议中", @"验票异议中", @"强制解除", @"解除", @"待支付", @"已完成"];
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
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource =@[@"全部", @"待发货", @"待验货", @"待验票", @"验货异议中", @"验票异议中", @"强制解除", @"解除", @"待支付", @"已完成"];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
        [me requestDataType:num];
    }];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH *_integer, 0)];
}
- (void)configAdapter{
    _adapter1 = [[DZMyDeliveryAdapter alloc]init];
    _adapter2 = [[DZMyDeliveryAdapter alloc]init];
    _adapter3 = [[DZMyDeliveryAdapter alloc]init];
    _adapter4 = [[DZMyDeliveryAdapter alloc]init];
    _adapter5 = [[DZMyDeliveryAdapter alloc]init];
    _adapter6 = [[DZMyDeliveryAdapter alloc]init];
    _adapter7 = [[DZMyDeliveryAdapter alloc]init];
    _adapter8 = [[DZMyDeliveryAdapter alloc]init];
    _adapter9 = [[DZMyDeliveryAdapter alloc]init];
    _adapter10 = [[DZMyDeliveryAdapter alloc]init];
    NSArray *adpterArr = @[_adapter1, _adapter2, _adapter3, _adapter4, _adapter5, _adapter6, _adapter7, _adapter8, _adapter9, _adapter10];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
}
- (void)configVerity{
    _varietyView = [[DZMySelectedView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"全部", @"待发货", @"待验货", @"待验票", @"验货异议中", @"验票异议中", @"强制解除", @"解除", @"待支付", @"已完成"];
    [self.view addSubview:_varietyView];
    [_varietyView setCurrent:_integer];
    [_varietyView bringSubviewToFront:_scrollView];
    WEAK_SELF
    [_varietyView setSelectIndex:^(NSIndexPath *indexPath) {
        me.segmentView.selectedIndex = indexPath.item;
        [me.scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * indexPath.item, 0) animated:YES];
        [me imageVisSelected];
        [me requestDataType:indexPath.item];
    }];
}
- (void)segmentedDidChange:(NSInteger)index{
    _isSelected = NO;
    [self imageVisSelected];
    [_varietyView setCurrent:index];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
    [self requestDataType:index];
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
- (void)requestData:(NSString *)type{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if ([type isEqualToString:@""]) {
            [_adapter1 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"2"]){
            [_adapter2 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"4"]){
            [_adapter3 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"3"]){
            [_adapter4 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"5"]){
            [_adapter5 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"6"]){
            [_adapter6 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"0"]){
            [_adapter7 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"1"]){
            [_adapter8 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"8"]){
            [_adapter9 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"7"]){
            [_adapter10 reloadData:[obj objectForKey:@"list"]];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:type forKey:@"delivBillStateType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory deliveryList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}
- (void)requestDataType:(NSInteger )integer{
    if (integer == 0) {
        [self requestData:@""];
    }else if (integer == 1){
        [self requestData:@"2"];
    }else if (integer == 2){
        [self requestData:@"4"];
    }else if (integer == 3){
        [self requestData:@"3"];
    }else if (integer == 4){
        [self requestData:@"5"];
    }else if (integer == 5){
        [self requestData:@"6"];
    }else if (integer == 6){
        [self requestData:@"0"];
    }else if (integer == 7){
        [self requestData:@"1"];
    }else if (integer == 8){
        [self requestData:@"8"];
    }else if (integer == 9){
        [self requestData:@"7"];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
