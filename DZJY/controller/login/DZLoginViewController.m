//
//  DZLoginViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZLoginViewController.h"
#import "DZPathGetter.h"
#import "NSString+Base64.h"
#import "NSString+MD5.h"
#import "NSString+Common.h"

@interface DZLoginViewController ()
{
    UITextField *_usernameField;
    UITextField *_passwordField;
    UITextField *_codeField;
    UIScrollView *_scrollView;
    UIButton *_codeBtn;
}
@end

@implementation DZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeScrollView];
    [self configHeaderAndX];
    [self configTextField];
    [self configLoginButton];
    
}
- (void)makeScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:SCREEN_BOUNDS];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + 1);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.backgroundColor = UIWhiteColor;
}
- (void)configHeaderAndX{
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
    closeBtn.frame = CGRectMake(SCREEN_WIDTH - 55, 25, 30, 30);
    [_scrollView addSubview:closeBtn];
    [closeBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    imageV.centerX = SCREEN_WIDTH/2.0;
    imageV.top = 100;
    [_scrollView addSubview:imageV];
}
- (void)configTextField{
    UIView *usernameView = [self commonFieldView:@"用户名"];
    usernameView.top = 200;
    [_scrollView addSubview:usernameView];
    _usernameField = [self textField:@"用户名"];
    [usernameView addSubview:_usernameField];
    
    UIView *passwordView = [self commonFieldView:@"旧密码"];
    passwordView.top = usernameView.bottom;
    [_scrollView addSubview:passwordView];
    _passwordField = [self textField:@"登录密码"];
    _passwordField.secureTextEntry = YES;
    [passwordView addSubview:_passwordField];
    UIImageView *hiddenImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"隐藏"]];
    hiddenImageV.centerY = 25;
    hiddenImageV.right = 250;
    hiddenImageV.height = 14;
    hiddenImageV.contentMode = UIViewContentModeScaleAspectFit;
    hiddenImageV.userInteractionEnabled = YES;
    [passwordView addSubview:hiddenImageV];
    [hiddenImageV bk_whenTapped:^{
        bool isHidden = _passwordField.secureTextEntry;
        _passwordField.secureTextEntry = isHidden ? NO : YES;
        if (_passwordField.secureTextEntry) {
            hiddenImageV.image = [UIImage imageNamed:@"隐藏"];
        }else{
            hiddenImageV.image = [UIImage imageNamed:@"显示"];
        }
    }];
    
//    UILabel *label = [[UILabel alloc]init];
//    [_scrollView addSubview:label];
//    label.sd_layout.widthIs(100).heightIs(20).topSpaceToView(passwordView, 10).leftSpaceToView(hiddenImageV, 0);
//    label.font = [UIFont systemFontOfSize:13];
//    label.textColor = UICommonColor;
//    label.text = @"忘记密码?";
//    label.userInteractionEnabled = YES;
//    [label bk_whenTapped:^{
//        [HudUtils showMessage:@"忘记密码"];
//    }];
    
//    UIView *codeView = [self commonFieldView:@"新密码"];
//    codeView.top = passwordView.bottom;
//    [_scrollView addSubview:codeView];
//    _codeField = [self textField:@"验证码"];
//    [codeView addSubview:_codeField];
}

- (void)configLoginButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(SCREEN_WIDTH/2 - 125, 400, 250, 42);
    [btn setBackgroundImage:[UIImage imageNamed:@"登录按钮"] forState:UIControlStateNormal];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    [_scrollView addSubview:btn];
    [btn bk_addEventHandler:^(id sender) {
        [self checkUsernameAndPassword];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, btn.bottom + 65, SCREEN_WIDTH, 15)];
    messageLabel.font = [UIFont systemFontOfSize:12];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = RGBCOLOR(153, 153, 153);
    messageLabel.text = @"还不是会员？请到电脑Web端注册成为会员";
    [_scrollView addSubview:messageLabel];
}
- (void)checkUsernameAndPassword{
    NSString *username = _usernameField.text;
    NSString *passWord = _passwordField.text;
    if(username == nil || username.length < 1){
        [HudUtils showMessage:@"请输入您用户名"]; return;
    }
    if(passWord == nil || passWord.length < 1){
        [HudUtils showMessage:@"请输入您的密码"]; return;
    }
    [self loginRequestData];
}
- (void)loginRequestData{
    [HudUtils show:MAIN_WINDOW];
    NSString *username = _usernameField.text;
    NSString *passWord = _passwordField.text;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *md5PassWord = [passWord MD5Hash];
    NSString *userAndPassword = [NSString stringWithFormat:@"%@:%@",username,md5PassWord];
    NSString *headerStr = [NSString stringWithFormat:@"Basic %@",[userAndPassword base64NativeEncodedString]];
    [manager.requestSerializer setValue:headerStr forHTTPHeaderField:@"Authorization"];
    [manager POST:[DZURLFactory login] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [HudUtils hide:MAIN_WINDOW];
        if (responseObject == [NSNull null]) {
            [HudUtils showMessage:@"登录异常"]; return;
        }
        if (responseObject == nil) {
            [HudUtils showMessage:@"服务端异常 请稍后重试"];return;
        }
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        if (dic.count <= 0) {
            [HudUtils showMessage:@"登录异常 请稍后重试"]; return ;
        }
        DZUserManager *manager = [DZUserManager manager];
        [manager login:dic[@"result"]];
        [HudUtils showMessage:@"登录成功"];
         [[DZRequestMananger new] setHeader:nil];
        [self back];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [HudUtils hide:MAIN_WINDOW];
        if (error == nil) {
            [HudUtils showMessage:@"服务端异常 请稍后重试"];return ;
        }
        NSDictionary *errorDic = [NSJSONSerialization JSONObjectWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:NSJSONReadingMutableContainers error:nil];
        if (errorDic.count <= 0) {
            [HudUtils showMessage:@"服务端异常 请稍后重试"];return ;
        }
        [HudUtils showMessage:errorDic[@"message"]];
    }];
    
}

- (UITextField *)textField:(NSString *)placeHodler {
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeHodler;
    textField.height = 50;
    textField.width = 200;
    textField.top = 0;
    textField.left = 25;
    textField.font = [UIFont systemFontOfSize:15];
    textField.returnKeyType = UIReturnKeyDone;
    [textField setBk_shouldReturnBlock:^BOOL(UITextField *textField) {
       return [MAIN_WINDOW endEditing:YES];
    }];
    return textField;
}

- (UIView *)commonFieldView:(NSString *)imgStr{
    UIView *view = [[UIView alloc]init];
    view.width = 250;
    view.height = 51;
    view.centerX = SCREEN_WIDTH/2.0;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 250, 1)];
    lineView.backgroundColor = UISeperatorColor;
    [view addSubview:lineView];
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgStr]];
    imageV.centerY = 25;
    imageV.left = 0;
    [view addSubview:imageV];
    return view;
}

@end
