//
//  DZMyPointsHeaderView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyPointsHeaderView.h"

@implementation DZMyPointsHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"资金积分背景"]];
        imageV.left = 0;
        imageV.top = 0;
        imageV.width = SCREEN_WIDTH;
        [self addSubview:imageV];
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 85, SCREEN_WIDTH, 20)];
    _timeLabel.textColor = UIWhiteColor;
    _timeLabel.font = [UIFont systemFontOfSize:18];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_timeLabel];
    
    _pointsLabel = [[UILabel alloc]init];
    _pointsLabel.width = 100;
    _pointsLabel.height = 25;
    _pointsLabel.font = [UIFont systemFontOfSize:13];
    _pointsLabel.backgroundColor = RGBCOLOR(211, 95, 39);
    _pointsLabel.textAlignment = NSTextAlignmentCenter;
    _pointsLabel.centerX = SCREEN_WIDTH/2.0;
    _pointsLabel.top = _timeLabel.bottom + 10;
    _pointsLabel.textColor = UIWhiteColor;
    [self addSubview:_pointsLabel];
    _pointsLabel.layer.masksToBounds = YES;
    _pointsLabel.layer.cornerRadius = 25/2.0;
    
    UIImageView *rightPic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"日期选择"]];
    rightPic.right = SCREEN_WIDTH - 13;
    rightPic.centerY = 75;
    if (IS_IPHONE_X) {
        rightPic.centerY = _timeLabel.centerY;
    }
    [self addSubview:rightPic];
    rightPic.userInteractionEnabled = YES;
    [rightPic bk_whenTapped:^{
        if (_tapBlock) {
            _tapBlock();
        }
    }];
    
    [self test];
}
- (void)test{
    [_timeLabel setText:@"本月"];
    [_pointsLabel setText:@"总积分：566"];
}
- (void)setTopContent:(NSString *)str{
    _timeLabel.text = str;
}
- (void)setBottomContent:(NSString *)str{
    [_pointsLabel setText:[NSString stringWithFormat:@"总积分：%@",str]];
    [_pointsLabel sizeToFit];
    _pointsLabel.height = 25;
    _pointsLabel.width = _pointsLabel.width + 20;
    _pointsLabel.centerX = SCREEN_WIDTH/2.0;
}
- (void)setBottomFundContent:(NSString *)disb reve:(NSString *)reve{
    [_pointsLabel setText:[NSString stringWithFormat:@"总支出：%@ 总收入%@",disb, reve]];
    [_pointsLabel sizeToFit];
    _pointsLabel.height = 25;
    _pointsLabel.width = _pointsLabel.width + 20;
    _pointsLabel.centerX = SCREEN_WIDTH/2.0;
}
@end
