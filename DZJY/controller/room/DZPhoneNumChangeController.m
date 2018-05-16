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
//    self.automaticallyAdjustsScrollViewInsets = NO;
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
    [backView addSubview:_phoneField];
    
    _getOldBtn = [self makeGetBtn];
    _getOldBtn.centerY = 81;
    [backView addSubview:_getOldBtn];
    [_getOldBtn bk_addEventHandler:^(id sender) {
        [self wait:0];
    } forControlEvents:UIControlEventTouchUpInside];
    
    _codeField = [self textField:@"请输入验证码"];
    _codeField.top = 108;
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
        [HudUtils showMessage:@"下一步"];
        [self testField];
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
    [backView addSubview:_newPhoneField];
    
    _getNewBtn = [self makeGetBtn];
    _getNewBtn.centerY = _newPhoneField.centerY;
    [backView addSubview:_getNewBtn];
    [_getNewBtn bk_addEventHandler:^(id sender) {
        [self waitNew:@(0)];
    } forControlEvents:UIControlEventTouchUpInside];
    
    _newCodeField = [self textField:@"请输入验证码"];
    _newCodeField.top = 54;
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
        [HudUtils showMessage:@"下一步"];
        [self testField];
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
    NSInteger seconds = [time integerValue];
    NSInteger timeIntervalLeft = 60 - seconds;
    if (timeIntervalLeft <= 0) {
        _getNewBtn.enabled = YES;
        [_getNewBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        _isNewWaiting = NO;
    }else{
        [_getNewBtn setTitle:[NSString stringWithFormat:@"%@s",@(timeIntervalLeft)] forState:UIControlStateNormal];
        _getNewBtn.enabled = NO;
        [self performSelector:@selector(waitNew:) withObject:@(++seconds) afterDelay:1.0];
        _isNewWaiting = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
