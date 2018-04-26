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

#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)

@interface DZMyOrderViewController ()<SVSegmentedViewDelegate>{
    DZMyOrderAdapter *_allAdapter;
    DZMyOrderAdapter *_bothAdapter;
    DZMyOrderAdapter *_buyAdapter;
    DZMyOrderAdapter *_sellAdapter;
    DZMyOrderAdapter *_contractAdapter;
    DZMyOrderAdapter *_cancelAdapter;
    UIImageView *_imageV;
    BOOL _isSelected;
    DZMySelectedView *_varietyView;
}
@property (nonatomic, strong) SVSegmentedView *segmentView;
@end

@implementation DZMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSelected = YES;
    [self configTitle];
    [self configSeveralItem];
    [self configSelectItem];
    [self configVerity];
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
    [self.view addSubview:_segmentView];
}
- (void)configSelectItem{
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 44, DZ_TOP, 44, 44)];
    _imageV.image = [UIImage imageNamed:@"back_gray"];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageV];
    _imageV.transform = CGAffineTransformMakeRotation(M_PI/2);
    _imageV.userInteractionEnabled = YES;
    [_imageV bk_whenTapped:^{
        [self imageVisSelected];
    }];
}
- (void)imageVisSelected{
    if (_isSelected) {
        _imageV.transform = CGAffineTransformMakeRotation(-M_PI/2);
        [_varietyView setAnimation];
    }else{
        _imageV.transform = CGAffineTransformMakeRotation(M_PI/2);
        [_varietyView setSelfHide];
    }
    _isSelected = ! _isSelected;
}
- (void)configVerity{
    _varietyView = [[DZMySelectedView alloc]initWithFrame:COMMON_FRAME];
    _varietyView.dataSource = @[@"全部", @"待双方支付", @"待买方支付", @"待卖方支付", @"已生成合同", @"取消", @"撤销"];
    [self.view addSubview:_varietyView];
    WEAK_SELF
    [_varietyView setSelectIndex:^(NSIndexPath *indexPath) {
        me.segmentView.selectedIndex = indexPath.item;
        [me imageVisSelected];
    }];
}
- (void)segmentedDidChange:(NSInteger)index{
    _isSelected = NO;
    [self imageVisSelected];
    [_varietyView setCurrent:index];
}
- (void)more{
    DZMyOrderTipsView *tipView = [[DZMyOrderTipsView alloc]init];
    [self.view addSubview:tipView];
    [tipView startAnimation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
