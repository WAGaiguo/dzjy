//
//  DZMyBoughtCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtCell.h"

@implementation DZMyBoughtCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 159)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 100, 34)];
    _titleLabel.textColor = UITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [backView addSubview:_titleLabel];
    
    _typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 64, 0, 40, 34)];
    _typeLabel.textColor = RGBCOLOR(254, 0, 0);
    _typeLabel.textAlignment = NSTextAlignmentRight;
    _typeLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_typeLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 34, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [backView addSubview:lineView];
    
    _descLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 45, SCREEN_WIDTH - 100, 22)];
    _descLabel.font = [UIFont systemFontOfSize:12];
    _descLabel.textColor = RGBCOLOR(119, 119, 199);
    [backView addSubview:_descLabel];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.font = [UIFont systemFontOfSize:12];
    _priceLabel.textColor = RGBCOLOR(119, 119, 119);
    _priceLabel.height = 22;
    _priceLabel.right = SCREEN_WIDTH - 24;
    _priceLabel.top = _descLabel.top;
    _priceLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_priceLabel];
    
    _cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _descLabel.bottom, SCREEN_WIDTH - 100, 22)];
    _cityLabel.font = [UIFont systemFontOfSize:12];
    _cityLabel.textColor = RGBCOLOR(119, 119, 199);
    [backView addSubview:_cityLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _cityLabel.bottom, SCREEN_WIDTH - 100, 22)];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = RGBCOLOR(119, 119, 199);
    [backView addSubview:_timeLabel];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView2.backgroundColor = UISeperatorColor;
    [backView addSubview:lineView2];
    
    _currentsLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, lineView2.bottom, 200, 35)];
    _currentsLabel.font = [UIFont systemFontOfSize:13];
    _currentsLabel.textColor = UITitleColor;
    [backView addSubview:_currentsLabel];
    
    _newsLabel = [[UILabel alloc]initWithFrame:CGRectMake(210, lineView2.bottom, SCREEN_WIDTH - 220 - 14, 35)];
    _newsLabel.font = [UIFont systemFontOfSize:13];
    _newsLabel.textAlignment = NSTextAlignmentRight;
    _newsLabel.textColor = UITitleColor;
    [backView addSubview:_newsLabel];
    
    [self makeTEST];
}

- (void)makeTEST{
    _titleLabel.text = @"紫皮大蒜";
    _descLabel.text = @"荷兰荷兰15号土豆";
    _cityLabel.text = @"期望货源地：";
    _timeLabel.text = @"2018-02-25~2018";
    _currentsLabel.text = @"当前有10家工艺上";
    _newsLabel.text = @"有2家新意向";
    _priceLabel.text = @"2/公斤";
    [self setType:MyBoughtTypeNormal];
}
- (void)setCellConttent:(NSDictionary *)dic{
    
}
-(void)setType:(MyBoughtType)type{
    switch (type) {
        case MyBoughtTypeNormal:
            _typeLabel.text = @"正常";
            break;
        case MyBoughtTypeRevocation:
            _typeLabel.text = @"撤销";
            break;
        case MyBoughtTypePass:
            _typeLabel.text = @"过期";
            break;
        default:
            break;
    }
}
@end
