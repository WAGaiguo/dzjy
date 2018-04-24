//
//  DZMyBoughtTipsView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtTipsView.h"

@implementation DZMyBoughtTipsView

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
    _tipBackView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"文字少的弹出哐"]];
    _tipBackView.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0);
    [self addSubview:_tipBackView];
    
    UILabel *label1 = [self label:@"1. 当前手机端支持您的采购信息查看。" frame:CGRectMake(25, 160, 240, 13)];
    [_tipBackView addSubview:label1];
    UILabel *label2 = [self label:@"2. 您还可以登录到Web端进行：" frame:CGRectMake(label1.left, label1.bottom + 4, label1.width, label1.height)];
    [_tipBackView addSubview:label2];
    UILabel *label3 = [self label:@"· 发布采购需求" frame:CGRectMake(50, label2.bottom + 4, 200, 13)];
    [_tipBackView addSubview:label3];
    UILabel *label4 = [self label:@"· 对已发布的采购需求进行撤销" frame:CGRectMake(label3.left, label3.bottom + 4, 200, 13)];
    [_tipBackView addSubview:label4];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"知道了" forState:UIControlStateNormal];
    [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"登录按钮"] forState:UIControlStateNormal];
    btn.width = 90;
    btn.height = 28;
    btn.centerX = _tipBackView.width/2.0;
    btn.bottom = _tipBackView.height - 18;
//    [_tipBackView addSubview:btn];
    [btn bk_addEventHandler:^(id sender) {
        [self removeFromFatherView];
    } forControlEvents:UIControlEventTouchUpInside];
    
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

- (UILabel *)label:(NSString *)text frame:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = RGBCOLOR(102, 102, 102);
    label.text = text;
    return label;
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
