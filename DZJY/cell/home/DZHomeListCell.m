//
//  DZHomeListCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/9.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeListCell.h"

@implementation DZHomeListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self afterView];
    }
    return self;
}

- (void)afterView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(5, 10, SCREEN_WIDTH - 10, 140)];
    [self addSubview:backView];
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 130, 130)];
    [backView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 10, SCREEN_WIDTH - 170 , 20)];
    _titleLabel.textColor = UITitleColor;
    [backView addSubview:_titleLabel];
    
    _areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, _titleLabel.bottom + 10, SCREEN_WIDTH - 170, 16)];
    _areaLabel.textColor = UISubTitleColor;
    [backView addSubview:_areaLabel];
    
    _numsLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, _areaLabel.bottom + 5, SCREEN_WIDTH - 170, 16)];
    _numsLabel.textColor = UISubTitleColor;
    [backView addSubview:_numsLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 110, (SCREEN_WIDTH - 170)/2.0, 16)];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.textColor = UISubTitleColor;
    [backView addSubview:_timeLabel];
    
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.textColor = UICommonColor;
    _priceLabel.centerY = _timeLabel.centerY;
    _priceLabel.width = _timeLabel.width;
    _priceLabel.height = 20;
    [backView addSubview:_priceLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
