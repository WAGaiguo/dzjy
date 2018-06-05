//
//  DZMyFundCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyFundCell.h"
#import "NSDate+Format.h"

@implementation DZMyFundCell

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
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 90)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 15, SCREEN_WIDTH - 116, 17)];
    _titleLabel.textColor = UITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [backView addSubview:_titleLabel];
    
    _moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.right, _titleLabel.top - 1, 80, 19)];
    _moneyLabel.textAlignment = NSTextAlignmentRight;
    _moneyLabel.textColor = UITitleColor;
    [backView addSubview:_moneyLabel];
    
    _descLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, _moneyLabel.bottom + 11, SCREEN_WIDTH - 36, 13)];
    _descLabel.font = [UIFont systemFontOfSize:11];
    _descLabel.textColor = UISubTitleColor;
    [backView addSubview:_descLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, _descLabel.bottom + 10, SCREEN_WIDTH - 36, 13)];
    _timeLabel.font = [UIFont systemFontOfSize:11];
    _timeLabel.textColor = UISubTitleColor;
    [backView addSubview:_timeLabel];
    
//    [self test];
}

- (void)test{
    _titleLabel.text = @"寿光百胜盟电子商务";
    _moneyLabel.text = @"-99999";
    _descLabel.text = [NSString stringWithFormat:@"摘要：%@",@"blakjfoiewfjei"];
    _timeLabel.text = [NSString stringWithFormat:@"时间：%@",@"2018-05-01"];
}

- (void)setContent:(NSDictionary *)dic{
    _titleLabel.text = [dic[@"othPartyName"] description];
    if ([dic[@"reveMoney"] integerValue] > 0) {
        _moneyLabel.text = [dic[@"reveMoney"] description];
    }
    if ([dic[@"disbMoney"] integerValue] > 0) {
        _moneyLabel.text = [NSString stringWithFormat:@"-%@", [dic[@"disbMoney"] description]];
    }
    _descLabel.text = [NSString stringWithFormat:@"摘要：%@",dic[@"abst"]];
    _timeLabel.text = [NSString stringWithFormat:@"时间：%@",[NSDate timestampToTime: dic[@"createDate"]]];
}

@end
