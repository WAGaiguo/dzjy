//
//  DZMyOrderCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyOrderCell.h"
#import "NSDate+Format.h"

@implementation DZMyOrderCell

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
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 60)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    
    _orderNums = [[UILabel alloc]initWithFrame:CGRectMake(11, 0, 250, 30)];
    _orderNums.font = [UIFont systemFontOfSize:13];
    _orderNums.textColor = [UIColor colorWithHex:@"333333"];
    [backView addSubview:_orderNums];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 30, 250, 30)];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textColor = [UIColor colorWithHex:@"333333"];
    [backView addSubview:_timeLabel];
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.font = [UIFont systemFontOfSize:12];
    _stateLabel.textColor = [UIColor colorWithHex:@"fe0000"];
    _stateLabel.width = 65;
    _stateLabel.height = 30;
    _stateLabel.right = backView.width - 11;
    _stateLabel.centerY = 30;
    _stateLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_stateLabel];
    
}

- (void)second{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 67, SCREEN_WIDTH - 14, 100)];
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
        [attString insertAttributedString:[[NSAttributedString alloc]initWithString:@"  "] atIndex:0];
        NSTextAttachment *attach1 = [[NSTextAttachment alloc] init];
        attach1.image = [UIImage imageNamed:@"先款"];
        NSAttributedString *attributeStr1 = [NSAttributedString attributedStringWithAttachment:attach1];
        [attString insertAttributedString:attributeStr1 atIndex:0];
    }
    return attString;
}
- (void)third{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 167, SCREEN_WIDTH - 14, 75)];
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
        if (_callBlock) {
            _callBlock();
        }
    } forControlEvents:UIControlEventTouchUpInside];
}

- (NSMutableAttributedString *)str:(NSString *)str{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:str];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:85.0f/255.0f green:85.0f/255.0f blue:85.0f/255.0f alpha:1.0f] range:NSMakeRange(0, 5)];
    return attribute;
}
- (void)setContent:(NSDictionary *)dic{
    _orderNums.text = [NSString stringWithFormat:@"订单编号：%@",dic[@"ordNum"]];
    _timeLabel.text = [NSDate timestampToTime: dic[@"ordDate"]];
    _dealLabel.text = [NSString stringWithFormat:@"成交量：%@%@",dic[@"buyCount"], dic[@"measUnitName"]];
    _companyLabel.text = [dic[@"sellerName"] description];
    [self state:dic[@"ordStateType"]];
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",dic[@"price"]];
    _totalLabel.attributedText = [self formateString: [NSString stringWithFormat:@"商品总价：￥%@", [dic[@"totalMoney"] description]]];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", DZCommonUrl, dic[@"fileUrl"]]]];
    
    NSString *titleStr = [NSString stringWithFormat:@"  %@", [dic[@"commName"] description]];
    
    if ([[dic[@"listModeType"] description] isEqualToString:@"1"] && [[dic[@"payMethType"] description] isEqualToString:@"1"]) {
        _titleLabel.attributedText = [self attributeString:titleStr state:DZPayState1];
    } else if ([[dic[@"listModeType"] description] isEqualToString:@"0"] && [[dic[@"payMethType"] description] isEqualToString:@"0"]){
        _titleLabel.attributedText = [self attributeString:titleStr state:DZPayState2];
    } else if ([[dic[@"listModeType"] description] isEqualToString:@"1"] && [[dic[@"payMethType"] description] isEqualToString:@"0"]){
        _titleLabel.attributedText = [self attributeString:titleStr state:DZPayStateAll];
    } else{
        _titleLabel.text = [dic[@"commName"] description];
    }
}
- (void)state:(NSString *)state{
    if ([state isEqualToString:@"0"]) {
        _stateLabel.text = @"待双方支付";
    }else if ([state isEqualToString:@"1"]){
        _stateLabel.text = @"待买方支付";
    }else if ([state isEqualToString:@"2"]){
        _stateLabel.text = @"待卖方支付";
    }else if ([state isEqualToString:@"3"]){
        _stateLabel.text = @"取消";
    }else if ([state isEqualToString:@"4"]){
        _stateLabel.text = @"撤销";
    }else if ([state isEqualToString:@"5"]){
        _stateLabel.text = @"已生成合同";
    }
}
- (NSMutableAttributedString *)formateString:(NSString *)string{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:string];
    [str addAttribute:NSForegroundColorAttributeName value:UITitleColor range:NSMakeRange(0, 5)];
    return str;
}
@end
