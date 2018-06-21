//
//  DZMyBoughtCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtCell.h"
#import "NSDate+Format.h"
#import "NSString+Common.h"
#import "DZCityModel.h"

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
    _descLabel.textColor = [UIColor colorWithHex:@"777777"];
    [backView addSubview:_descLabel];
    
    _expectPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(backView.width/2.0, 45, backView.width/2.0, 22)];
    _expectPriceLabel.font = [UIFont systemFontOfSize:12];
    _expectPriceLabel.textColor = [UIColor colorWithHex:@"777777"];
    [backView addSubview:_expectPriceLabel];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.font = [UIFont systemFontOfSize:12];
    _priceLabel.textColor = [UIColor colorWithHex:@"777777"];
    _priceLabel.height = 22;
    _priceLabel.right = SCREEN_WIDTH - 24;
    _priceLabel.top = _descLabel.top;
    _priceLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_priceLabel];
    
    _cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _descLabel.bottom, SCREEN_WIDTH - 100, 22)];
    _cityLabel.font = [UIFont systemFontOfSize:12];
    _cityLabel.textColor = [UIColor colorWithHex:@"777777"];
    [backView addSubview:_cityLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _cityLabel.bottom, SCREEN_WIDTH - 100, 22)];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor colorWithHex:@"777777"];
    [backView addSubview:_timeLabel];
    
    _effeTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(backView.width/2.0, _timeLabel.top, backView.width/2.0 , 22)];
    _effeTimeLabel.font = [UIFont systemFontOfSize:12];
    _effeTimeLabel.textColor = [UIColor colorWithHex:@"777777"];
    [backView addSubview:_effeTimeLabel];
    
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
    
    _tipView = [[UIView alloc]initWithFrame:CGRectMake(_newsLabel.width, 7, 5, 5)];
    _tipView.layer.masksToBounds = YES;
    _tipView.layer.cornerRadius = 2.5f;
    _tipView.backgroundColor = UIRedColor;
    [_newsLabel addSubview:_tipView];
}

- (void)setCellConttent:(NSDictionary *)dic{
    _titleLabel.text = [dic[@"wantToBuyName"] description];
    _descLabel.text = [NSString stringWithFormat:@"采购量：%@公斤",[self formatString2:[dic objectForKey:@"buyCount"]]];
    _expectPriceLabel.text = [NSString stringWithFormat:@"期望价格：%@元/公斤",[self formatString2:dic[@"expecPrice"]]];
    NSString *areaStr = [DZCityModel prov:[self formatString:dic[@"expecAreaProv"]] city:[self formatString:dic[@"expecAreaCity"]] dist:[self formatString:dic[@"expecAreaDist"]]];
    _cityLabel.text = [NSString stringWithFormat:@"期望货源地：%@", areaStr];
    _timeLabel.text = [NSString stringWithFormat:@"发布日期：%@", [NSDate timestampToCommonTime:[dic objectForKey:@"releDate"]]];
    _effeTimeLabel.text = [NSString stringWithFormat:@"有效日期：%@", [NSDate timestampToCommonTime:[dic objectForKey:@"effePer"]]];
    _currentsLabel.text = [NSString stringWithFormat:@"当前有%@家供应商",[self formatString2:[dic objectForKey:@"recomCount"]]];
    
    _newsLabel.text = [NSString stringWithFormat:@"有%@家新意向",[self formatString2:[dic objectForKey:@"hasReadCount"]]];
    [self setCurrentType:dic[@"wantToBuyState"]];
    
    if ([[self formatString2:[dic objectForKey:@"hasReadCount"]] integerValue] <= 0) {
        _tipView.hidden = YES;
    } else {
        _tipView.hidden = NO;
    }
    
}
- (NSString *) formatString:(NSString *)string{
    if ([string isEqual:[NSNull null]]) {
        return @"";
    }
    return string;
}
- (NSString *)formatString2:(NSString *)string{
    if ([string isEqual:[NSNull null]]) {
        return @"0";
    }
    return string;
}
- (void)setCurrentType:(NSString *)type{
    if([type isEqualToString:@"0"]){
        [self setType:MyBoughtTypeNormal];
    }else if ([type isEqualToString:@"1"]){
        [self setType:MyBoughtTypePass];
    }else if ([type isEqualToString:@"2"]){
        [self setType:MyBoughtTypeRevocation];
    }
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
