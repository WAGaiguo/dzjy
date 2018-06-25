//
//  DZPhoneNumChangeController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZPhoneNumChangeController.h"
#import "DZPhoneChangeView.h"
#import "DZPhoneChangeTipsView.h"
#import "NSString+Common.h"
#import "NSString+PDRegex.h"
#import "UIToolbar+Builder.h"
#import "NSString+MD5.h"

@interface DZPhoneNumChangeController (){
    UIScrollView *_scrollView;
    UITextField *_passwordField;
    UITextField *_phoneField;
    UITextField *_codeField;
    UIButton *_getOldBtn;
    
    UITextField *_newPhoneField;
    UITextField *_newCodeField;
    UIButton *_getNewBtn;
    
}
@property (nonatomic,assign)BOOL isWaiting;
@property (nonatomic, assign)BOOL isNewWaiting;
@end

@implementation DZPhoneNumChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"修改注册手机号"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configScroll];
    [self configStep];
    [self configField];
    [self configNextStep];
    [self configNewPhoneField];
    [self configNextStep2];
}
- (void)configScroll{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, SCREEN_HEIGHT - DZ_TOP);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = UIBackgroundColor;
    _scrollView.scrollEnabled = NO;
    [self.view addSubview:_scrollView];
}
- (void)configStep{
    DZPhoneChangeView *phone1 = [[DZPhoneChangeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 37)];
    [_scrollView addSubview:phone1];
    
    DZPhoneChangeView2 *phone2 = [[DZPhoneChangeView2 alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 37)];
    [_scrollView addSubview:phone2];
}
/**
 *  验证原号码三个输入框
 **/
- (void)configField{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 44, SCREEN_WIDTH - 14, 162)];
    backView.backgroundColor = UIWhiteColor;
    [_scrollView addSubview:backView];
    
    _passwordField = [self textField:@"请输入登录密码"];
    _passwordField.top = 0;
    [backView addSubview:_passwordField];
    
    _phoneField = [self textField:@"请输入手机号"];
    _phoneField.top = 54;
    _phoneField.text = [DZUserManager manager].user.mobile;
    _phoneField.textColor = UI333333Color;
    _phoneField.enabled = NO;
    [backView addSubview:_phoneField];
    
    _getOldBtn = [self makeGetBtn];
    _getOldBtn.centerY = 81;
    [backView addSubview:_getOldBtn];
    [_getOldBtn bk_addEventHandler:^(id sender) {
        if ([_passwordField.text isBlankString]) {
            [HudUtils showMessage:@"请输入您的密码"];return;
        }
//        if (![_phoneField.text isPhoneNumber]){
//            [HudUtils showMessage:@"请输入正确的手机号"];return;
//        }
        [self wait:0];
        [self requestCode];
    } forControlEvents:UIControlEventTouchUpInside];
    
    _codeField = [self textField:@"请输入验证码"];
    _codeField.top = 108;
    _codeField.keyboardType = UIKeyboardTypeNumberPad;
    [_codeField setInputAccessoryView:[UIToolbar inputAccessoryView]];
    [backView addSubview:_codeField];
}
/**
 *  下一步按钮
 **/
- (void)configNextStep{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(7, 218, SCREEN_WIDTH - 14, 43);
    [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn bk_addEventHandler:^(id sender) {
        if ([_passwordField.text isBlankString]) {
            [HudUtils showMessage:@"请输入登录密码"]; return;
        }
        if (!(_codeField.text.length == 6) || ![_codeField.text isNumber]) {
            [HudUtils showMessage:@"请输入正确的验证码"]; return;
        }
        [self requestFirstData];
    } forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:btn];
    
    DZPhoneChangeTipsView *tipsV = [[DZPhoneChangeTipsView alloc]initWithFrame:CGRectMake(0, btn.bottom + 35, SCREEN_WIDTH, 40)];
    [_scrollView addSubview:tipsV];
}
/**
 * 绑定新手机 相关操作
 **/
