//
//  DZMyInvoiceNormalView.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceNormalView.h"

@implementation DZMyInvoiceNormalView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _backV = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 48 * 3)];
    _backV.backgroundColor = UIWhiteColor;
    [self addSubview:_backV];
    
    UILabel *companyLabel = [self label:@"公司全称" top:0];
    _companyField = [self textField:companyLabel.top];
    [_backV addSubview:_companyField];
    
    
    UILabel *codeLabel = [self label:@"社会统一信用代码" top:48];
    _codeField = [self textField:codeLabel.top];
    [_backV addSubview:_codeField];

    
    int n = 1;
    while (n < 3) {
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
- (void)setUnabled{
    _companyField.enabled = NO;
    _codeField.enabled = NO;
}
- (void)setPlaceholderNil{
    _companyField.placeholder =  _codeField.placeholder = nil;
}
- (void)setContent:(NSDictionary *)dic{
    _companyField.text = [self isNull:dic[@"compName"]];
    _codeField.text = [self isNull:dic[@"socioUniCreditCode"]];
}
- (NSString *)isNull:(NSString *)str{
    if ([str isEqual:[NSNull null]]) {
        return @"";
    }
    return str;
}
@end
