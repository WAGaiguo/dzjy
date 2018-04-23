//
//  DZTitleView.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTitleView.h"

#define ITEMWIDTH 44

@interface DZTitleView(){
    UILabel *_textLabel;
    UIImageView *_backImageV;
}
@end

@implementation DZTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backImageV = [[UIImageView alloc]initWithFrame:frame];
//        _backImageV.image = [UIImage imageNamed:@"导航条"];        
        _backImageV.tag = 999;
        [self addSubview:_backImageV];
        
        _leftView = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftView setFrame:CGRectMake(0, 20, ITEMWIDTH, ITEMWIDTH)];
        [self addSubview:_leftView];
        
        _rightView = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightView setFrame:CGRectMake(SCREEN_WIDTH - ITEMWIDTH, 20, ITEMWIDTH, ITEMWIDTH)];
        [_rightView setImage:[UIImage imageNamed:@"icon-delete"] forState:UIControlStateNormal];
        _rightView.hidden = YES;
        [self addSubview:_rightView];
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(_leftView.right, 20, SCREEN_WIDTH - _leftView.width - _rightView.width, ITEMWIDTH)];
        _textLabel.font = [UIFont boldSystemFontOfSize:18];
        [_textLabel setTextColor:[UIColor darkGrayColor]];
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_textLabel];
        
//        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ONE_PIXEL)];
//        [lineView setBottom:64];
//        [lineView setBackgroundColor:[UIColor seperatorColor]];
//        [self addSubview:lineView];
        
        if (IS_IPHONE_X) {
            _leftView.top = _rightView.top = _textLabel.top = 44;
//            [lineView setBottom:88];
        }
        
        
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [_textLabel setText:title];
}

- (void)setBackEnabled:(BOOL)backEnabled{
    if(backEnabled){
        [_leftView setImage:[UIImage imageNamed:@"go_back"] forState:UIControlStateNormal];
    }else{
        [_leftView setImage:nil forState:UIControlStateNormal];
    }
}

- (void)setHasBackGroud:(BOOL)hasBackGroud{
    if(hasBackGroud){
        _backImageV.image = [UIImage imageNamed:@"导航条"];
    }else{
        _backImageV.image = nil;
    }
}

@end