- (void)configNewPhoneField{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH + 7, 44, SCREEN_WIDTH - 14, 108)];
    backView.backgroundColor = UIWhiteColor;
    [_scrollView addSubview:backView];
    
    _newPhoneField = [self textField:@"请输入手机号"];
    _newPhoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_newPhoneField setInputAccessoryView:[UIToolbar inputAccessoryView]];
    [backView addSubview:_newPhoneField];
    
    _getNewBtn = [self makeGetBtn];
    _getNewBtn.centerY = _newPhoneField.centerY;
    [backView addSubview:_getNewBtn];
    [_getNewBtn bk_addEventHandler:^(id sender) {
        if (![_newPhoneField.text isPhoneNumber]) {
            [HudUtils showMessage:@"请输入正确的手机号"];return;
        }
        [self requestCode2];
        [self waitNew:0];
    } forControlEvents:UIControlEventTouchUpInside];
    
    _newCodeField = [self textField:@"请输入验证码"];
    _newCodeField.top = 54;
    _newCodeField.keyboardType = UIKeyboardTypeNumberPad;
    [_newCodeField setInputAccessoryView:[UIToolbar inputAccessoryView]];
    [backView addSubview:_newCodeField];
}
- (void)configNextStep2{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(SCREEN_WIDTH + 7, 164, SCREEN_WIDTH - 14, 43);
    [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn bk_addEventHandler:^(id sender) {
        if (![_newPhoneField.text isPhoneNumber]) {
            [HudUtils showMessage:@"请先输入您的手机号"];return ;
        }
        if (!(_codeField.text.length == 6) || ![_newCodeField.text isNumber]) {
            [HudUtils showMessage:@"请输入正确的验证码"];return;
        }
        [self requestSecondData];
    } forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:btn];
    
    DZPhoneChangeTipsView *tipsV = [[DZPhoneChangeTipsView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, btn.bottom + 35, SCREEN_WIDTH, 40)];
    [_scrollView addSubview:tipsV];
}
- (void)testField{
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
}

#pragma 定制textfield
- (UITextField *)textField:(NSString *)placeHodler {
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeHodler;
    textField.height = 54;
    textField.width = SCREEN_WIDTH - 140;
    textField.left = 12;
    textField.font = [UIFont systemFontOfSize:15];
    textField.returnKeyType = UIReturnKeyDone;
    [textField setBk_shouldReturnBlock:^BOOL(UITextField *textField) {
        return [MAIN_WINDOW endEditing:YES];
    }];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 54 - ONE_PIXEL, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [textField addSubview:lineView];
    return textField;
}
#pragma 获取验证码按钮
- (UIButton *)makeGetBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setHeight:27];
    [btn setWidth:78];
    btn.right = SCREEN_WIDTH - 25;
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    [btn setBackgroundColor:UICommonColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 3;
    return btn;
}
// 第一个页面倒计时
- (void)wait:(NSNumber *)time{
    NSInteger seconds = [time integerValue];
    NSInteger timeIntervalLeft = 60 - seconds;
    if (timeIntervalLeft <= 0) {
        _getOldBtn.enabled = YES;
        [_getOldBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        _isWaiting = NO;
    }else{
        [_getOldBtn setTitle:[NSString stringWithFormat:@"%@s",@(timeIntervalLeft)] forState:UIControlStateNormal];
        _getOldBtn.enabled = NO;
        [self performSelector:@selector(wait:) withObject:@(++seconds) afterDelay:1.0];
        _isWaiting = YES;
    }
}
// 第二个页面倒计时
- (void)waitNew:(NSNumber *)time{
    NSInteger second = [time integerValue];
    NSInteger timeIntervalLeft1 = 60 - second;
    if (timeIntervalLeft1 <= 0) {
        _getNewBtn.enabled = YES;
        [_getNewBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        _isNewWaiting = NO;
    }else{
        [_getNewBtn setTitle:[NSString stringWithFormat:@"%@s",@(timeIntervalLeft1)] forState:UIControlStateNormal];
        _getNewBtn.enabled = NO;
        [self performSelector:@selector(waitNew:) withObject:@(++second) afterDelay:1.0];
        _isNewWaiting = YES;
    }
}

// 获取验证码
- (void)requestCode{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_phoneField.text forKey:@"mobile"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory mobileGetCode]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)requestFirstData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [self testField];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_phoneField.text forKey:@"mobile"];
    [params putString:_codeField.text forKey:@"mobileCode"];
    [params putString:[_passwordField.text MD5Hash] forKey:@"password"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory mobileUpdateFirst]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)requestCode2{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_newPhoneField.text forKey:@"mobile"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory mobileGetCode]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)requestSecondData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [HudUtils showMessage:@"修改手机号成功！"];
        [self back];
        
        // 更新本地存储信息
        NSMutableDictionary *dic = [DZUserManager manager].user.jsonObject;
        dic[@"user"][@"mobile"] = _newPhoneField.text;
        [[DZUserManager manager]login:dic];
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_newPhoneField.text forKey:@"mobile"];
    [params putString:_newCodeField.text forKey:@"mobileCode"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory phoneChangeSecond]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
