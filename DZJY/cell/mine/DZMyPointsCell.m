//
//  DZMyPointsCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyPointsCell.h"

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
    [backView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, 10, SCREEN_WIDTH - 100, 21)];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = UITitleColor;
    [backView addSubview:_titleLabel];
    
    _pointsLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 12, _titleLabel.bottom, SCREEN_WIDTH - 100, 21)];
    _pointsLabel.font = [UIFont systemFontOfSize:12];
    _pointsLabel.textColor = RGBCOLOR(254, 82, 0);
    [backView addSubview:_pointsLabel];
    
    [self test];
}
- (void)test{
    [_timeLabel setText:@"2018-04-20 10:10:10"];
    [_titleLabel setText:@"合同测试测试测试9000元"];
    [_pointsLabel setText:@"交易额积分：+59"];
    _imageV.backgroundColor = UICyanColor;
}
- (void)setContent:(NSDictionary *)dic{
    
}
@end