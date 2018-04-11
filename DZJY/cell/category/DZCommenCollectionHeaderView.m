//
//  DZCommenCollectionHeaderView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCommenCollectionHeaderView.h"

@implementation DZCommenCollectionHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 200, 42)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = RGBCOLOR(250, 114, 7);
        _titleLabel.text = @"单颗重类";
        [self addSubview:_titleLabel];
    }
    return self;
}
@end
