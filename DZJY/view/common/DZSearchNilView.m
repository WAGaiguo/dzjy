//
//  DZSearchNilView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSearchNilView.h"

@implementation DZSearchNilView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"未搜索到"]];
    imageV.centerX = SCREEN_WIDTH/2.0;
    imageV.centerY = SCREEN_HEIGHT/4;
    [self addSubview:imageV];
    
    UILabel *topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.bottom + 40, SCREEN_WIDTH, 15)];
    topLabel.font = [UIFont systemFontOfSize:13];
    topLabel.textColor = RGBCOLOR(85, 85, 85);
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.text = @"抱歉，未能找到您搜索的商品";
    [self addSubview:topLabel];
    
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, topLabel.bottom + 9, SCREEN_WIDTH, 15)];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.textColor = RGBCOLOR(153, 153, 153);
    bottomLabel.font = [UIFont systemFontOfSize:12];
    bottomLabel.text = @"换一个商品关键词试试吧";
    [self addSubview:bottomLabel];
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
