//
//  DZMyAddressAddController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressAddController.h"
#import "DZMyAddressView.h"
#import "DZMyInvoiceSetDefaultView.h"
#import "DZCommonSaveView.h"
#import "NSString+PDRegex.h"
#import "CKDatePickerView.h"

@interface DZMyAddressAddController (){
    DZMyAddressView *_addressView;
    DZMyInvoiceSetDefaultView *_defaultView;
    BOOL isDefault;
    NSString *compAreaCitys;
    NSString *compAreaDists;
    NSString *compAreaProvs;
}

@end

@implementation DZMyAddressAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    isDefault = NO;
    [self setTitle:@"新增地址"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configHeader];
    [self configSaveFooter];
}
- (void)configHeader{
    _addressView = [[DZMyAddressView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 343 - 48 - 48 - 48)];
    _addressView.backV.height = 48 * 4;
    self.tableView.tableHeaderView = _addressView;
//    _defaultView = [[DZMyInvoiceSetDefaultView alloc]initWithFrame:CGRectMake(7, 240, SCREEN_WIDTH - 14, 48)];
//    [_addressView.backV addSubview:_defaultView];
    WEAK_SELF
    [_addressView setTapDistrictBlock:^{
        [me selectDistrict];
    }];
    [_defaultView setOnBlock:^(BOOL isOn) {
        isDefault = isOn;
    }];
}
- (void)selectDistrict{
    [MAIN_WINDOW endEditing:YES];
    CKDatePickerView *picker = [CKDatePickerView new];
    [picker setSelectBlock:^(NSString *text, NSString *compAreaProv, NSString *provId, NSString *compAreaCity, NSString *cityId, NSString *compAreaDist, NSString *distId) {
        _addressView.districtField.text = text;
        compAreaProvs = provId;
        compAreaCitys = cityId;
        compAreaDists = distId;
    }];

    [picker show];
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
//    NSString *code = _addressView.codeField.text;
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
//    if (TRIM_STRING_length(code) <= 0) {
//        [HudUtils showMessage:@"请输入您的身份证号"];return;
//    }
    if (![phone isPhoneNumber]) {
        [HudUtils showMessage:@"请输入正确的手机号"];return;
    }
//    if (![code isIdentity]) {
//        [HudUtils showMessage:@"请输入正确的身份证号"];return;
//    }
    
    [self requestData:person address:address mobile:phone];
}
- (void)requestData:(NSString *)contactName address:(NSString *)address mobile:(NSString *)mobile{
    DZRequestParams *params = [DZRequestParams new];
    [params putString:address forKey:@"address"];
    [params putString:contactName forKey:@"contactName"];
    [params putString:mobile forKey:@"mobile"];
    [params putString:compAreaProvs forKey:@"compAreaProv"];
    [params putString:compAreaCitys forKey:@"compAreaCity"];
    [params putString:compAreaDists forKey:@"compAreaDist"];
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [HudUtils showMessage:@"保存成功"];
        if (_backBlock) {
            _backBlock();
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        NSLog(@"失败----失败");
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory addressInsert]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
