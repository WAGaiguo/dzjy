//
//  DZMyAttentionCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAttentionCell.h"

@implementation DZMyAttentionCell

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
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = UITitleColor;
    [backView addSubview:_titleLabel];
    
    _pirceLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, _titleLabel.bottom + 10, 150, 16)];
    _pirceLabel.font = [UIFont systemFontOfSize:14];
    _pirceLabel.textColor = RGBCOLOR(254, 82, 1);
    [backView addSubview:_pirceLabel];
    
    _typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.right + 5, 10, 48, 16)];
    _typeLabel.backgroundColor = RGBCOLOR(209, 209, 209);
    _typeLabel.textColor = UIWhiteColor;
    _typeLabel.textAlignment = NSTextAlignmentCenter;
    _typeLabel.font = [UIFont systemFontOfSize:11];
    _typeLabel.layer.masksToBounds = YES;
    _typeLabel.layer.cornerRadius = 3;
    [backView addSubview:_typeLabel];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backView addSubview:_cancelBtn];
    _cancelBtn.sd_layout.widthIs(75).heightIs(26).rightSpaceToView(backView, 7).centerYEqualToView(backView);
    _cancelBtn.layer.masksToBounds = YES;
    _cancelBtn.layer.borderWidth = 1.0f;
    _cancelBtn.layer.borderColor = RGBCOLOR(119, 119, 119).CGColor;
    _cancelBtn.layer.cornerRadius = 5;
    [_cancelBtn setTitle:@"取消关注" forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_cancelBtn setTitleColor:RGBCOLOR(119, 119, 119) forState:UIControlStateNormal];
    [_cancelBtn bk_addEventHandler:^(id sender) {
        if (_cancelBlock) {
            _cancelBlock(self);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    [self test];
}
- (void)test{
    _imageV.backgroundColor = UICyanColor;
    _titleLabel.text = @"荷兰土豆";
    _pirceLabel.text = @"5.0元/公斤";
    _typeLabel.text = @"已下架";
}
@end
