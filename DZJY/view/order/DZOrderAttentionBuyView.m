//
//  DZOrderAttentionBuyView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/17.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderAttentionBuyView.h"
@interface DZOrderAttentionBuyView(){
    UIButton *_attentionBtn;
    UIButton *_buyBtn;
}
@end
@implementation DZOrderAttentionBuyView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        _attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_attentionBtn setImage:[UIImage imageNamed:@"attention"] forState:UIControlStateNormal];
        [_attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
        _attentionBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.4, 47);
        _attentionBtn.backgroundColor = UIWhiteColor;
        [_attentionBtn setTitleColor:UITitleColor forState:UIControlStateNormal];
        [_attentionBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
        [self addSubview:_attentionBtn];
        [_attentionBtn addTarget:self action:@selector(attention) forControlEvents:UIControlEventTouchUpInside];
        
        _buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyBtn setImage:[UIImage imageNamed:@"购买开通"] forState:UIControlStateNormal];
        [_buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyBtn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
        [self addSubview:_buyBtn];
        [_buyBtn setFrame:CGRectMake(SCREEN_WIDTH * 0.4, 0, SCREEN_WIDTH * 0.6, 47)];
        [_buyBtn setBackgroundColor:UICommonColor];
        [_buyBtn addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
- (void)setIsAttentioned:(BOOL)isAttentioned{
    _isAttentioned = isAttentioned;
    if(_isAttentioned){
        [_attentionBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_attentionBtn setTitle:@"已关注" forState:UIControlStateNormal];
    }else{
        [_attentionBtn setImage:[UIImage imageNamed:@"attention"] forState:UIControlStateNormal];
        [_attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    }
}
- (void)attention{
    if(_attentionBlock){
        _attentionBlock();
    }
}
- (void)buy{
    if(_buyBlock){
        _buyBlock();
    }
}
@end
