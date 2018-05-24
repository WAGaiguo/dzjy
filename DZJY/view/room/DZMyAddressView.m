//
//  DZMyAddressView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressView.h"
#import "UIToolbar+Builder.h"

@implementation DZMyAddressView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _backV = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 288 - 48)];
    _backV.backgroundColor = UIWhiteColor;
    [self addSubview:_backV];
    
    UILabel *personLabel = [self label:@"联系人" top:0];
    _personField = [self textField:personLabel.top];
    [_backV addSubview:_personField];
    
    UILabel *districtLabel = [self label:@"地区" top:48];
    _districtField = [self textField:districtLabel.top];
    [_backV addSubview:_districtField];
    UIView *districtView = [[UIView alloc]initWithFrame:_districtField.frame];
    [_backV addSubview:districtView];
    [districtView bk_whenTapped:^{
        if (_tapDistrictBlock) {
            _tapDistrictBlock();
        }
    }];
    
    UILabel *addressLabel = [self label:@"详细地址" top:48 * 2];
    _addressField = [self textField:addressLabel.top];
    [_backV addSubview:_addressField];
    
    UILabel *phoneLabel = [self label:@"手机号" top:96 + 48];
    _phoneField = [self textField:phoneLabel.top];
    _phoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_phoneField setInputAccessoryView:[UIToolbar inputAccessoryView]];
    [_backV addSubview:_phoneField];
    
//    UILabel *codeLabel = [self label:@"身份证号" top:48 * 4];
//    _codeField = [self textField:codeLabel.top];
//    [_backV addSubview:_codeField];
    
    int n = 1;
    while (n < 5) {
        [self lineView:n * 48];
        n++;
    }
}

- (UILabel *)label:(NSString *)text top:(CGFloat)top{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, top, 135, 48)];
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
@end
