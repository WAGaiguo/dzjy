//
//  DZMyPointsCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyPointsCell.h"
#import "NSDate+Format.h"

@implementation DZMyPointsCell

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
        [self makeTop];
        [self makeBottom];
    }
    return self;
}
- (void)makeTop{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(16, 0, 1, 100)];
    lineView.backgroundColor = UISeperatorColor;
//    lineView.backgroundColor = UICyanColor;
    [self addSubview:lineView];
    
    UIView *roundView = [[UIView alloc]init];
    roundView.layer.masksToBounds = YES;
    roundView.width = 7;
    roundView.height = 7;
    roundView.centerX = 16.5;
    roundView.centerY = 19;
    roundView.backgroundColor = UIBackgroundColor;
    roundView.layer.cornerRadius = 3.5;
    roundView.layer.borderWidth = 1.0;
    roundView.layer.borderColor = UISeperatorColor.CGColor;
    [self addSubview:roundView];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(32, 0, SCREEN_WIDTH - 32, 38)];
    _timeLabel.textColor = UISubTitleColor;
    _timeLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_timeLabel];
    
}
- (void)makeBottom{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(32, 38, SCREEN_WIDTH - 39, 62)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _imageV = [[UIImageView alloc]init];
    _imageV.top = 18;
    _imageV.left = 14;
    _imageV.width = _imageV.height = 25;
    _imageV.image = [UIImage imageNamed:@"订单"];
    [backView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, 10, SCREEN_WIDTH - 100, 21)];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = UITitleColor;
    [backView addSubview:_titleLabel];
    
    _pointsLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, _titleLabel.bottom, SCREEN_WIDTH - 100, 21)];
    _pointsLabel.font = [UIFont systemFontOfSize:12];
    _pointsLabel.textColor = RGBCOLOR(254, 82, 0);
    [backView addSubview:_pointsLabel];
}

- (void)setContent:(NSDictionary *)dic{
    _timeLabel.text = [NSDate timestampToTime:[dic[@"date"] description]];
    _titleLabel.text = [dic[@"abst"] description];
    if ([dic[@"integType"] isEqualToString:@"1"]) {
        _pointsLabel.text = [NSString stringWithFormat:@"交易额积分：+%d", [dic[@"integVal"] intValue]];
    }else if ([dic[@"integType"] isEqualToString:@"0"]){
        _pointsLabel.text = [NSString stringWithFormat:@"评价积分：+%d", [dic[@"integVal"] intValue]];
    }
  
}
@end
