//
//  DZCommonTipsView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/30.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCommonTipsView.h"

@implementation DZCommonTipsView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.frame = SCREEN_BOUNDS;
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
    _tipBackView.userInteractionEnabled = YES;
    [self addSubview:_tipBackView];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(25, 130, 240, 240)];
    _textView.font = [UIFont systemFontOfSize:12];
    _textView.textColor = RGBCOLOR(102, 102, 102);
    [_tipBackView addSubview:_textView];
    _textView.centerX = _tipBackView.width/2.0;
    
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
- (void)myContractText{
    _textView.text = @"1.  当前手机端支持您的合同信息查看。\n     合同状态说明：\n     •待交收：合同生成，交收单数量为零；\n     •交收中：合同生成且有交收单，但是已经完成的交收数量小于合同总量；\n     •待评价：合同生成，已经完成的交收数量等于合同总量，合同双方或任意一方还没有进行评价；\n     •解除：在没有交收单的情况下，由一方提出取消合同，另一方同意后；\n     •终止：在有交收单的情况下，由一方提出取消合同，另一方同意后；\n     •强制解除：在没有交收单的情况下，由平台后台取消合同；\n     •强制终止：在有交收单的情况下，由平台后台取消合同；\n     •已完成：已经完成的交收数量等于合同总量，且双方已评价。\n2.  您可以登录到电脑Web端进行：\n     •发起交收\n     •申请结束合同/取消结束申请/处理对方结束请求\n     •评价\n     •合同详情查看";
}

- (void)myLadingText{
    _textView.text = @"1.  提单说明：\n     •当买方发起交收，卖方确认发货后，系统会自动生成提单。提单可以打印，用来作为买卖双方现场交收时的依据。\n     •当联系人或车辆信息发生变更时，若是买方自提，买方可以修改提单重新打印；若卖方送货，卖方可以修改提单重新打印。\n     •当前手机端支持您的提单信息查看。\n     提单状态说明：\n     •待打印：买方/卖方均没有打印；\n     •已打印：买方/卖方有打印；\n     •已完成：交收单验货通过之后提单状态自动置为“已完成”；\n     •取消：对应的提单撤销/强制撤销。\n2.  您可以登录到电脑Web端进行：\n     •买家自提情况下，修改您的提单信息：提货人、提货人电话、提货车牌号、司机姓名、司机身份证、司机电话\n     •打印提货单\n     •查看所有提货单详情";
}
- (void)myDeliveryText{
    _textView.text = @"1.  当前手机端支持您的交收信息查看。\n     交收单状态说明：\n     •待发货：买方发起交收后，卖方还没有发货；\n     •待验货：卖方发货后，买方验货前；\n     •待验票：验货通过后，买方验票前；\n     •验货异议中：买方验货时提出异议，异议没有最终结果前；（最终结果包含四种状态，具体参看验货异议-验货异议列表）\n     •验票异议中：买方验票时提出异议，异议没有最终结果前；（最终结果包含四种状态，具体参看验票异议-验票异议列表）\n     •解除：买方在验货/验票时提出异议，并希望解除交收单，卖方同意后；\n     •强制解除：平台后台解除交收单；\n     •完成：在合同约定有发票的情况下，正常通过验票；在合同约定没有发票的情况下，正常通过验货。\n2.  您可以登录到电脑Web端进行：\n     •确认验货（有验货付款要求时进行支付）\n     •验货异常提出异议（未到货或货有问题时）\n     •确认验票（有验票付款要求时进行支付）\n     •验票异常提出异议（有发票，且未到票或票有问题时）\n     •验货异议处理（取消异议、查看处理结果）\n     •验票异议处理（取消异议、查看处理结果）\n     •提单管理（提货联系人或车辆信息修改、提货单打印）";
}
- (void)myDeliveryAbnormalText{
    _textView.text = @"1.  当前手机端支持您所提出验货异议或验票异议后，卖家或平台处理结果的提示和查看\n     异议状态说明：\n     •卖方拒绝：买方提出后，卖方进行了拒绝处理；\n     •强制取消：后台管理员取消；\n     •完成：卖方同意/后台管理员操作同意。\n2.  您可以登录到电脑Web端进行：\n     •取消异议（卖方处理前）\n     •查看所有验收异议信息，状态包括：待卖方确认、买方取消、买方拒绝、强制取消、完成";
}
@end

@implementation DZCommonTipsShortView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = SCREEN_BOUNDS;
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
    _tipBackView.userInteractionEnabled = YES;
    [self addSubview:_tipBackView];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(25, 138, 240, 140)];
    _textView.font = [UIFont systemFontOfSize:12];
    _textView.textColor = RGBCOLOR(102, 102, 102);
    [_tipBackView addSubview:_textView];
    _textView.centerX = _tipBackView.width/2.0;
    
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

- (void)myContractAbnormalText{
    self.textView.text = @"1.  当前手机端支持对方结束合同申请的提示和查看\n2.  您可以登录到电脑Web端进行：\n     •处理对方结束请求：同意或拒绝\n     •申请结束合同/取消结束申请\n     •合同结束申请详情查看";
}
@end

