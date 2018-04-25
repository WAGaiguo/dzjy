//
//  DZMyOrderTipsView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyOrderTipsView.h"

@implementation DZMyOrderTipsView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self configBackView];
        [self configTips];
        self.alpha = 0;
        
    }
    return self;
}
- (void)configBackView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self addSubview:backView];
    backView.backgroundColor = UIBlackColor;
    backView.alpha = 0.5;
    [backView bk_whenTapped:^{
        [self removeFromFatherView];
    }];
}
- (void)configTips{
    _tipBackView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"文字多的弹出框"]];
    _tipBackView.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0);
    [self addSubview:_tipBackView];
    
    _label1 = [[UILabel alloc]initWithFrame:CGRectMake(25, 135, 240, 0)];
    _label1.font = [UIFont systemFontOfSize:12];
    _label1.textColor = RGBCOLOR(102, 102, 102);
    _label1.numberOfLines = 0;
    [_tipBackView addSubview:_label1];
    
    _label1.text = @"1.当前手机端支持您的订单信息查看。\n订单状态：\n*待双方支付保证金：订单已生成，\n买卖双方均没有支付保证金及交易手续费；\n*待买方支付保证金；订单已生成，\n仅卖方支付了保证金及交易手续费；\n*待卖方支付保证金：订单已生成，\n仅卖方支付了保证金及交易手续费；\n*已生成合同：双方均已支付保证金及交易手续费；\n*取消：在生成合同前有一方取消订单，或者在付款截止日之前一方/双方没有完成支付保证金；\n*撤销：后台强制取消订单。\n\n2.您可以登录到web端进行";
    [_label1 sizeToFit];
    _label1.centerX = _tipBackView.width/2.0;
    
    UIView *knowLabel = [[UIView alloc]init];
    knowLabel.width = 90;
    knowLabel.height = 28;
    knowLabel.centerX = _tipBackView.width/2.0;
    knowLabel.bottom = _tipBackView.height - 18;
    knowLabel.layer.cornerRadius = 14;
    knowLabel.layer.masksToBounds = YES;
    [_tipBackView addSubview:knowLabel];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)RGBCOLOR(230, 136, 84).CGColor, (__bridge id)RGBCOLOR(233, 66, 21).CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, 90, 28);
    [knowLabel.layer addSublayer:gradientLayer];
    [knowLabel bk_whenTapped:^{
        [self removeFromFatherView];
    }];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 28)];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textColor = UIWhiteColor;
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"知道了";
    [knowLabel addSubview:textLabel];
}
- (void)removeFromFatherView{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)startAnimation{
    self.alpha = 0;
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 1;
    } completion:nil];
}
@end
