//
//  DZCategoryAllCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryAllCell.h"
@interface DZCategoryAllCell(){
    UIView *_lineView;
}
@end
@implementation DZCategoryAllCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}

- (void)afterView{
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, 15, 100, 20)];
    _titleLabel.textColor = UITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.text = @"蔬菜";
    [self addSubview:_titleLabel];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, 3, 20)];
    _lineView.backgroundColor = UICommonColor;
    _lineView.hidden = YES;
    [self addSubview:_lineView];
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (_isSelected) {
        _lineView.hidden = NO;
        _titleLabel.textColor = UICommonColor;
        self.backgroundColor = UIWhiteColor;
    } else {
        _lineView.hidden = YES;
        _titleLabel.textColor = UITitleColor;
        self.backgroundColor = UIBackgroundColor;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setContent:(NSDictionary *)dic{
    _titleLabel.text = [dic[@"name"] description];
    _cid = [dic[@"id"] description];
}

@end
