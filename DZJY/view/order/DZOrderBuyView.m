//
//  DZOrderBuyView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/16.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderBuyView.h"

@interface DZOrderBuyView()
{
    UIView *_backgroudV;
    UIView *_backContentV;
}
@end

@implementation DZOrderBuyView

-(instancetype)init{
    self = [super init];
    if (self){
        [self setWidth:SCREEN_WIDTH];
        [self setHeight:SCREEN_HEIGHT];
        _backgroudV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backgroudV.backgroundColor = UIBlackColor;
        _backgroudV.alpha = 0.5;
        [self addSubview:_backgroudV];
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _backContentV = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 350, SCREEN_WIDTH, 350)];
    [self addSubview:_backContentV];
}
@end
