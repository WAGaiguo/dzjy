//
//  DZVarietyCollectionViewCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZVarietyCollectionViewCell.h"
#import "UIImage+resize.h"

@implementation DZVarietyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     
        _titleBtn.frame = CGRectMake(0, 5, (SCREEN_WIDTH - 42)/3, 32);
        [_titleBtn setTitle:@"娃娃鱼" forState:UIControlStateNormal];
        [_titleBtn setBackgroundImage:[UIImage resizableImage] forState:UIControlStateNormal];
        [_titleBtn setTitleColor:RGBCOLOR(51, 51, 51) forState:UIControlStateNormal];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _titleBtn.userInteractionEnabled = NO;
        [self addSubview:_titleBtn];
    }
    return self;
}
-(void)setTitle:(NSString *)title{
    [_titleBtn setTitle:title forState:UIControlStateNormal];
}
-(void)setIsSelected:(BOOL)isSelected{
    if (isSelected) {
        [_titleBtn setTitleColor:[UIColor colorWithHex:@"fe5200"] forState:UIControlStateNormal];
    }else {
        [_titleBtn setTitleColor:RGBCOLOR(51, 51, 51) forState:UIControlStateNormal];
    }
}
@end
