//
//  DZMineViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineViewController.h"
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
#import "DZMyContractAbnormalController.h"
#import "DZMyDeliveryViewController.h"
#import "DZMyDeliveryAbnormalController.h"
#import "DZMyLadingViewController.h"


@interface DZMineViewController ()
{
    DZMineHeaderView *_headerView;
    DZMineFooterView *_footerView;
    
//    DZTestAdapter *_adapter;
    UICollectionView *_collectionV;
    NSMutableArray *_sectionState;
    DZUserManager *manager;
}

@end

@implementation DZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [DZUserManager manager];
    self.titleView.backgroundColor = UIClearColor;
    [self setRightImage:@"设置"];
    [self.titleView setIsTitleWhite:YES];
    [self configHeader];
    [self configFooter];
    [self addPullToRefresh];
}

- (void)configHeader{
    WEAK_SELF
    _headerView = [[DZMineHeaderView alloc]init];
    [_headerView setLoginBlock:^{
        [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];
    }];
    __weak DZUserManager *weak_manager = manager;
    [_headerView setSelectBlock:^(NSInteger integer) {
        if (![weak_manager isLogined]) {
            [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];return ;
        }
        if (integer == 0) {
            [me.navigationController pushViewController:[DZMyFundViewController new] animated:YES];return ;
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
    __weak DZUserManager *weak_manager = manager;
    [_footerView setTapLeftBlock:^(NSInteger num) {
        if (![weak_manager isLogined]) {
            [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];return;
        }
        if (num == 0) {
            [me.navigationController pushViewController:[DZMyBoughtViewController new] animated:YES];
        } else if (num == 1){
            DZMyOrderViewController *order = [DZMyOrderViewController new];
            [order reqeustDataType:0];
            [me.navigationController pushViewController:order animated:YES];
        }else if (num == 2){
            DZMyContractViewController *contractV = [DZMyContractViewController new];
            [contractV reqeustDataType:0];
            [me.navigationController pushViewController:contractV animated:YES];
        }else if (num == 3){
            DZMyDeliveryViewController *deliveryV = [DZMyDeliveryViewController new];
            [deliveryV requestDataType:0];
            [me.navigationController pushViewController:deliveryV animated:YES];
        }

    }];
    [_footerView setTapRightBlock:^(NSInteger num) {
        [me tapFooterRightItem:num];
    }];
}
- (void)tapFooterRightItem:(NSInteger )num{
    if (![manager isLogined]) {
        [self presentViewController:[DZLoginViewController new] animated:YES completion:nil];return;
    }
    if (num == 0) {
        DZMyBoughtViewController *myBought = [[DZMyBoughtViewController alloc]init];
        myBought.integer = 1;
        [self.navigationController pushViewController:myBought animated:YES];
    } else if (num == 1){
        DZMyOrderViewController *myOrder = [DZMyOrderViewController new];
        myOrder.integer = 2;
        [myOrder reqeustDataType:2];
        [self.navigationController pushViewController:myOrder animated:YES];
    }else if (num == 2){
        DZMyOrderViewController *myOrder = [DZMyOrderViewController new];
        myOrder.integer = 3;
        [myOrder reqeustDataType:3];
        [self.navigationController pushViewController:myOrder animated:YES];
    }else if (num == 3){
        DZMyContractViewController *contract = [DZMyContractViewController new];
        [contract reqeustDataType:1];
        contract.integer = 1;
        [self.navigationController pushViewController:contract animated:YES];
    }else if (num == 4){
        DZMyContractViewController *contract = [DZMyContractViewController new];
        [contract reqeustDataType:3];
        contract.integer = 3;
        [self.navigationController pushViewController:contract animated:YES];
    }else if (num == 5){
        [self.navigationController pushViewController:[DZMyContractAbnormalController new] animated:YES];
    }else if (num == 6){
        DZMyDeliveryViewController *deliveryV = [DZMyDeliveryViewController new];
        deliveryV.integer = 2;
        [deliveryV requestDataType:2];
        [self.navigationController pushViewController:deliveryV animated:YES];
    }else if (num == 7){
        DZMyDeliveryViewController *deliveryV = [DZMyDeliveryViewController new];
        deliveryV.integer = 3;
        [deliveryV requestDataType:3];
        [self.navigationController pushViewController:deliveryV animated:YES];
    }else if (num == 8){
        [self.navigationController pushViewController:[DZMyDeliveryAbnormalController new] animated:YES];
    }else if (num == 9){
        [self.navigationController pushViewController:[DZMyLadingViewController new] animated:YES];
    }
}
- (void)more {
    [self.navigationController pushViewController:[DZSettingViewController new] animated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self relodCurrentState];
}
- (void)relodCurrentState{
    if ([manager isLogined]) {
        [_headerView setLogined:YES];
        [_headerView setTitle:@"关怀久" subTitle:@"公司全称：：：：" img:nil];
    }else{
        [_headerView setLogined:NO];
        [self tipsZero];
    }
}
- (void)tipsZero{
    [_footerView.firstItem setNums:0];
    [_footerView.secondItem setNums:0];
    [_footerView.second2Item setNums:0]; // 待卖方支付
    [_footerView.thirdItem setNums:0];
    [_footerView.fourthItem setNums:0];
    [_footerView.fifthItem setNums:0];
    [_footerView.sixthItem setNums:0];
    [_footerView.seventhItem setNums:0];
    [_footerView.eighthItem setNums:0];
    [_footerView.ninthItem setNums:0];
}







//- (void)configCollection{
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.minimumLineSpacing = 0;
//    layout.minimumInteritemSpacing = 0;
//    layout.itemSize = CGSizeMake(SCREEN_WIDTH/3.0, 100);
//    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
//    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
//    _collectionV.showsVerticalScrollIndicator = NO;
//    _collectionV.backgroundColor = UIGreenColor;
//    [self.view addSubview:_collectionV];
//    _collectionV.dataSource = self;
//    _collectionV.delegate = self;
//    [_collectionV registerClass:[DZMineCollectionViewCell class] forCellWithReuseIdentifier:@"mineCell"];
//    [_collectionV registerClass:[DZMineCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader"];
//
//    _sectionState =  [NSMutableArray arrayWithArray:@[@0, @0]];
//
//}
//
//#pragma collectionV dataSource and delegate
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return [_sectionState[section] isEqualToNumber: @1] ? 4:0;
//}
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 2;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    DZMineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCell" forIndexPath:indexPath];
//    return cell;
//}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    DZMineCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader" forIndexPath:indexPath];
//    [view setTapBlock:^{
//        [self testZheDie:indexPath.section];
//    }];
//    return view;
//}
//
//- (void)testZheDie:(NSInteger)section{
//    if ([_sectionState[section] isEqualToNumber:@0]) {
//        [_sectionState replaceObjectAtIndex:section withObject: @1];
//    }else{
//        [_sectionState replaceObjectAtIndex:section withObject: @0];
//    }
//    NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:section];
//    [_collectionV reloadSections:indexSet];
//
//}
//
//- (void)test{
//    _adapter = [[DZTestAdapter alloc]init];
//    [self.tableView setAdapter:_adapter];
//    //    [self addPullToRefresh];
//    [self addInfinite];
//    [self.tableView setTop:88];
//    [self.tableView setHeight:SCREEN_HEIGHT - 88 - 64];
//
//    [self addBtn];
//}
//- (void)addBtn{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
//    btn.frame = CGRectMake(200, 200, 100, 100);
//    btn.backgroundColor = UIOrangeColor;
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
//}
//- (void)clickBtn{
//    [self stopRefresh];
////    [self stopInfinite];
//    [self addNoMoreData];
//}

- (void)pullToRefresh{
    [HudUtils showMessage:@"下拉刷新测试"];
    [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
