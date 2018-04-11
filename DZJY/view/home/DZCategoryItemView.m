//
//  DZCategoryItemView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryItemView.h"
#define itemWidth SCREEN_WIDTH / 5.0

@interface DZCategoryItemView(){
    DZCategoryItemSelectView *_varietyView;
    DZCategoryItemSelectView *_specificationView;
    DZCategoryItemSelectView *_areaView;
}
@end

@implementation DZCategoryItemView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self afterView];
        self.backgroundColor = UICyanColor;
    }
    return self;
}
- (void)afterView{
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/5, 43)];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = RGBCOLOR(153, 153, 153);
    _titleLabel.text = @"白菜";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    {
        _varietyView = [[DZCategoryItemSelectView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5.0, 0, SCREEN_WIDTH/5.0 + 10, 43)];
        _varietyView.titleLabel.text = @"品种";
        [self addSubview:_varietyView];
    }
    {
        _specificationView = [[DZCategoryItemSelectView alloc]initWithFrame:CGRectMake(itemWidth * 2 + 10, 0, itemWidth + 10, 43)];
        _specificationView.titleLabel.text = @"规格";
        [self addSubview:_specificationView];
    }
    {
        _areaView = [[DZCategoryItemSelectView alloc]initWithFrame:CGRectMake(itemWidth * 3 + 20, 0, itemWidth + 10, 43)];
        _areaView.titleLabel.text = @"全国";
        [self addSubview:_areaView];
    }
    UIImageView *sortImageV = [[UIImageView alloc]initWithFrame:CGRectMake(itemWidth * 4 + 30, 0, itemWidth - 30, 43)];
    sortImageV.contentMode = UIViewContentModeCenter;
    sortImageV.image = [UIImage imageNamed:@"排序"];
    sortImageV.tag = 10;
    [self addSubview:sortImageV];
    [sortImageV setUserInteractionEnabled:YES];
    
    [_varietyView bk_whenTapped:^{
        [self setSelectItem:0];
    }];
    [_specificationView bk_whenTapped:^{
        [self setSelectItem:1];
    }];
    [_areaView bk_whenTapped:^{
        [self setSelectItem:2];
    }];
    [sortImageV bk_whenTapped:^{
        [self setSelectItem:3];
    }];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43 - ONE_PIXEL, SCREEN_WIDTH, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [self addSubview:lineView];
}

- (void)setSelectItem:(NSInteger)interger{
    if (_selectIndex) {
        _selectIndex(interger);
    }
    switch (interger) {
        case 0:
            [_varietyView setIsSelected:YES];
            [_specificationView setIsSelected:NO];
            [_areaView setIsSelected:NO];
            break;
        case 1:
            [_varietyView setIsSelected:NO];
            [_specificationView setIsSelected:YES];
            [_areaView setIsSelected:NO];
            break;
        case 2:
            [_varietyView setIsSelected:NO];
            [_specificationView setIsSelected:NO];
            [_areaView setIsSelected:YES];
            break;
        case 3:
            [_varietyView setIsSelected:NO];
            [_specificationView setIsSelected:NO];
            [_areaView setIsSelected:NO];
            break;
            
        default:
            break;
    }
}

- (void)sortIsSelected: (BOOL)selected{
    UIImageView *sortImage = [self viewWithTag:10];
    if (selected) {
        sortImage.image = [UIImage imageNamed:@""];
    }
}
@end

@implementation DZCategoryItemSelectView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, itemWidth/2.0 + 10, 43)];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = UITitleColor;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentRight;
        
        _imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下拉框"]];
        _imageV.centerY = 22;
        _imageV.left = _titleLabel.right + 2;
        [self addSubview:_imageV];
    }
    return self;
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        _titleLabel.textColor = UICommonColor;
        _imageV.image = [UIImage imageNamed:@"下拉框选中"];
    }else{
        _titleLabel.textColor = UITitleColor;
        _imageV.image = [UIImage imageNamed:@"下拉框"];
    }
}

@end



