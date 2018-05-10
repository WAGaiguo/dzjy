//
//  DZDeliveryCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyDeliveryCell.h"
#import <NSAttributedString+YYText.h>
#import "NSDate+Format.h"
@implementation DZMyDeliveryCell

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
        [self first];
        [self second];
        [self third];
    }
    return self;
}
- (void)first{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 35)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 0, 250, 35)];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textColor = [UIColor colorWithHex:@"333333"];
    [backView addSubview:_timeLabel];
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.font = [UIFont systemFontOfSize:12];
    _stateLabel.textColor = [UIColor colorWithHex:@"fe0000"];
    _stateLabel.width = 65;
    _stateLabel.height = 30;
    _stateLabel.right = backView.width - 11;
    _stateLabel.centerY = 17.5;
    _stateLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_stateLabel];
    
}

- (void)second{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 42, SCREEN_WIDTH - 14, 100)];
    backView.backgroundColor = UIBackgroundColor;
    [self addSubview:backView];
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(13, 5, 90, 90)];
    _imageV.layer.masksToBounds = YES;
    _imageV.layer.cornerRadius = 4.5f;
    [backView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.numberOfLines = 2;
    _titleLabel.width = SCREEN_WIDTH - 130;
    _titleLabel.left = _imageV.right + 10;
    _titleLabel.top = 10;
    _titleLabel.height = 40;
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [backView addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 10, _titleLabel.bottom + 15, SCREEN_WIDTH - 140, 20)];
    _priceLabel.font = [UIFont systemFontOfSize:12];
    _priceLabel.textColor = UICommonColor;
    [backView addSubview:_priceLabel];
    
