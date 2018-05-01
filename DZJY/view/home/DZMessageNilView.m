//
//  DZMessageNilView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageNilView.h"

@implementation DZMessageNilView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, DZ_TOP + 44, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44);
        [self afterView];
    }
    return self;
}

- (void)afterView{
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"暂无消息"]];
    [self addSubview:imageV];
    imageV.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/3);
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.bottom + 20, SCREEN_WIDTH, 20)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = [UIColor colorWithHex:@"555555"];
    _titleLabel.text = @"暂无消息";
    [self addSubview:_titleLabel];
}

@end
