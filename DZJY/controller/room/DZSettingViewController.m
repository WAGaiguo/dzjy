//
//  DZSettingViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSettingViewController.h"
#import "DZSettingAdapter.h"
#import "DZUserManager.h"
#import "DZMyMembersViewController.h"
#import "DZPasswordChangeController.h"
#import "DZPhoneNumChangeController.h"
#import "DZMyInvoiceViewController.h"
#import "DZMyAddressViewController.h"
#import "DZLoginViewController.h"

@interface DZSettingViewController (){
    DZSettingAdapter *_adapter;
}

@end

@implementation DZSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"系统设置"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self configAdapter];
}

- (void)configAdapter{
    _adapter = [[DZSettingAdapter alloc]initWithDataSource:@[@"我的会员信息", @"修改注册手机号", @"修改登录密码", @"我的发票信息", @"我的常用地址", @"清除缓存", @"关于我们", @"当前版本 V1.0.0"]];
    [self.tableView setAdapter:_adapter];
    WEAK_SELF
    DZUserManager *manager = [DZUserManager manager];
    [_adapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        if (indexPath.row < 5) {
            if (![manager isLogined]) {
                [HudUtils showMessage:@"请先登录"];
                [me presentViewController:[DZLoginViewController new] animated:YES completion:nil];
                return ;
            }
        }
        if (indexPath.row == 0) {
            [me.navigationController pushViewController:[DZMyMembersViewController new] animated:YES];
        }else if (indexPath.row == 1){
            [me.navigationController pushViewController:[DZPhoneNumChangeController new] animated:YES];
        }else if (indexPath.row == 2){
            [me.navigationController pushViewController:[DZPasswordChangeController new] animated:YES];
        }else if (indexPath.row == 3){
            [me.navigationController pushViewController:[DZMyInvoiceViewController new] animated:YES];
        }else if (indexPath.row == 4){
            [me.navigationController pushViewController:[DZMyAddressViewController new] animated:YES];
        }else if (indexPath.row == 5){// 清除缓存
            [me clearCache];
        }else if (indexPath.row == 6){
            
        }else if (indexPath.row == 7){
            [HudUtils showMessage:@"当前已是最新版本"];
        }
    }];
    [self configFooterView];
}

- (void)configFooterView{
    UIView *backView = [[UIView alloc]init];
    backView.width = SCREEN_WIDTH;
    backView.height = 43;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(7, 0, SCREEN_WIDTH - 14, 43);
    [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn bk_addEventHandler:^(id sender) {
        [[DZUserManager manager] logout];
        if ([DZUserManager manager].user == nil) {
            [HudUtils showMessage:@"退出登录成功"];
            [self.navigationController popViewControllerAnimated:YES];
        } else{
            [HudUtils showMessage:@"退出登录异常，请稍后再试"];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:btn];
    self.tableView.tableFooterView = backView;
}
#pragma 清除 - SDImageCache - 缓存
- (void)clearCache{
    [HudUtils show:self.view];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        [HudUtils hide:self.view];
        [HudUtils showMessage:@"清除缓存成功"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
