//
//  DZSettingCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSettingCell.h"

@implementation DZSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 0, SCREEN_WIDTH - 14, 49)];
        backView.backgroundColor = UIWhiteColor;
        [self addSubview:backView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 34, 49)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHex:@"555555"];
        [backView addSubview:_titleLabel];
        
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back_gray"]];
        imageV.centerY = 25;
        imageV.right = _titleLabel.right - 7;
        [backView addSubview:imageV];
        
        UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 49 - ONE_PIXEL, SCREEN_WIDTH - 14, ONE_PIXEL)];
        bottomLine.backgroundColor = UISeperatorColor;
        [backView addSubview:bottomLine];
        
    }
    return self;
}
-(void)setText:(NSString *)text{
    [_titleLabel setText:text];
}
@end
