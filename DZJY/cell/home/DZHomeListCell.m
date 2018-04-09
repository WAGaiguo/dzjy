//
//  DZHomeListCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/9.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeListCell.h"
#import "NSDate+Format.h"

@implementation DZHomeListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIBackgroundColor;
        [self afterView];
    }
    return self;
}

- (void)afterView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 140)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 130, 130)];
    _imageV.backgroundColor = UICyanColor;
    [backView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 10, SCREEN_WIDTH - 170 , 20)];
    _titleLabel.textColor = UITitleColor;
    _timeLabel.font = [UIFont systemFontOfSize:16];
    [backView addSubview:_titleLabel];
    
    _areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, _titleLabel.bottom + 10, SCREEN_WIDTH - 170, 16)];
    _areaLabel.textColor = UISubTitleColor;
    _areaLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_areaLabel];
    
    _numsLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, _areaLabel.bottom + 2, SCREEN_WIDTH - 170, 16)];
    _numsLabel.textColor = UISubTitleColor;
    _numsLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_numsLabel];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.width = (SCREEN_WIDTH - 170)/2.0;
    _timeLabel.height = 16;
    _timeLabel.right = SCREEN_WIDTH - 21;
    _timeLabel.bottom = 130;
    _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.textColor = UITimeColor;
    _timeLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_timeLabel];
    
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.textColor = UICommonColor;
    _priceLabel.width = _timeLabel.width + 20;
    _priceLabel.left = 150;
    _priceLabel.height = 18;
    _priceLabel.bottom = _timeLabel.bottom;
    _priceLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_priceLabel];
    
    NSString *dateStr = [NSDate updateTimeForNow:@"1394567890.99"];
    NSLog(@"%@",dateStr);
    _timeLabel.text =dateStr;
     _priceLabel.attributedText = [self priceStr:@"￥5.0" unitStr:@"元/公斤"];
//     _timeLabel.text = @"1小时前";
    _titleLabel.text = @"北京红辣椒";
    _areaLabel.text = @"产地；邯郸";
    _numsLabel.text = @"起订量：1000公斤";
    
}

- (NSMutableAttributedString *)priceStr:(NSString *)priceStr unitStr:(NSString *)unitStr{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ %@",priceStr,unitStr]];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, priceStr.length)];
    return attString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
