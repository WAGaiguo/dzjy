//
//  DZMyClientCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyClientCell.h"
#import "NSString+Common.h"

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
    
    _subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, _titleLabel.bottom + 7, SCREEN_WIDTH - 100, 16)];
    _subTitleLabel.font = [UIFont systemFontOfSize:12];
    _subTitleLabel.textColor = UISubTitleColor;
    [backView addSubview:_subTitleLabel];
}

-(void)setContent:(NSDictionary *)dic{
    _titleLabel.text = [NSString formateString:dic[@"compFullName"]];
    _subTitleLabel.text = [NSString stringWithFormat:@"%@   %@   %@", [NSString formateString:dic[@"contactName"]], [NSString formateString:dic[@"contactMobile"]], [NSString formateString:dic[@"contactTel"]]];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", DZCommonUrl, dic[@"logoUrl"]]] placeholderImage:[UIImage imageNamed:@"client_logo"]];
}

@end
