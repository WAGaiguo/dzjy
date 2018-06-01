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
    [self requestData];
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
- (void)requestData{
    //    DZRequestParams *params = [DZRequestParams new];
    ////    NSLog(@"id::::::  %@",_dic[@"id"]);
    ////    [params putString:@"3304123598642999226" forKey:@"id"];
    //    DZResponseHandler *handler = [DZResponseHandler new];
    //    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
    //        NSLog(@"%@", [obj mj_JSONString]);
    //    }];
    //    [handler setDidFailed:^(DZRequestMananger *manager) {
    //        NSLog(@"---失败---");
    //    }];
    //    DZRequestMananger *manager = [DZRequestMananger new];
    ////    NSString *strUrl = @"http://192.168.20.243/memb/w/address/get?id=3304123598642999226";
    //    [manager setUrlString:[DZURLFactory addressGet]];
    //    [manager setHandler:handler];
    //    [manager setParams:[params params]];
    //    [manager post];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@ %@",[[DZUserManager manager] user].tokenType,[[DZUserManager manager] user].accessToken] forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"image/png", nil];
    
    //    @{@"3304123598642999226"};
    [manager POST:@"http://192.168.20.5/memb/w/address/get" parameters:@[@"3304123598642999226"] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", [responseObject mj_JSONString]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}
@end
