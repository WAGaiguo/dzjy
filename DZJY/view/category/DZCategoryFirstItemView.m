//
//  DZCategoryFirstItemView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryFirstItemView.h"
#import "DZCategoryItemView.h"

@interface DZCategoryFirstItemView(){
    DZCategoryItemSelectView *_itemView;
    UIImageView *sortImageV;
}
@end

@implementation DZCategoryFirstItemView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIWhiteColor;
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH/3.0, 43)];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = RGBCOLOR(153, 153, 153);
    _titleLabel.text = @"白菜";
    [self addSubview:_titleLabel];
    
    _itemView = [[DZCategoryItemSelectView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3.0, 0, SCREEN_WIDTH/3 + 20, 43)];
    _itemView.titleLabel.text = @"全国";
    _itemView.titleLabel.width = _itemView.width/5 * 3;
    _itemView.imageV.left = _itemView.titleLabel.right + 5;
    [self addSubview:_itemView];
    
    UIView *sortBack = [[UIView alloc]initWithFrame:CGRectMake(_itemView.right + 10, 0, SCREEN_WIDTH - _itemView.right - 10, 43)];
    [self addSubview:sortBack];
    sortImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"排序"]];
    sortImageV.right = sortBack.width - 20;
    sortImageV.centerY = _itemView.centerY;
    sortImageV.contentMode = UIViewContentModeCenter;
    sortImageV.tag = 10;
    [sortBack addSubview:sortImageV];
    [sortImageV setUserInteractionEnabled:YES];
    
    [_itemView bk_whenTapped:^{
        [self setSelectItem:0];
    }];
    [sortBack bk_whenTapped:^{
        [self setSelectItem:1];
    }];
}

- (void)setSelectItem:(NSInteger)interger{
    if (_selectIndex) {
        _selectIndex(interger);
    }
    if (interger == 0) {
        [_itemView setIsSelected:YES];
        sortImageV.image = [UIImage imageNamed:@"排序-1"];
    } else{
        [_itemView setIsSelected:NO];
        sortImageV.image = [UIImage imageNamed:@"排序"];
    }
}
@end
