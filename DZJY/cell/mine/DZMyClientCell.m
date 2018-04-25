//
//  DZMyClientCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyClientCell.h"

@implementation DZMyClientCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 61)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];

    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 47, 47)];
    [backView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, 10, 100, 16)];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = UITitleColor;
    [backView addSubview:_titleLabel];
    
    _subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, _titleLabel.bottom + 7, SCREEN_WIDTH - 160, 16)];
    _subTitleLabel.font = [UIFont systemFontOfSize:12];
    _subTitleLabel.textColor = UISubTitleColor;
    [backView addSubview:_subTitleLabel];
    
    [self test];
}
- (void)test{
    _imageV.backgroundColor = UICyanColor;
    _titleLabel.text = @"初级会员";
    _subTitleLabel.text = @"张三的歌";
}
-(void)setContent:(NSDictionary *)dic{
    
}

@end
