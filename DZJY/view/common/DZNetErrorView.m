//
//  DZNetErrorView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZNetErrorView.h"

@implementation DZNetErrorView

- (void)afterView{
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"定位失败"]];
    imageV.centerX = SCREEN_WIDTH/2.0;
    imageV.centerY = SCREEN_HEIGHT/4;
    [self addSubview:imageV];
    
    UILabel *topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.bottom + 40, SCREEN_WIDTH, 15)];
    topLabel.font = [UIFont systemFontOfSize:13];
    topLabel.textColor = RGBCOLOR(85, 85, 85);
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.text = @"网络连接失败，请亲重试！";
    [self addSubview:topLabel];
    
}
-(instancetype)initWithFrame:(CGRect)frame fatherView:(UIView *)fatherView{
    self = [super initWithFrame:frame];
    if (self) {
        [self afterView];
        [fatherView addSubview:self];
    }
    return self;
}

@end
