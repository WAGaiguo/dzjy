//
//  DZOrderCancelAndPayView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCancelAndPayView.h"

@implementation DZOrderCancelAndPayView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:UI666666Color forState:UIControlStateNormal];
        cancelBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.4, 49);
        [cancelBtn setBackgroundColor:UIWhiteColor];
        [self addSubview:cancelBtn];
        [cancelBtn bk_addEventHandler:^(id sender) {
            if (_cancelBlock) {
                _cancelBlock();
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [payBtn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
        [payBtn setTitle:@"支付" forState:UIControlStateNormal];
        [payBtn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
        payBtn.frame = CGRectMake(SCREEN_WIDTH * 0.4, 0, SCREEN_WIDTH * 0.6, 49);
        [self addSubview:payBtn];
        [payBtn bk_addEventHandler:^(id sender) {
            if (_payBlock) {
                _payBlock();
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
