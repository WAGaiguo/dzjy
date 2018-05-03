//
//  DZMyInvoiceSetDefaultView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceSetDefaultView.h"

@interface DZMyInvoiceSetDefaultView(){
    UISwitch *switchV;
}
@end

@implementation DZMyInvoiceSetDefaultView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 135, 48)];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = UI666666Color;
        label.text = @"设为默认";
        label.left = 11;
        [self addSubview:label];
        
        _isOn = NO;
        
        switchV = [[UISwitch alloc]init];
        switchV.right = SCREEN_WIDTH - 14 - 15;
        switchV.centerY = 24;
        switchV.on = _isOn;
        switchV.tintColor = UICommonColor;
        switchV.onTintColor = UICommonColor;
        [self addSubview:switchV];
        [switchV bk_addEventHandler:^(id sender) {
            [self setIsOn:!_isOn];
            if (_onBlock) {
                _onBlock(_isOn);
            }
        } forControlEvents:UIControlEventValueChanged];
        [self addSubview:switchV];
    }
    return self;
}
- (void)setIsOn:(BOOL)isOn{
    _isOn = isOn;
    switchV.on = isOn;
}
@end