//    _titleLabel.attributedText = [self attributeString:@"  No爱家of金额欧文IE奇偶发Joe鸡尾酒；而非叫我IE减肥 哦微积分" state:DZPayStateAll];
//    _priceLabel.text = @"￥555.555";
//    _imageV.backgroundColor = UICyanColor;
}
- (NSMutableAttributedString *)attributeString:(NSString *)content state:(DZPayState)state{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:content];
    if (state == DZPayState1){
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"预付"];
        //        attach.bounds = CGRectMake(0, 0, 32, 16);
        NSAttributedString *attributeStr2 = [NSAttributedString attributedStringWithAttachment:attach];
        [attString insertAttributedString:attributeStr2 atIndex:0];
    }else if (state == DZPayState2){
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"先款"];
        NSAttributedString *attributeStr2 = [NSAttributedString attributedStringWithAttachment:attach];
        //        attach.bounds = CGRectMake(0, 0, 32, 16);
        [attString insertAttributedString:attributeStr2 atIndex:0];
    }else if (state == DZPayStateAll){
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"预付"];
        NSAttributedString *attributeStr2 = [NSAttributedString attributedStringWithAttachment:attach];
        [attString insertAttributedString:attributeStr2 atIndex:0];
        [attString insertString:@"  " atIndex:0];
        NSTextAttachment *attach1 = [[NSTextAttachment alloc] init];
        attach1.image = [UIImage imageNamed:@"先款"];
        NSAttributedString *attributeStr1 = [NSAttributedString attributedStringWithAttachment:attach1];
        [attString insertAttributedString:attributeStr1 atIndex:0];
    }
    return attString;
}
- (void)third{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 142, SCREEN_WIDTH - 14, 75)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _dealLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 0, SCREEN_WIDTH/2.0 - 30, 32)];
    _dealLabel.font = [UIFont systemFontOfSize:12];
    _dealLabel.textColor = UISubTitleColor;
    [backView addSubview:_dealLabel];
    
    _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(_dealLabel.right, 0, backView.width - _dealLabel.right - 11, 32)];
    _totalLabel.font = [UIFont systemFontOfSize:13];
    _totalLabel.textColor = [UIColor colorWithHex:@"fe5200"];
    _totalLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_totalLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, _totalLabel.bottom, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [backView addSubview:lineView];
    
    _companyLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, lineView.bottom, SCREEN_WIDTH - 100, 42)];
    _companyLabel.textColor = [UIColor colorWithHex:@"333333"];
    _companyLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:_companyLabel];
    
    /**
     pxcook 还挺好用 直接复制过来代码 O(∩_∩)O哈哈~
     **/
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    btn.layer.borderColor = [[UIColor colorWithRed:119.0f/255.0f green:119.0f/255.0f blue:119.0f/255.0f alpha:1.0f] CGColor];
    btn.layer.borderWidth = ONE_PIXEL;
    btn.width = 75;
    btn.height = 26;
    btn.centerY = _companyLabel.centerY;
    btn.right = backView.width - 11;
    [btn setTitle:@"拨打电话" forState:UIControlStateNormal];
    [btn setTitleColor:UISubTitleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [backView addSubview:btn];
    [btn bk_addEventHandler:^(id sender) {
        [HudUtils showMessage:@"打电话测试"];
        if (_callBlock) {
            _callBlock();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
//    [self test];
    
}
- (void)test{
    _stateLabel.text = [NSString stringWithFormat:@"%@", @"待双发支付"];
    _timeLabel.text = [NSString stringWithFormat:@"2018-04-20 10:18:00"];
    _dealLabel.text = [NSString stringWithFormat:@"成交量：%@",@"500公斤"];
    _totalLabel.attributedText = [self str:[NSString stringWithFormat:@"总成交量：%@",@"7000公斤"]];
    _companyLabel.text = @"联信智源公司";
}
- (NSMutableAttributedString *)str:(NSString *)str{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:str];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:85.0f/255.0f green:85.0f/255.0f blue:85.0f/255.0f alpha:1.0f] range:NSMakeRange(0, 5)];
    return attribute;
}
- (void)setContent:(NSDictionary *)dic{
    [self typeStr:dic[@"delivBillStateType"]];
    _timeLabel.text = [NSDate timestampToTime:[dic objectForKey:@"bulidDate"]];
    _dealLabel.text = [NSString stringWithFormat:@"成交量：%@%@",dic[@"buyCount"],dic[@"measUnitName"]];
    _companyLabel.text = dic[@"sellerName"];
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",dic[@"price"]];
    NSString *picStr = [NSString stringWithFormat:@"%@%@",DZCommonUrl,[[dic objectForKey:@"fileUrl"]description]];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:picStr]];
    NSString *titleStr = [NSString stringWithFormat:@"  %@", [dic[@"commName"] description]];
    if ([[dic[@"listModeType"] description] isEqualToString:@"0"]) {
        _titleLabel.attributedText = [self attributeString:titleStr state:DZPayState1];
    } else if ([[dic[@"listModeType"] description] isEqualToString:@"1"]){
        _titleLabel.attributedText = [self attributeString:titleStr state:DZPayState2];
    } else{
        _titleLabel.attributedText = [self attributeString:titleStr state:DZPayStateAll];
    }
}
- (void)typeStr:(NSString *)type{
    if ([type isEqualToString:@"0"]) {
        _stateLabel.text = @"强制解除";
    }else if ([type isEqualToString:@"1"]){
        _stateLabel.text = @"解除";
    }else if ([type isEqualToString:@"2"]){
        _stateLabel.text = @"待发货";
    }else if ([type isEqualToString:@"3"]){
        _stateLabel.text = @"待验票";
    }else if ([type isEqualToString:@"4"]){
        _stateLabel.text = @"待验货";
    }else if ([type isEqualToString:@"5"]){
        _stateLabel.text = @"验货异议中";
    }else if ([type isEqualToString:@"6"]){
        _stateLabel.text = @"验票异议";
    }else if ([type isEqualToString:@"7"]){
        _stateLabel.text = @"已完成";
    }else if ([type isEqualToString:@"8"]){
        _stateLabel.text = @"待支付";
    }
}
@end
