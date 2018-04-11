//
//  DZSpecificationCollectionViewCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSpecificationCollectionViewCell.h"
#import "UIImage+resize.h"

@implementation DZSpecificationCollectionViewCell
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
- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (_isSelected) {
        
    }else{
        
    }
}
@end
