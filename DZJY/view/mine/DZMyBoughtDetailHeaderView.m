//
//  DZMyBoughtDetailHeaderView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyBoughtDetailHeaderView.h"
#import "NSDate+Format.h"
#import "DZCityModel.h"
#import "NSString+common.h"

@implementation DZMyBoughtDetailHeaderView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.height = 300;
        self.width = SCREEN_WIDTH;
        self.backgroundColor = UIBackgroundColor;
        [self makeTop];
        [self makeMiddle];
        [self makeBottom];
    }
    return self;
}
- (void)makeTop{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 56)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _label1 = [[UILabel alloc]initWithFrame:CGRectMake(11, 11, SCREEN_WIDTH - 80, 14)];
    _label1.font = [UIFont systemFontOfSize:12];
    _label1.textColor = RGBCOLOR(119, 119, 119);
    [backView addSubview:_label1];
    
    _label2 = [self makeLabel:12 textColor:RGBCOLOR(119, 119, 119) frame:CGRectMake(11, _label1.bottom + 10, SCREEN_WIDTH - 80, 14)];
    [backView addSubview:_label2];
    
    _typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 64, 0, 40, 34)];
    _typeLabel.textColor = RGBCOLOR(254, 0, 0);
    _typeLabel.textAlignment = NSTextAlignmentRight;
    _typeLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_typeLabel];
}


- (void)makeMiddle{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 70, SCREEN_WIDTH - 14, 190)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 4, SCREEN_WIDTH - 36, 23)];
    _titleLabel.textColor = UITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_titleLabel];
    
    _numsLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, _titleLabel.bottom, SCREEN_WIDTH - 36, 23)];
    _numsLabel.textColor = UITitleColor;
    _numsLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_numsLabel];
    
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, _numsLabel.bottom, SCREEN_WIDTH - 36, 23)];
    _priceLabel.textColor = UITitleColor;
    _priceLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_priceLabel];
    
    _areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, _priceLabel.bottom, SCREEN_WIDTH - 36, 23)];
    _areaLabel.textColor = UITitleColor;
    _areaLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_areaLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [backView addSubview:lineView];
    
    _releaseData = [[UILabel alloc]initWithFrame:CGRectMake(11, 109, SCREEN_WIDTH - 36, 14)];
    _releaseData.font = [UIFont systemFontOfSize:12];
    _releaseData.textColor = RGBCOLOR(119, 119, 119);
    [backView addSubview:_releaseData];
    
    _effectiveData = [[UILabel alloc]initWithFrame:CGRectMake(11, 135, SCREEN_WIDTH - 36, 14)];
    _effectiveData.font = _releaseData.font;
    _effectiveData.textColor = _releaseData.textColor;
    [backView addSubview:_effectiveData];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 157, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView2.backgroundColor = UISeperatorColor;
    [backView addSubview:lineView2];
    
    _addedLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 158, SCREEN_WIDTH - 36, 32)];
    _addedLabel.font = [UIFont systemFontOfSize:12];
    _addedLabel.textColor = RGBCOLOR(119, 119, 119);
    [backView addSubview:_addedLabel];
    
}
- (void)makeBottom{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = RGBCOLOR(119, 119, 119);
    label.text = @"供货意向";
    [label sizeToFit];
    label.centerX = SCREEN_WIDTH/2.0;
    label.centerY = 282;
    [self addSubview:label];
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, ONE_PIXEL)];
    leftView.centerY = label.centerY;
    leftView.right = label.left - 10;
    leftView.backgroundColor = UISeperatorColor;
    [self addSubview:leftView];
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, ONE_PIXEL)];
    rightView.centerY = label.centerY;
    rightView.left = label.right + 10;
    rightView.backgroundColor = UISeperatorColor;
    [self addSubview:rightView];
    
//    [self test];
}
- (void)test{
    _label1.text = [NSString stringWithFormat:@"求购编号：%@", nil];
    _label2.text = [NSString stringWithFormat:@"交易员：%@", nil];
    _titleLabel.text = [NSString stringWithFormat:@"商品：%@", nil];
    _numsLabel.text = [NSString stringWithFormat:@"采购量：%@", nil];
    _priceLabel.text = [NSString stringWithFormat:@"期望价格：%@", nil];
    _areaLabel.text = [NSString stringWithFormat:@"期望货源地：%@", nil];
    _releaseData.text = [NSString stringWithFormat:@"发布日期：%@", nil];
    _effectiveData.text = [NSString stringWithFormat:@"有效日期：%@", nil];
    _addedLabel.text = [NSString stringWithFormat:@"补充说明：%@",nil];
}
- (UILabel *)makeLabel:(NSInteger)font textColor:(UIColor *)color frame:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    return label;
}
- (void)setContent:(NSDictionary *)dic{
    _label1.text = [NSString stringWithFormat:@"求购编号：%@", [self fromatStr:dic[@"wantToBuyNumb"]]];
    _label2.text = [NSString stringWithFormat:@"交易员：%@", [self fromatStr:dic[@"releMembName"]]];
    _titleLabel.text = [NSString stringWithFormat:@"商品：%@",  [self fromatStr:dic[@"wantToBuyName"]]];
    _numsLabel.text = [NSString stringWithFormat:@"采购量：%@ %@",  [self fromatStr:dic[@"buyCount"]], [self fromatStr:dic[@"measUnitName"]]];
    _priceLabel.text = [NSString stringWithFormat:@"期望价格：%@/%@",  [self fromatStr:dic[@"expecPrice"]], [self fromatStr:dic[@"measUnitName"]]];
    NSString *cityStr = [DZCityModel prov:[self fromatStr:dic[@"expecAreaProv"]]  city:[self fromatStr:dic[@"expecAreaCity"]] dist:[self fromatStr:dic[@"expecAreaDist"]]];
    _areaLabel.text = [NSString stringWithFormat:@"期望货源地：%@",cityStr];
    _releaseData.text = [NSString stringWithFormat:@"发布日期：%@", [NSDate timestampToTime:[self fromatStr:dic[@"releMembName"]]]];
    _effectiveData.text = [NSString stringWithFormat:@"有效日期：%@",  [NSDate timestampToTime:[self fromatStr:dic[@"effePer"]]]];
    _addedLabel.text = [NSString stringWithFormat:@"补充说明：%@", [self fromatStr:dic[@"remarks"]]];
}
- (NSString *)fromatStr:(NSString *)str{
    if ([str isEqual:[NSNull null]]) {
        return @"";
    }
    return str;
}
@end
