//
//  DZSortView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSortView.h"

@interface DZSortView()
{
    DZSortItemView *itemV1;
    DZSortItemView *itemV2;
    DZSortItemView *itemV3;
}
@end

@implementation DZSortView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)];
        backImageV.backgroundColor = UIBlackColor;
        backImageV.alpha = 0.3;
        [self addSubview:backImageV];
        [backImageV setUserInteractionEnabled:YES];
        [backImageV bk_whenTapped:^{
            [self setSelfHide];
        }];
        
        itemV1 = [[DZSortItemView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        itemV1.titleLabel.text = @"发布时间";
        itemV1.isSelected = YES;
        [self addSubview:itemV1];
        [itemV1 bk_whenTapped:^{
            [self tapT:0];
            itemV2.isSelected = NO;
            itemV3.isSelected = NO;
            itemV1.isSelected = YES;
        }];
        
        itemV2 = [[DZSortItemView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 44)];
        itemV2.titleLabel.text = @"发布价格";
        [self addSubview:itemV2];
        [itemV2 bk_whenTapped:^{
            [self tapT:1];
            itemV2.isSelected = YES;
            itemV3.isSelected = NO;
            itemV1.isSelected = NO;
        }];
        
        itemV3 = [[DZSortItemView alloc]initWithFrame:CGRectMake(0, 88, SCREEN_WIDTH, 44)];
        itemV3.titleLabel.text = @"可购买量";
        [self addSubview:itemV3];
        [itemV3 bk_whenTapped:^{
            [self tapT:2];
            itemV2.isSelected = NO;
            itemV3.isSelected = YES;
            itemV1.isSelected = NO;
        }];
        self.alpha = 0;
    }
    return self;
}

- (void)tapT: (NSInteger)aaa{
    [self setSelfHide];
    if (_tapSelect) {
        _tapSelect(aaa);
    }
}
- (void)setAnimation{
    self.hidden = NO;
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 1;
    }];
}
- (void)setSelfHide{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
@end

@implementation DZSortItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 200, 42)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UITitleColor;
        [self addSubview:_titleLabel];
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 44 - ONE_PIXEL, SCREEN_WIDTH, ONE_PIXEL)];
        lineView.backgroundColor = UISeperatorColor;
        [self addSubview:lineView];
        self.backgroundColor = UIWhiteColor;
    }
    return self;
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        _titleLabel.textColor = UICommonColor;
    }else{
        _titleLabel.textColor = UITitleColor;
        
    }
}

@end
