//
//  DZMyContractViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyContractViewController.h"
#import "DZMyContractAdapter.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMySelectedView.h"

@interface DZMyContractViewController ()<SVSegmentedViewDelegate>{
    DZMyContractAdapter *_adapter1;
    DZMyContractAdapter *_adapter2;
    DZMyContractAdapter *_adapter3;
    DZMyContractAdapter *_adapter4;
    DZMyContractAdapter *_adapter5;
    DZMyContractAdapter *_adapter6;
    DZMyContractAdapter *_adapter7;
    DZMyContractAdapter *_adapter8;
    DZMyContractAdapter *_adapter9;
    UIImageView *_imageV;
    DZMySelectedView *_varietyView;
    BOOL _isSelected;
}
@property (nonatomic, strong) DZMineCommenScrollView *scrollView;
@property (nonatomic, strong) SVSegmentedView *segmentView;
@end

@implementation DZMyContractViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self configSeveralItem];
    [self configSelectItem];
    [self configScrollView];
    [self configAdapter];
    [self configVerity];
    [self requestData:@""];
}
- (void)configHeader{
    [self setTitle:@"我的合同"];
    _isSelected = YES;
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self setRightImage:@"question_mark"];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH - 44, 44)];
    _segmentView.titles = @[@"全部", @"待交收", @"交收中", @"待评价", @"解除", @"终止", @"强制解除", @"强制终止", @"已完成"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = UITitleColor;
    _segmentView.minTitleMargin = 12;
    _segmentView.selectedIndex = _integer;
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
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH *_integer, 0)];
//    [_scrollView setScrollBlock:^(NSInteger num) {
//        [me reqeustDataType:num];
//    }];
}
- (void)configAdapter{
    _adapter1 = [DZMyContractAdapter new];
    _adapter2 = [DZMyContractAdapter new];
    _adapter3 = [DZMyContractAdapter new];
    _adapter4 = [DZMyContractAdapter new];
    _adapter5 = [DZMyContractAdapter new];
    _adapter6 = [DZMyContractAdapter new];
    _adapter7 = [DZMyContractAdapter new];
    _adapter8 = [DZMyContractAdapter new];
    _adapter9 = [DZMyContractAdapter new];
    NSArray *adpterArr = @[_adapter1, _adapter2, _adapter3, _adapter4, _adapter5, _adapter6, _adapter7, _adapter8, _adapter9];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
}
- (void)configVerity{
    _varietyView = [[DZMySelectedView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"全部", @"待交收", @"交收中", @"待评价", @"解除", @"终止", @"强制解除", @"强制终止", @"已完成"];
    [self.view addSubview:_varietyView];
    [_varietyView setCurrent:_integer];
    WEAK_SELF
    [_varietyView setSelectIndex:^(NSIndexPath *indexPath) {
        me.segmentView.selectedIndex = indexPath.item;
        [me.scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * indexPath.item, 0) animated:YES];
        [me imageVisSelected];
        [me reqeustDataType:indexPath.row];
    }];
}
- (void)segmentedDidChange:(NSInteger)index{
    _isSelected = NO;
    [self imageVisSelected];
    [_varietyView setCurrent:index];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
    [self reqeustDataType:index];
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
        } else if ([type isEqualToString:@"0"]){
            [_adapter2 reloadData:[obj objectForKey:@"list"]];
        } else if ([type isEqualToString:@"1"]){
            [_adapter3 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"2"]){
            [_adapter4 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"3"]){
            [_adapter5 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"4"]){
            [_adapter6 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"5"]){
            [_adapter7 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"6"]){
            [_adapter8 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"7"]){
            [_adapter9 reloadData:[obj objectForKey:@"list"]];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:type forKey:@"contStateType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory contractList]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}
- (void)reqeustDataType:(NSInteger )integer{
    NSLog(@"%ld", integer);
    if (integer == 0) {
        [self requestData:@""];
    }else{
        [self requestData:[NSString stringWithFormat:@"%ld", integer - 1]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
