//
//  DZMyInvoiceView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceView.h"
#import "UIToolbar+Builder.h"

static const int dz_hight = 48;
@implementation DZMyInvoiceView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _backV = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 336)];
    _backV.backgroundColor = UIWhiteColor;
    [self addSubview:_backV];
    
    UILabel *companyLabel = [self label:@"公司全称" top:0];
    _companyField = [self textField:companyLabel.top];
    [_backV addSubview:_companyField];
    
    UILabel *addressLabel = [self label:@"注册地址" top:48];
    _addressField = [self textField:addressLabel.top];
    [_backV addSubview:_addressField];
    
    UILabel *phoneLabel = [self label:@"注册电话" top:96];
    _phoneField = [self textField:phoneLabel.top];
    _phoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_phoneField setInputAccessoryView:[UIToolbar inputAccessoryView]];
    [_backV addSubview:_phoneField];
    
    UILabel *codeLabel = [self label:@"社会统一信用代码" top:48 * 3];
    _codeField = [self textField:codeLabel.top];
    [_backV addSubview:_codeField];
    
    UILabel *bankLabel = [self label:@"开户银行" top:48 * 4];
    _bankField = [self textField:bankLabel.top];
    [_backV addSubview:_bankField];
    
    UILabel *accountLabel = [self label:@"银行账户" top:48 * 5];
    _accountField = [self textField:accountLabel.top];
    [_backV addSubview:_accountField];
    
    int n = 1;
    while (n<7) {
        [self lineView:n * 48];
        n++;
    }
}
- (UILabel *)label:(NSString *)text top:(CGFloat)top{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, top, 135, dz_hight)];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = UI555555Color;
    label.text = text;
    label.left = 14;
    [_backV addSubview:label];
    return label;
}
- (UITextField *)textField:(CGFloat)top{
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(135, top, SCREEN_WIDTH - 135 - 24, 48)];
    field.textAlignment = NSTextAlignmentRight;
    field.font = [UIFont systemFontOfSize:14];
    field.textColor = UI333333Color;
    field.placeholder = @"请输入";
    field.returnKeyType = UIReturnKeyDone;
    [field setBk_shouldReturnBlock:^BOOL(UITextField *field) {
        return [field resignFirstResponder];
    }];
    return field;
}
- (void)lineView:(CGFloat)top{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, top, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [_backV addSubview:lineView];
}
- (void)setUnabled{
    _companyField.enabled = NO;
    _addressField.enabled = NO;
    _phoneField.enabled = NO;
    _codeField.enabled = NO;
    _bankField.enabled = NO;
    _accountField.enabled = NO;
}
- (void)setPlaceholderNil{
    _companyField.placeholder = _addressField.placeholder = _phoneField.placeholder = _codeField.placeholder = _bankField.placeholder = _accountField.placeholder = nil;
}
- (void)setContent:(NSDictionary *)dic{
    _companyField.text = [self isNull:dic[@"compName"]];
    _addressField.text = [self isNull:dic[@"regAddress"]];
    _phoneField.text = [self isNull:dic[@"regTel"]];
    _codeField.text = [self isNull:dic[@"socioUniCreditCode"]];
    _bankField.text = [self isNull:dic[@"bankName"]];
    _accountField.text = [self isNull:dic[@"bankAccNumb"]];
    
}
- (NSString *)isNull:(NSString *)str{
    if ([str isEqual:[NSNull null]]) {
        return @"";
    }
    return str;
}
@end
