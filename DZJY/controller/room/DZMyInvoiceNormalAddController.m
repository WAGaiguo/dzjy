//
//  DZMyInvoiceNormalAddController.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceNormalAddController.h"
#import "DZMyInvoiceNormalView.h"
#import "DZCommonSaveView.h"

@interface DZMyInvoiceNormalAddController (){
    DZMyInvoiceNormalView *_invoiceView;
}

@end

@implementation DZMyInvoiceNormalAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"新增增值税普通发票"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configHeader];
    [self configFooterBtn];
}

- (void)configHeader{
    _invoiceView = [[DZMyInvoiceNormalView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  48 * 2 + 7)];
    _invoiceView.backV.height = 48 * 2;
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
    NSString *code = _invoiceView.codeField.text;
    if (TRIM_STRING(company).length == 0) {
        [HudUtils showMessage:@"公司名不能为空"];return;
    }
    if (TRIM_STRING(code).length == 0) {
        [HudUtils showMessage:@"信用码不能为空"];return;
    }
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self.navigationController popViewControllerAnimated:YES];
        if (_successBlock) {
            _successBlock();
        }
        [HudUtils showMessage:@"保存成功"];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:company forKey:@"compName"];
    [params putString:code forKey:@"socioUniCreditCode"];
    [params putString:@"0" forKey:@"invoType"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory invoiceInsert]];
    [manager setParams:[params params]];
    [manager setHandler: handler];
    [manager post];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
