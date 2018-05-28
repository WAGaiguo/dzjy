//
//  DZCategoryCollectionViewCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryCollectionViewCell.h"
#import "UIImage+resize.h"

@implementation DZCategoryCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_titleBtn setBackgroundImage:[UIImage resizableImage] forState:UIControlStateNormal];
        _titleBtn.frame = CGRectMake(0, 0, 64, 32);
        [_titleBtn setTitle:@"娃娃鱼" forState:UIControlStateNormal];
        [_titleBtn setTitleColor:RGBCOLOR(51, 51, 51) forState:UIControlStateNormal];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _titleBtn.userInteractionEnabled = NO;
        [self addSubview:_titleBtn];
    }
    return self;
}
-(void)setContent:(NSDictionary *)dic{
    [_titleBtn setTitle:[dic[@"name"] description] forState:UIControlStateNormal];
    _cid = [dic[@"id"] description];
    
    CGFloat len = [dic[@"name"] description].length;
    _titleBtn.width = len * 13 + 30;
}
@end

@implementation DZCategoryCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 200, 42)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = RGBCOLOR(250, 114, 7);
        _titleLabel.text = @"水生菜类";
        [self addSubview:_titleLabel];
        [self bk_whenTapped:^{
            if (_tapHeaderBlock) {
                _tapHeaderBlock(_cid);
            }
        }];
    }
    return self;
}
- (void)setContent:(NSDictionary *)dic{
    _titleLabel.text = [dic[@"name"] description];
    _cid = [dic[@"pid"] description];
}
@end
