//
//  DZMyInvoiceNormalEditController.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceNormalEditController.h"
#import "DZMyInvoiceNormalView.h"
#import "DZMyInvoiceSetDefaultView.h"
#import "DZCommonSaveView.h"

@interface DZMyInvoiceNormalEditController (){
    DZMyInvoiceNormalView *_invoiceView;
    DZMyInvoiceSetDefaultView *_defaultView;
    BOOL isDefault;
}

@end

@implementation DZMyInvoiceNormalEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"编辑增值税普通发票"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configHeader];
    [self configFooterBtn];
    [self setDic:_dic];
}
- (void)configHeader{
    _invoiceView = [[DZMyInvoiceNormalView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48 * 3 + 7)];
    self.tableView.tableHeaderView = _invoiceView;
    _defaultView = [[DZMyInvoiceSetDefaultView alloc]initWithFrame:CGRectMake(7, 48 * 2 + 1, SCREEN_WIDTH - 14, 47)];
    [_invoiceView.backV addSubview:_defaultView];
    [_defaultView setOnBlock:^(BOOL isOn) {
        isDefault = isOn;
    }];
}
- (void)configFooterBtn{
    DZCommonSaveView *saveV = [DZCommonSaveView new];
    [saveV setSaveBlock:^{
        [self saveMessage];
    }];
    self.tableView.sectionFooterHeight = 7;
    self.tableView.tableFooterView = saveV;
}
- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    _invoiceView.companyField.text = [self isNull:dic[@"compName"]];
    _invoiceView.codeField.text = [self isNull:dic[@"socioUniCreditCode"]];
    isDefault = [dic[@"defaultFlag"] isEqualToString:@"0"];
}

- (NSString *)isNull:(NSString *)str{
    if ([str isEqual:[NSNull null]]) {
        return @"";
    }
    return str;
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
        [HudUtils showMessage:@"保存成功"];
        if (_successBlock) {
            _successBlock();
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:company forKey:@"compName"];
    [params putString:code forKey:@"socioUniCreditCode"];
    [params putString:_dic[@"id"] forKey:@"id"];
    [params putString:isDefault?@"0":@"1" forKey:@"defaultFlag"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory invoiceUpdate]];
    [manager setParams:[params dicParams]];
    [manager setHandler: handler];
    [manager post];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
