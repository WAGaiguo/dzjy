//
//  DZMyInvoiceViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceViewController.h"
#import "SVSegmentedView.h"
#import "DZMineCommenScrollView.h"
#import "DZMyInvoiceAdapter.h"
#import "DZMyInvoiceAddController.h"

@interface DZMyInvoiceViewController ()<SVSegmentedViewDelegate>{
    DZMineCommenScrollView *_scrollView;
    DZMyInvoiceAdapter *_dedicatedAdapter;
    DZMyInvoiceAdapter *_normalAdapter;
}
@property (nonatomic, strong)SVSegmentedView *segmentView;

@end

@implementation DZMyInvoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的发票"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self configSeveralItem];
    [self configScrollView];
    [self configAdapter];
}
-(void)configSeveralItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"增值税专用发票", @"增值税普通发票"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(51, 51, 51);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [self.view addSubview:_segmentView];
}
- (void)configScrollView{
    WEAK_SELF
    _scrollView = [[DZMineCommenScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
    [self.view addSubview:_scrollView];
    _scrollView.dataSource = @[@"",@""];
    [_scrollView setScrollBlock:^(NSInteger num) {
        me.segmentView.selectedIndex = num;
    }];
}
- (void)configAdapter{
    _dedicatedAdapter = [DZMyInvoiceAdapter new];
    _normalAdapter = [DZMyInvoiceAdapter new];
    NSArray *adapterArr = @[_dedicatedAdapter, _normalAdapter];
    [_scrollView.tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setAdapter:adapterArr[idx]];
        if (idx == 0) {
            [obj setTableFooterView:[self configFooterBtn:@"新增增值税专用发票"]];
        }
        if (idx == 1) {
            [obj setTableFooterView:[self configFooterBtn:@"新增增值税普通发票"]];
        }
    }];
}
- (UIView *)configFooterBtn:(NSString *)title{
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(7, 7, SCREEN_WIDTH - 14, 43);
    [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"新增"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -15, 0.0, 0.0)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn bk_addEventHandler:^(id sender) {
        [self addInvoice:title];
    } forControlEvents:UIControlEventTouchUpInside];
    [backV addSubview:btn];
    return backV;
}
- (void)addInvoice:(NSString*)title{
    DZMyInvoiceAddController *addController = [[DZMyInvoiceAddController alloc]init];
    addController.addTitle = title;
    [self.navigationController pushViewController:addController animated:YES];
}
#pragma _segement delegate
- (void)segmentedDidChange:(NSInteger) index{
    [_scrollView.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
