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

@interface DZMineViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    DZTestAdapter *_adapter;
    UICollectionView *_collectionV;
    NSMutableArray *_sectionState;
}

@end

@implementation DZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setBackGroudHidden];
    [self setRightImage:@"设置"];
    [self configCollection];
  
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
