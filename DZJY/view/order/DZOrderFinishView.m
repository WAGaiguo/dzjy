//
//  DZOrderFinishView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/16.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderFinishView.h"

@implementation DZOrderFinishView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = UIWhiteColor;
        [self afterView];
    }
    return self;
}
-(void)afterView{
    _imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"orderFinish"]];
    [self addSubview:_imageV];
    [_imageV setCenterX:SCREEN_WIDTH/2.0];
    [_imageV setTop:25];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, _imageV.bottom + 20, SCREEN_WIDTH, 16)];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor colorWithHex:@"555555"];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"订单提交成功";
    [self addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, label1.bottom + 10, SCREEN_WIDTH, 16)];
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor colorWithHex:@"555555"];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"请在00小时00分钟00秒内完成支付";
    label2.tag = 222;
    [self addSubview:label2];
    
    UILabel *label3 =[[UILabel alloc]initWithFrame:CGRectMake(0, label2.bottom + 10, SCREEN_WIDTH/2.0 - 8, 16)];
    label3.font = [UIFont systemFontOfSize:15];
    label3.textColor = [UIColor colorWithHex:@"555555"];
    label3.textAlignment = NSTextAlignmentRight;
    label3.text = @"支付金额";
    [self addSubview:label3];
    
    _moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0, label2.bottom + 10, SCREEN_WIDTH/2.0 - 8, 16)];
    _moneyLabel.font = [UIFont systemFontOfSize:15];
    _moneyLabel.textColor = [UIColor colorWithHex:@"fe5200"];
//    _moneyLabel.text = @"￥900.0";
    [self addSubview:_moneyLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, label3.bottom + 25, SCREEN_WIDTH, 7)];
    lineView.backgroundColor = UIBackgroundColor;
    [self addSubview:lineView];
    
    UIImageView *alerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"提示喇叭"]];
    alerView.left = 35;
    alerView.top = lineView.bottom + 15;
    [self addSubview:alerView];
    
    UILabel *alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(alerView.right + 12, alerView.top, SCREEN_WIDTH - 110, 30)];
    alertLabel.font = [UIFont systemFontOfSize:12];
    alertLabel.textColor = [UIColor colorWithHex:@"fe5200"];
    alertLabel.numberOfLines = 2;
    alertLabel.text = @"线下交易私自打款有风险，推荐使用平台在线交易，防止卖家收款不发货等不诚信行为。";
    [self addSubview:alertLabel];
    
}
- (void)setContent:(NSDictionary *)dic{
    _moneyLabel.text = [NSString stringWithFormat:@"￥%@", [dic[@"buyerSerChargeAndBuyerBailTotal"] description]];
    NSDictionary *dicDate = [dic objectForKey:@"payDeadLine"];
    UILabel *label = [self viewWithTag:222];
    if (dicDate) {
//        label.text = [NSString stringWithFormat:@"请在%@小时%@分钟%@秒内完成支付", [dicDate[@"hour"] isEqual:[NSNull null]] ? @"00": dicDate[@"hour"], [dicDate[@"minute"] isEqual:[NSNull null]] ? @"00":dicDate[@"minute"], [dicDate[@"second"] isEqual:[NSNull null]] ? @"00":dicDate[@"second"]];
        label.text = [NSString stringWithFormat:@"请最晚%@-%@-%@完成支付", [dicDate[@"year"] description], [dicDate[@"monthValue"] description], [dicDate[@"dayOfMonth"] description]];
    }
}

@end
