//
//  DZMyAddressViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressViewController.h"
#import "DZMyAddressAdapter.h"
#import "DZMyAddressAddController.h"

@interface DZMyAddressViewController (){
    DZMyAddressAdapter *_adapter;
}

@end

@implementation DZMyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的常用地址"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configAdapter];
    [self configHeaderLineView];
}
- (void)configAdapter{
    _adapter = [DZMyAddressAdapter new];
    [self.tableView setAdapter:_adapter];
    [self.tableView setSectionFooterHeight:0.01];
    [self.tableView setTableFooterView:[self configFooterBtn:@"添加地址"]];
}
- (void)configHeaderLineView{
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.width = SCREEN_WIDTH;
    imageV.height = 4;
    imageV.image = [UIImage imageNamed:@"fengexian"];
    [self.tableView setTableHeaderView:imageV];
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
        [self.navigationController pushViewController:[DZMyAddressAddController new] animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [backV addSubview:btn];
    return backV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
