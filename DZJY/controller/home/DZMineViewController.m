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
#import "DZMessageNumsModel.h"


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
            DZMyBoughtViewController * boughtV = [DZMyBoughtViewController new];
            [boughtV requestDataType:0];
            [me.navigationController pushViewController:boughtV animated:YES];
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
        [myBought requestDataType:1];
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
    
    // 保证每次登陆完成 只加载一次信息数据
    static BOOL isFirst = YES;
    if ([manager isLogined]) {
        if (isFirst) {
            [self requestUserInforData];
            [self pullToRefresh];
            isFirst = NO;
            [self addPullToRefresh];
        }
    }else{
        isFirst = YES;
        [self noRefresh];
    }
}
- (void)relodCurrentState{
    if ([manager isLogined]) {
        [_headerView setLogined:YES];
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

- (void)pullToRefresh{
    DZMessageNumsModel *model = [DZMessageNumsModel new];
    [model startRequest];
    [model setSuccessBlock:^(NSDictionary *dic) {
        [self setTipsNums:dic];
        [self stopRefresh];
    }];
    [model setFaildBlock:^{
        [self stopRefresh];
    }];
}
- (void)setTipsNums:(NSDictionary *)dic{
    [self tipsZero];
    if (dic[@"1"] != nil) {
        [_footerView.firstItem setNums:[dic[@"1"] integerValue]];
    }
    if (dic[@"2"] != nil) {
        [_footerView.secondItem setNums:[dic[@"2"] integerValue]];
    }
    if (dic[@"3"] != nil) {
        [_footerView.second2Item setNums:[dic[@"3"] integerValue]];
    }
    if (dic[@"4"] != nil) {
        [_footerView.thirdItem setNums:[dic[@"4"] integerValue]];
    }
    if (dic[@"5"] != nil) {
        [_footerView.fourthItem setNums:[dic[@"5"] integerValue]];
    }
    if (dic[@"6"] != nil) {
        [_footerView.sixthItem setNums:[dic[@"6"] integerValue]];
    }
    if (dic[@"7"] != nil) {
        [_footerView.seventhItem setNums:[dic[@"7"] integerValue]];
    }
}

- (void)requestUserInforData{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeBackground;
    [handler setDidSuccess:^(DZRequestMananger *manager1, id obj) {
        [_headerView setTitle:manager.user.loginName subTitle:[obj[@"compFullName"] description] img:[NSString stringWithFormat:@"%@%@",DZCommonUrl, obj[@"compLogo"]] type:obj[@"memebGrade"]];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory memberInfo]];
    [manager setHandler:handler];
    [manager post];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
