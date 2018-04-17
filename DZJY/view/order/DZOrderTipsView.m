//
//  DZOrderTipsView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/17.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderTipsView.h"

@implementation DZOrderTipsView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        backV.backgroundColor = UIBlackColor;
        backV.alpha = 0.5;
        [self addSubview:backV];
        
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UIView *back = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 267, 340)];
    back.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 - 30);
    [self addSubview:back];
    
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"弹出框"]];
    imageV.left = 0;
    imageV.top = 0;
    [back addSubview:imageV];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 140, 200, 13)];
    label1.font = [UIFont systemFontOfSize:12];
    label1.textColor = RGBCOLOR(254, 82, 0);
    label1.text = @"*   先款";
    [back addSubview:label1];
    
    UILabel *label11 = [[UILabel alloc]initWithFrame:CGRectMake(30, label1.bottom + 4, 210, 28)];
    label11.font = [UIFont systemFontOfSize:11];
    label11.textColor = RGBCOLOR(102, 102, 102);
    label11.numberOfLines = 2;
    label11.text = @"指的是买方发起交收支付货款到平台，确认验货或验票时解冻货款至卖家账户";
    [back addSubview:label11];
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(16, label11.bottom + 10, 200, 13)];
    label2.font = [UIFont systemFontOfSize:12];
    label2.textColor = RGBCOLOR(254, 82, 0);
    label2.text = @"*   先货";
    [back addSubview:label2];
    
    UILabel *label22 = [[UILabel alloc]initWithFrame:CGRectMake(30, label2.bottom + 4, 210, 28)];
    label22.font = [UIFont systemFontOfSize:11];
    label22.textColor = RGBCOLOR(102, 102, 102);
    label22.numberOfLines = 2;
    label22.text = @"指的是买方发起交收时无需先付货款，确认验货或验票时支付货款至卖家账户";
    [back addSubview:label22];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, label22.bottom + 10, 210, 13)];
    label3.font = [UIFont systemFontOfSize:12];
    label3.textColor = RGBCOLOR(254, 82, 0);
    label3.text = @"*   预付";
    [back addSubview:label3];
    
    UILabel *label33 = [[UILabel alloc]initWithFrame:CGRectMake(30, label3.bottom + 4, 220, 12)];
    label33.font = [UIFont systemFontOfSize:11];
    label33.textColor = RGBCOLOR(102, 102, 102);
    label33.text = @"指的是卖方发布挂牌信息时已支付保证金。";
    [back addSubview:label33];
    
    UIImageView *knowImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"知道了"]];
    knowImg.centerX = imageV.centerX;
    knowImg.top = label33.bottom + 15;
    [back addSubview:knowImg];
    knowImg.userInteractionEnabled = YES;
    [knowImg bk_whenTapped:^{
        [UIView animateWithDuration:0.33 animations:^{
            [self setAlpha:0];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

@end
