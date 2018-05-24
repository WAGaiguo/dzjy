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
#import "NSString+Common.h"
#import "DZMyAddressCell.h"
#import "DZAlertview.h"
#import "DZMyAddressEditController.h"

@interface DZMyAddressViewController (){
//    DZMyAddressAdapter *_adapter;
}
@property (nonatomic, strong)DZMyAddressAdapter *adapter;
@end

@implementation DZMyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的常用地址"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configAdapter];
    [self configHeaderLineView];
    [self requestData];

}
- (void)configAdapter{
    _adapter = [DZMyAddressAdapter new];
    [self.tableView setAdapter:_adapter];
    [self.tableView setSectionFooterHeight:0.01];
    [self.tableView setTableFooterView:[self configFooterBtn:@"添加地址"]];
    WEAK_SELF
    [_adapter setAfterReuseCell:^(DZMyAddressCell *cell, NSIndexPath *indexPath) {
       __weak DZMyAddressCell *weak_cell = cell;
        [cell setTapBlock:^(NSInteger integer) {
            [me tapBtn:integer cell:weak_cell dic:me.adapter.dataSource[indexPath.row]];
        }];
    }];
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
        DZMyAddressAddController *addController = [DZMyAddressAddController new];
        [addController setBackBlock:^{
            [self requestData];
        }];
        [self.navigationController pushViewController:addController animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [backV addSubview:btn];
    return backV;
}
#pragma 地址列表数据请求操作
- (void)requestData{
    DZRequestParams *params = [DZRequestParams new];
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_adapter reloadData:obj];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory addressList]];
    [manager setHandler:handler];
    [manager setParams:[params params]];
    [manager post];
}
/*
 * 点击编辑相关操作
 */
- (void)tapBtn:(NSInteger )integer cell:(DZMyAddressCell *)cell dic:(NSDictionary *)dic{
    DZAlertview *alertView = [DZAlertview new];
  
    if (integer == 1) {
        if ([[dic objectForKey:@"defaultFlag"] isEqualToString:@"1"]) {
            [self requestSetDefault:dic];
        }
    }else if (integer == 2){
        DZMyAddressEditController *editController = [DZMyAddressEditController new];
        editController.dic = dic;
        [self.navigationController pushViewController:editController animated:YES];
        [editController setBackBlock:^{
            [self requestData];
        }];
    }else if (integer == 3){
        [alertView showAlert:@"是否删除" controller:self confirm:^{
            // 数据请求删除操作
            [self deleteAddress:[dic objectForKey:@"id"]];
        }];
    }
}
#pragma 设置默认操作
- (void)requestSetDefault:(NSDictionary *)dic{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setType:HZRequestManangerTypeBackground];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self requestData];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:[dic[@"id"] description] forKey:@"id"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory addressDefault]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
    
}
- (void)deleteAddress:(NSString *)addressId{
//    DZRequestParams *params = [DZRequestParams new];
//    DZResponseHandler *handler = [DZResponseHandler new];
//    [params putString:addressId forKey:@"id"];
//    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
////        [HudUtils showMessage:@"删除成功"];
////        [self requestData];
//        NSLog(@"%@",[obj mj_JSONString]);
//    }];
//    DZRequestMananger *manager = [DZRequestMananger new];
//    [manager setUrlString:[DZURLFactory addressDelete]];
//    [manager setHandler:handler];
//    [manager setParams:[params params]];
//    [manager post];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setAccessibilityContainerType:(UIAccessibilityContainerType)];
//    [manager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@ %@",[[DZUserManager manager] user].tokenType,[[DZUserManager manager] user].accessToken] forHTTPHeaderField:@"Authorization"];
//    NSString *utf8Str = [NSString stringWithCString:[addressId UTF8String] encoding:NSUnicodeStringEncoding];
//    [manager.requestSerializer setValue:@"text/plain;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", @"text/json", @"text/javascript" ,nil];
    NSData *stringData = [addressId dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:stringData options:0 error:nil];
    NSLog(@"-------------************------------");
    NSLog(@"%@", stringData);
    NSLog(@"%@", json);
    NSDictionary *dic = @{@"id": addressId};
    [manager POST:[DZURLFactory addressDelete] parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", [responseObject mj_JSONString]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
