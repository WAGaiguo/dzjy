//
//  DZMyLadingViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyLadingViewController.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMySelectedView.h"
#import "DZMyLadingAdapter.h"
#import "DZCommonTipsView.h"

@interface DZMyLadingViewController ()<SVSegmentedViewDelegate>{
    DZMyLadingAdapter *_adapter1;
    DZMyLadingAdapter *_adapter2;
    DZMyLadingAdapter *_adapter3;
    DZMyLadingAdapter *_adapter4;
    DZMyLadingAdapter *_adapter5;
    UIImageView *_imageV;
    DZMySelectedView *_varietyView;
    BOOL _isSelected;
}
@property (nonatomic, strong) DZMineCommenScrollView *scrollView;
@property (nonatomic, strong) SVSegmentedView *segmentView;
@end

@implementation DZMyLadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self configSeveralItem];
    [self configSelectItem];
    [self configScrollView];
    [self configAdapter];
    [self configVerity];
}
- (void)configHeader{
    [self setTitle:@"我的提单"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self requestData:@""];
}

-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH - 44, 44)];
    _segmentView.titles = @[@"全部", @"待打印", @"已打印", @"已完成", @"取消"];
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
    _scrollView.dataSource = @[@"全部", @"待打印", @"已打印", @"已完成", @"取消"];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
        [me requestDataIntger:num];
    }];
}
- (void)configAdapter{
    _adapter1 = [[DZMyLadingAdapter alloc]init];
    _adapter2 = [[DZMyLadingAdapter alloc]init];
    _adapter3 = [[DZMyLadingAdapter alloc]init];
    _adapter4 = [[DZMyLadingAdapter alloc]init];
    _adapter5 = [[DZMyLadingAdapter alloc]init];
    NSArray *adpterArr = @[_adapter1, _adapter2, _adapter3, _adapter4, _adapter5];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adpterArr[idx]];
    }];
}
- (void)configVerity{
    _varietyView = [[DZMySelectedView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"全部", @"待打印", @"已打印", @"已完成", @"取消"];
    [self.view addSubview:_varietyView];
    [_varietyView bringSubviewToFront:_scrollView];
    WEAK_SELF
    [_varietyView setSelectIndex:^(NSIndexPath *indexPath) {
        me.segmentView.selectedIndex = indexPath.item;
        [me.scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * indexPath.item, 0) animated:YES];
        [me imageVisSelected];
        [me requestDataIntger:indexPath.row];
    }];
}
- (void)segmentedDidChange:(NSInteger)index{
    _isSelected = NO;
    [self imageVisSelected];
    [_varietyView setCurrent:index];
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
    [self requestDataIntger:index];
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
        }else if ([type isEqualToString:@"0"]){
            [_adapter3 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"1"]){
            [_adapter2 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"2"]){
            [_adapter4 reloadData:[obj objectForKey:@"list"]];
        }else if ([type isEqualToString:@"3"]){
            [_adapter5 reloadData:[obj objectForKey:@"list"]];
        }
        
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:type forKey:@"takeBillStateType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    NSDictionary *dic1 = @{@"pageInfo":@{@"pageNo":@"1", @"pageSize":@"100"}};
    NSMutableDictionary *dicAll = [NSMutableDictionary dictionary];
    [dicAll addEntriesFromDictionary:dic1];
    [dicAll addEntriesFromDictionary:[params params]];
    [manager setUrlString:[DZURLFactory ladingList]];
    [manager setParams:dicAll];
    [manager setHandler: handler];
    [manager post];
}
- (void)requestDataIntger:(NSInteger)intger{
    if (intger == 0) {
        [self requestData:@""];
    }else{
        [self requestData:[NSString stringWithFormat:@"%ld", (long)intger - 1]];
    }
}
- (void)more{
    DZCommonTipsView *tipsV = [DZCommonTipsView new];
    [tipsV myDeliveryAbnormalText];
    [self.view addSubview:tipsV];
    [tipsV startAnimation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
