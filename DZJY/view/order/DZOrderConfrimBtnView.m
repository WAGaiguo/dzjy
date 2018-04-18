//
//  DZOrderConfrimBtnView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderConfrimBtnView.h"

@implementation DZOrderConfrimBtnView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        UIImageView *backImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48)];
        backImageV.image = [UIImage imageNamed:@"导航条"];
        [self addSubview:backImageV];
        
        UIImageView *leftImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"提交订单"]];
        leftImageV.centerY = 24;
        leftImageV.centerX = SCREEN_WIDTH/2.0 - 35;
        [self addSubview:leftImageV];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(leftImageV.right + 5, 0, SCREEN_WIDTH/2.0, 48)];
        label.textColor = UIWhiteColor;
        label.text = @"提交订单";
        [self addSubview:label];
        
        [self bk_whenTapped:^{
            if (_submitBlock){
                _submitBlock();
            }
        }];
        
    }
    return self;
}

@end
