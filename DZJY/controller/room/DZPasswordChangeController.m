//
//  DZPasswordChangeController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZPasswordChangeController.h"

@interface DZPasswordChangeController (){
    UITextField *_usernameField;
    UITextField *_oldField;
    UITextField *_newField;
    UITextField *_confirmField;
    UIView *backgroundView;
}
@end

@implementation DZPasswordChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"修改密码"];
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self configField];
    [self configFooterView];
}

- (void)configField{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 223)];
    backgroundView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 216)];
    backgroundView.backgroundColor = [UIColor whiteColor];
     [backView addSubview:backgroundView];
    self.tableView.tableHeaderView = backView;
   
    
    UIView *firstView = [self commonFieldView:@"用户名" rightImage:nil text:@"用户名："];
    firstView.top = 0;
    [backgroundView addSubview:firstView];
    _usernameField = [self textField:@""];
    [_usernameField setEnabled:NO];
    [firstView addSubview:_usernameField];
    
    UIView *secondView = [self commonFieldView:@"旧密码" rightImage:@"隐藏" text:@"旧密码："];
    secondView.top = 54;
    [backgroundView addSubview:secondView];
    _oldField = [self textField:@"请输入旧密码"];
    [_oldField setSecureTextEntry:YES];
    [secondView addSubview:_oldField];
    
    UIView *thirdView = [self commonFieldView:@"新密码" rightImage:@"显示" text:@"新密码："];
    thirdView.top = 108;
    [backgroundView addSubview:thirdView];
    _newField = [self textField:@"请输入新密码"];
    [thirdView addSubview:_newField];
    
    UIView *confirmView = [self commonFieldView:@"确认密码" rightImage:@"显示" text:@"确认密码:"];
    confirmView.top = 162;
    [backgroundView addSubview:confirmView];
    _confirmField = [self textField:@"再次输入"];
    [confirmView addSubview:_confirmField];
    
}

- (UITextField *)textField:(NSString *)placeHodler {
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeHodler;
    textField.height = 53;
    textField.width = SCREEN_WIDTH - 140;
    textField.top = 0;
    textField.left = 100;
    textField.font = [UIFont systemFontOfSize:15];
    textField.returnKeyType = UIReturnKeyDone;
    [textField setBk_shouldReturnBlock:^BOOL(UITextField *textField) {
        return [MAIN_WINDOW endEditing:YES];
    }];
    return textField;
}

- (UIView *)commonFieldView:(NSString *)imgStr rightImage:(NSString *)image text:(NSString *)text{
    UIView *view = [[UIView alloc]init];
    view.width = SCREEN_WIDTH - 14;
    view.height = 54;
    view.centerX = SCREEN_WIDTH/2.0 - 7;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 54 - ONE_PIXEL, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [view addSubview:lineView];
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgStr]];
    imageV.centerY = 27;
    imageV.left = 10;
    [view addSubview:imageV];
    UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
    rightImage.centerY = 27;
    rightImage.right = SCREEN_WIDTH - 24;
    [view addSubview:rightImage];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(imageV.right + 6, 0, 75, 53)];
    label.textColor = UI999999Color;
    label.font = [UIFont systemFontOfSize:15];
    label.text = text;
    [view addSubview:label];
    return view;
}
- (void)configFooterView{
    UIView *backView = [[UIView alloc]init];
    backView.width = SCREEN_WIDTH;
    backView.height = 43;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(7, 0, SCREEN_WIDTH - 14, 43);
    [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn bk_addEventHandler:^(id sender) {
        [self testField];
    } forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:btn];
    self.tableView.sectionFooterHeight = 7;
    self.tableView.tableFooterView = backView;
}
- (void)testField{
    NSString *oldStr = _oldField.text;
    NSString *newStr = _newField.text;
    NSString *confirmStr = _confirmField.text;
    if (oldStr==nil || oldStr.length == 0) {
        [HudUtils showMessage:@"请输入您的旧密码"];return;
    }
    if (newStr == nil || newStr.length ==0) {
        [HudUtils showMessage:@"请输入您的新密码"];return;
    }
    if (confirmStr == nil || confirmStr.length ==0) {
        [HudUtils showMessage:@"请输入您的确认密码"];return;
    }
    if (![newStr isEqualToString:confirmStr]) {
        [HudUtils showMessage:@"两次密码输入不一致"];return;
    }
    [self requestData:confirmStr];
}
/**
  * 数据请求
 **/
- (void)requestData:(NSString *)str{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
