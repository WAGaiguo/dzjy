//
//  DZMineCollectionReusableView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineCollectionReusableView.h"

@implementation DZMineCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 40)];
        _titleLabel.text = @"小测试";
        [self addSubview:_titleLabel];
        [self bk_whenTapped:^{
            if (_tapBlock) {
                _tapBlock();
            }
        }];
    }
    return self;
}

@end
