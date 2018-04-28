//
//  DZMineViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineViewController.h"
#import "DZTestAdapter.h"
#import "DZMineCollectionViewCell.h"
#import "DZMineCollectionReusableView.h"
#import "DZMineHeaderView.h"
#import "DZMineFooterView.h"
#import "DZLoginViewController.h"
#import "DZMyBoughtViewController.h"
#import "DZMyPointsViewController.h"
#import "DZMyAttentionViewController.h"
#import "DZMyClientViewController.h"
#import "DZMyOrderViewController.h"
#import "DZSettingViewController.h"
#import "DZMyFundViewController.h"
#import "DZMyContractViewController.h"


@interface DZMineViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    DZMineHeaderView *_headerView;
    DZMineFooterView *_footerView;
    
    DZTestAdapter *_adapter;
    UICollectionView *_collectionV;
    NSMutableArray *_sectionState;
}

@end

@implementation DZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleView.backgroundColor = UIClearColor;
    [self setRightImage:@"设置"];
    [self.titleView setIsTitleWhite:YES];
    [self configHeader];
    [self configFooter];
}

- (void)configHeader{
    WEAK_SELF
    _headerView = [[DZMineHeaderView alloc]init];
    [_headerView setLogined:NO];
//    [_headerView setTitle:@"关怀久" subTitle:@"公司全称：：：：" img:nil];
    [_headerView setLoginBlock:^{
        [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];
    }];
    [_headerView setSelectBlock:^(NSInteger integer) {
        if (integer == 0) {
            [me.navigationController pushViewController:[DZMyFundViewController new] animated:YES];
        }
        if (integer == 1) {
            [me.navigationController pushViewController:[DZMyClientViewController new] animated:YES];return;
        }
        if (integer == 2) {
            [me.navigationController pushViewController:[DZMyAttentionViewController new] animated:YES];return;
        }
        if (integer == 3) {
            [me.navigationController pushViewController:[DZMyPointsViewController new] animated:YES];return;
        }
    }];
    self.tableView.tableHeaderView = _headerView;
    self.tableView.frame = SCREEN_BOUNDS;
    self.tableView.height = SCREEN_HEIGHT - 44;
    self.tableView.backgroundColor = UIBackgroundColor;
    self.tableView.sectionHeaderHeight = 0.01;
    self.tableView.sectionFooterHeight = 0.01;
}
- (void)configFooter{
    _footerView = [[DZMineFooterView alloc]init];
    self.tableView.tableFooterView = _footerView;
    WEAK_SELF
    [_footerView setTapLeftBlock:^(NSInteger num) {
        if (num == 0) {
            [me.navigationController pushViewController:[DZMyBoughtViewController new] animated:YES];
        } else if (num == 1){
            [me.navigationController pushViewController:[DZMyOrderViewController new] animated:YES];
        }else if (num == 2){
            [me.navigationController pushViewController:[DZMyContractViewController new] animated:YES];
        }else if (num == 3){
            
        }

    }];
    [_footerView setTapRightBlock:^(NSInteger num) {
        [HudUtils showMessage:[NSString stringWithFormat:@"%ld",num]];
    }];
}

- (void)more {
    [self.navigationController pushViewController:[DZSettingViewController new] animated:YES];
}










- (void)configCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH/3.0, 100);
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    _collectionV.showsVerticalScrollIndicator = NO;
    _collectionV.backgroundColor = UIGreenColor;
    [self.view addSubview:_collectionV];
    _collectionV.dataSource = self;
    _collectionV.delegate = self;
    [_collectionV registerClass:[DZMineCollectionViewCell class] forCellWithReuseIdentifier:@"mineCell"];
    [_collectionV registerClass:[DZMineCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader"];
    
    _sectionState =  [NSMutableArray arrayWithArray:@[@0, @0]];
    
}

#pragma collectionV dataSource and delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_sectionState[section] isEqualToNumber: @1] ? 4:0;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZMineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCell" forIndexPath:indexPath];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    DZMineCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader" forIndexPath:indexPath];
    [view setTapBlock:^{
        [self testZheDie:indexPath.section];
    }];
    return view;
}

- (void)testZheDie:(NSInteger)section{
    if ([_sectionState[section] isEqualToNumber:@0]) {
        [_sectionState replaceObjectAtIndex:section withObject: @1];
    }else{
        [_sectionState replaceObjectAtIndex:section withObject: @0];
    }
    NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:section];
    [_collectionV reloadSections:indexSet];

}

- (void)test{
    _adapter = [[DZTestAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    //    [self addPullToRefresh];
    [self addInfinite];
    [self.tableView setTop:88];
    [self.tableView setHeight:SCREEN_HEIGHT - 88 - 64];
    
    [self addBtn];
}
- (void)addBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    btn.frame = CGRectMake(200, 200, 100, 100);
    btn.backgroundColor = UIOrangeColor;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickBtn{
    [self stopRefresh];
//    [self stopInfinite];
    [self addNoMoreData];
}

- (void)pullToRefresh{
    [HudUtils showMessage:@"下拉刷新测试"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
