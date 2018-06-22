//
//  DZOrderCheckCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCheckCell.h"
#import "NSString+Common.h"

@implementation DZOrderCheckCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self afterView];
    }
    return self;
}

- (void)afterView{
    [self first];
    [self second];
    [self third];
}
- (void)first{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 17, 80, 16)];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithHex:@"555555"];
    label1.text = @"供应商：";
    label1.textAlignment = NSTextAlignmentRight;
    [self addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, label1.bottom + 10, 80, 16)];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor colorWithHex:@"555555"];
    label2.text = @"联系人：";
    label2.textAlignment = NSTextAlignmentRight;
    [self addSubview:label2];
    
    _companyLabel = [[UILabel alloc]initWithFrame:CGRectMake(label1.right + 10, label1.top, SCREEN_WIDTH - 90, 16)];
    _companyLabel.font = [UIFont systemFontOfSize:14];
    _companyLabel.textColor = [UIColor colorWithHex:@"333333"];
    [self addSubview:_companyLabel];
    
    _personLabel = [[UILabel alloc]initWithFrame:CGRectMake(label2.right + 10, label2.top, SCREEN_WIDTH - 90, 16)];
    _personLabel.font = [UIFont systemFontOfSize:14];
    _personLabel.textColor = [UIColor colorWithHex:@"333333"];
    [self addSubview:_personLabel];
    
    UIImageView *lineV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"分割线22"]];
    lineV.left = 0;
    lineV.top = _personLabel.bottom + 17;
    [self addSubview:lineV];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, lineV.bottom, SCREEN_WIDTH, 7)];
    lineView.backgroundColor = UIBackgroundColor;
    [self addSubview:lineView];
    
}

