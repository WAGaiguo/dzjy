//
//  DZMyAdressEditController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressEditController.h"
#import "DZMyAddressView.h"
#import "DZMyInvoiceSetDefaultView.h"
#import "DZCommonSaveView.h"
#import "NSString+PDRegex.h"

@interface DZMyAddressEditController (){
    DZMyAddressView *_addressView;
    DZMyInvoiceSetDefaultView *_defaultView;
    BOOL isDefault;
}

@end

@implementation DZMyAddressEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    isDefault = NO;
    [self setTitle:@"编辑地址"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self configContentHeader];
    [self configSaveFooter];
}
- (void)configContentHeader{
    _addressView = [[DZMyAddressView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 343 - 48)];
    self.tableView.tableHeaderView = _addressView;
    _defaultView = [[DZMyInvoiceSetDefaultView alloc]initWithFrame:CGRectMake(7, 240, SCREEN_WIDTH - 14, 48)];
    [_addressView.backV addSubview:_defaultView];
    [_addressView setTapDistrictBlock:^{
        [HudUtils showMessage:@"地址啊地址"];
    }];
    [_defaultView setOnBlock:^(BOOL isOn) {
        isDefault = isOn;
    }];
}
- (void)configSaveFooter{
    DZCommonSaveView *saveBtn = [[DZCommonSaveView alloc]init];
    self.tableView.tableFooterView = saveBtn;
    self.tableView.sectionFooterHeight = 7;
    [saveBtn setSaveBlock:^{
        [self save];
    }];
}
- (void)save{
    NSString *person = _addressView.personField.text;
    NSString *district = _addressView.districtField.text;
    NSString *address = _addressView.addressField.text;
    NSString *phone = _addressView.phoneField.text;
    NSString *code = _addressView.codeField.text;
    if (TRIM_STRING_length(person) <= 0) {
        [HudUtils showMessage:@"联系人不能为空"];return;
    }
    if (TRIM_STRING_length(district) <= 0) {
        [HudUtils showMessage:@"请选择您的地区"];return;
    }
    if (TRIM_STRING_length(address) <= 0) {
        [HudUtils showMessage:@"请输入您的详细地址"];return;
    }
    if (TRIM_STRING_length(phone) <= 0) {
        [HudUtils showMessage:@"请输入您的手机号"];return;
    }
    if (TRIM_STRING_length(code) <= 0) {
        [HudUtils showMessage:@"请输入您的身份证号"];return;
    }
    if (![phone isPhoneNumber]) {
        [HudUtils showMessage:@"请输入正确的手机号"];return;
    }
    if (![code isIdentity]) {
        [HudUtils showMessage:@"请输入正确的身份证号"];return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
