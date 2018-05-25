//
//  DZMyInvoiceAddController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceAddController.h"
#import "DZMyInvoiceView.h"
#import "DZMyInvoiceSetDefaultView.h"
#import "NSString+PDRegex.h"
#import "DZCommonSaveView.h"

@interface DZMyInvoiceAddController (){
    DZMyInvoiceView *_invoiceView;
    DZMyInvoiceSetDefaultView *_defaultView;
}

@end

@implementation DZMyInvoiceAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:_addTitle];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configHeader];
    [self configFooterBtn];
}

- (void)configHeader{
    _invoiceView = [[DZMyInvoiceView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 343 - 48)];
    _invoiceView.backV.height = 48 * 6;
    self.tableView.tableHeaderView = _invoiceView;
}
- (void)configFooterBtn{
    DZCommonSaveView *saveV = [DZCommonSaveView new];
    [saveV setSaveBlock:^{
        [self saveMessage];
    }];
    self.tableView.sectionFooterHeight = 7;
    self.tableView.tableFooterView = saveV;
}
- (void)saveMessage{
    NSString *company = _invoiceView.companyField.text;
    NSString *address = _invoiceView.addressField.text;
    NSString *phone = _invoiceView.phoneField.text;
    NSString *code = _invoiceView.codeField.text;
    NSString *bank = _invoiceView.bankField.text;
    NSString *account = _invoiceView.accountField.text;
    if (TRIM_STRING(company).length == 0) {
        [HudUtils showMessage:@"公司名不能为空"];return;
    }
    if (TRIM_STRING(address).length == 0) {
        [HudUtils showMessage:@"地址不能为空"];return;
    }
    if (TRIM_STRING(phone).length == 0) {
        [HudUtils showMessage:@"手机号不能为空"];return;
    }
    if (TRIM_STRING(code).length == 0) {
        [HudUtils showMessage:@"信用码不能为空"];return;
    }
    if (TRIM_STRING(bank).length == 0) {
        [HudUtils showMessage:@"银行卡号不能为空"];return;
    }
    if (TRIM_STRING(account).length == 0) {
        [HudUtils showMessage:@"银行账号不能为空"];return;
    }
    if (![phone isNumber]) {
        [HudUtils showMessage:@"请输入正确的手机号"];return;
    }
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setType:HZRequestManangerTypeBackground];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self.navigationController popViewControllerAnimated:YES];
        if (_successBlock) {
            _successBlock();
        }
        [HudUtils showMessage:@"保存成功"];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:company forKey:@"compName"];
    [params putString:address forKey:@"regAddress"];
    [params putString:phone forKey:@"regTel"];
    [params putString:code forKey:@"socioUniCreditCode"];
    [params putString:bank forKey:@"bankName"];
    [params putString:account forKey:@"bankAccNumb"];
    [params putString:[_invoType isEqualToString:@"0"]?@"0":@"1" forKey:@"invoType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory invoiceInsert]];
    [manager setParams:[params params]];
    [manager setHandler: handler];
    [manager post];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