- (void)second{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 93, SCREEN_WIDTH, 100)];
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
- (void)third{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(13, 192, 150, 37)];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithHex:@"555555"];
    label1.text = @"货品单价:";
    [self addSubview:label1];
    _startNumsLabel = [[UILabel alloc]initWithFrame:CGRectMake(label1.right, label1.top, SCREEN_WIDTH - label1.right - 13, 37)];
    _startNumsLabel.textAlignment = NSTextAlignmentRight;
    _startNumsLabel.textColor = [UIColor colorWithHex:@"333333"];
    _startNumsLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_startNumsLabel];

    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(13, label1.bottom, 150, 37)];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor colorWithHex:@"555555"];
    label2.text = @"购买数量:";
    [self addSubview:label2];
    _buyNumsLabel = [[UILabel alloc]initWithFrame:CGRectMake(label2.right , label2.top, SCREEN_WIDTH - label2.right - 13, 37)];
    _buyNumsLabel.textAlignment = NSTextAlignmentRight;
    _buyNumsLabel.textColor = [UIColor colorWithHex:@"333333"];
    _buyNumsLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_buyNumsLabel];

    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(13, label2.bottom, 150, 37)];
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = [UIColor colorWithHex:@"555555"];
    label3.text = @"贷款金额:";
    [self addSubview:label3];
    _totalMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(label3.right, label3.top, SCREEN_WIDTH - label3.width - 26, 37)];
    _totalMoneyLabel.textAlignment = NSTextAlignmentRight;
    _totalMoneyLabel.textColor = [UIColor colorWithHex:@"3333333"];
    _totalMoneyLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_totalMoneyLabel];
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(13, label3.bottom, 150, 37)];
    label4.font = [UIFont systemFontOfSize:14];
    label4.textColor = UITitleColor;
    label4.text = @"保证金：";
    [self addSubview:label4];
    _moneyLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(label4.right, label4.top, SCREEN_WIDTH - label4.width - 26, 37)];
    _moneyLabel1.textColor = UITitleColor;
    _moneyLabel1.textAlignment = NSTextAlignmentRight;
    _moneyLabel1.font = [UIFont systemFontOfSize:14];
    [self addSubview:_moneyLabel1];
    
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(13, label4.bottom, 150, 37)];
    label5.font = [UIFont systemFontOfSize:14];
    label5.textColor = UITitleColor;
    label5.text = @"手续费：";
    [self addSubview:label5];
    _moneyLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(label5.right, label5.top, SCREEN_WIDTH - label5.width - 26, 37)];
    _moneyLabel2.textColor = UITitleColor;
    _moneyLabel2.textAlignment = NSTextAlignmentRight;
    _moneyLabel2.font = [UIFont systemFontOfSize:14];
    [self addSubview:_moneyLabel2];
    
    UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(13, label5.bottom, 150, 37)];
    label6.font = [UIFont systemFontOfSize:14];
    label6.textColor = UITitleColor;
    label6.text = @"需支付：";
    [self addSubview:label6];
    _moneyLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(label6.right, label6.top, SCREEN_WIDTH - label6.width - 26, 37)];
    _moneyLabel3.textColor = UICommonColor;
    _moneyLabel3.textAlignment = NSTextAlignmentRight;
    _moneyLabel3.font = [UIFont systemFontOfSize:14];
    [self addSubview:_moneyLabel3];
    
    
    UIView *lineView7 = [[UIView alloc]initWithFrame:CGRectMake(0, label6.bottom + 10, SCREEN_WIDTH, 7)];
    lineView7.backgroundColor = UIBackgroundColor;
    lineView7.tag = 77;
    [self addSubview:lineView7];
    
    UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineView7.bottom , 67, 37)];
    label7.font = [UIFont systemFontOfSize:15];
    label7.textColor = UI666666Color;
    label7.textAlignment = NSTextAlignmentRight;
    label7.text = @"订单号:";
    [self addSubview:label7];
    _orderNums = [[UILabel alloc]initWithFrame:CGRectMake(label7.right + 8, label7.top, SCREEN_WIDTH - label7.width - 26, 37)];
    _orderNums.textColor = UITitleColor;
    _orderNums.font = [UIFont systemFontOfSize:15];
    [self addSubview:_orderNums];
    
    UILabel *label8 = [[UILabel alloc]initWithFrame:CGRectMake(13, label7.bottom, 67, 25)];
    label8.font = [UIFont systemFontOfSize:15];
    label8.textColor = UI666666Color;
    label8.text = @"卖方名称:";
    label8.textAlignment = NSTextAlignmentRight;
    [self addSubview:label8];
    _sellerName = [[UILabel alloc]initWithFrame:CGRectMake(label8.right + 8, label8.top, SCREEN_WIDTH - label8.width - 26, 25)];
    _sellerName.textColor = UITitleColor;
    _sellerName.font = [UIFont systemFontOfSize:15];
    [self addSubview:_sellerName];
    
    [self test];
}
- (void)test{
//    _companyLabel.text = @"公司公司";
//    _personLabel.text = @"123456789000 alsjdf";
//
//    _imageV.backgroundColor = UICyanColor;

    _startNumsLabel.text = @"500";
    _buyNumsLabel.text = @"5000";
    _totalMoneyLabel.text = @"50000";
    _moneyLabel1.text = @"66";
    _moneyLabel2.text = @"77";
    _moneyLabel3.text = @"￥500";
    _orderNums.text = @"123456789";
    _sellerName.text = @"张三";
}
- (UIView *)lineView{
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UISeperatorColor;
    lineView.height = ONE_PIXEL;
    lineView.width = SCREEN_WIDTH;
    return lineView;
}
- (void)setContent:(NSArray *)arr{
    NSDictionary *dic = [arr firstObject];
    NSDictionary *dataDic = [arr lastObject];
    
    _companyLabel.text = [[dic[@"membInfo"] objectForKey:@"compFullName"] description];
    _personLabel.text = [NSString stringWithFormat:@"%@   %@", [NSString formateString:[dic[@"membInfo"] objectForKey:@"userName"]], [NSString formateString:[dic[@"membInfo"] objectForKey:@"contactMobile"]]];
    
    
    _titleLabel.attributedText = [self attributeString:[NSString stringWithFormat:@"   %@",[dic[@"commName"] description]] state:[[NSString formateString:dic[@"payMethType"]] isEqualToString:@"0"] ? DZPayState1: DZPayState2];
    _priceLabel.attributedText = [NSString priceStr:[dic[@"basePrice"]description] unitStr:[[dic objectForKey:@"measUnitName"]description]];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl,[dic[@"commPicture"] firstObject][@"fileUrl"]]]];
    
    _startNumsLabel.text = [NSString stringWithFormat:@"￥%@", dataDic[@"price"]];
    _buyNumsLabel.text = [NSString stringWithFormat:@"%@%@", dataDic[@"buyCount"], dataDic[@"measUnitName"]];
    _totalMoneyLabel.text = [NSString stringWithFormat:@"￥%@", dataDic[@"totalMoney"]];
    _moneyLabel1.text = [NSString stringWithFormat:@"￥%@", dataDic[@"buyerBail"]];
    _moneyLabel2.text = [NSString stringWithFormat:@"￥%@", dataDic[@"buyerSerCharge"]];
//    _moneyLabel3.text = 
    
}
- (NSMutableAttributedString *)attributeString:(NSString *)content state:(DZPayState)state{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:content];
    if (state == DZPayState1){
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"先款"];
        //        attach.bounds = CGRectMake(0, 0, 32, 16);
        NSAttributedString *attributeStr2 = [NSAttributedString attributedStringWithAttachment:attach];
        [attString insertAttributedString:attributeStr2 atIndex:0];
    }else if (state == DZPayState2){
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"预付"];
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
@end
