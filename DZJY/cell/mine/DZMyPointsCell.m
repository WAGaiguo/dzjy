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
        [self makeTop];
        [self makeBottom];
    }
    return self;
}
- (void)makeTop{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(16, 0, ONE_PIXEL, 100)];
    lineView.backgroundColor = UISeperatorColor;
    [self addSubview:lineView];
    
    UIView *roundView = [[UIView alloc]init];
    roundView.layer.masksToBounds = YES;
    roundView.width = 7;
    roundView.height = 7;
    roundView.centerX = 16;
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
    _imageV.centerY = 31;
    _imageV.centerX = 25;
    _imageV.width = _imageV.height = 25;
    [backView addSubview:_imageV];
    
//    _timeLabel = [UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 13, 0, <#CGFloat width#>, <#CGFloat height#>)
}
@end
