//
//  DZOrderConfirmCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderConfirmCell.h"
#import <YYAnimatedImageView.h>
#import <NSString+YYAdd.h>
#import <NSAttributedString+YYText.h>

@implementation DZOrderConfirmCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self first];
        [self second];
        [self third];
        [self fouth];
    }
    return self;
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
    
    _companyLabel.text = @"公司公司";
    _personLabel.text = @"123456789000 alsjdf";
    
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
    
    _titleLabel.attributedText = [self attributeString:@"  No爱家of金额欧文IE奇偶发Joe鸡尾酒；而非叫我IE减肥 哦微积分" state:DZPayStateAll];
    _priceLabel.text = @"￥555.555";
    _imageV.backgroundColor = UICyanColor;
}
- (void)third{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(13, 192, 150, 37)];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithHex:@"555555"];
    label1.text = @"起订量:";
    [self addSubview:label1];
    _startNumsLabel = [[UILabel alloc]initWithFrame:CGRectMake(label1.right, label1.top, SCREEN_WIDTH - label1.right - 13, 37)];
    _startNumsLabel.textAlignment = NSTextAlignmentRight;
    _startNumsLabel.textColor = [UIColor colorWithHex:@"333333"];
    [self addSubview:_startNumsLabel];
    UIView *lineView1 = [self lineView];
    lineView1.top = label1.bottom;
    [self addSubview:lineView1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineView1.bottom, 150, 37)];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor colorWithHex:@"555555"];
    label2.text = @"可购买量:";
    [self addSubview:label2];
    _buyNumsLabel = [[UILabel alloc]initWithFrame:CGRectMake(label2.right , label2.top, SCREEN_WIDTH - label2.right - 13, 37)];
    _buyNumsLabel.textAlignment = NSTextAlignmentRight;
    _buyNumsLabel.textColor = [UIColor colorWithHex:@"333333"];
    [self addSubview:_buyNumsLabel];
    UIView *lineView2 = [self lineView];
    lineView2.top = _buyNumsLabel.bottom;
    [self addSubview:lineView2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineView2.bottom, 150, 37)];
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = [UIColor colorWithHex:@"555555"];
    label3.text = @"购买量:";
    [self addSubview:label3];
    UIView *lineView3 = [self lineView];
    lineView3.top = label3.bottom;
    [self addSubview:lineView3];
    _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(SCREEN_WIDTH - 167, label3.top + 2.5, 150, 32)];
    _numberButton.shakeAnimation = YES;
    _numberButton.minValue = 1;
    _numberButton.maxValue = 10;
    _numberButton.increaseTitle = @"+";
    _numberButton.decreaseTitle = @"-";
    _numberButton.borderColor = UISeperatorColor;
    _numberButton.currentNumber = 5;
    [self addSubview:_numberButton];
    [_numberButton setResultBlock:^(PPNumberButton *ppBtn, CGFloat number, BOOL increaseStatus) {
        NSLog(@"%f",number);
    }];
    
    UIView *lineView7 = [[UIView alloc]initWithFrame:CGRectMake(0, lineView3.bottom + 20, SCREEN_WIDTH, 7)];
    lineView7.backgroundColor = UIBackgroundColor;
    lineView7.tag = 77;
    [self addSubview:lineView7];
    
    _startNumsLabel.text = @"1000";
    _buyNumsLabel.text = @"10000";
    
}
- (void)fouth{
    UIView *lineView7 = [self viewWithTag:77];
    [self commenLabel:@"贷款合金额:" frame:CGRectMake(SCREEN_WIDTH/2.0, lineView7.bottom + 2, SCREEN_WIDTH/4.0, 33)];
    [self commenLabel:@"需交保证金:" frame:CGRectMake(SCREEN_WIDTH/2.0, lineView7.bottom + 35, SCREEN_WIDTH/4.0, 33)];
    [self commenLabel:@"需交手续费:" frame:CGRectMake(SCREEN_WIDTH/2.0, lineView7.bottom + 67, SCREEN_WIDTH/4.0, 33)];
    
    _money1abel = [self moneyCommenLabel:CGRectMake(SCREEN_WIDTH/4 * 3 - 13, lineView7.bottom + 2, SCREEN_WIDTH/4.0, 33)];
    [self addSubview:_money1abel];
    _money2Label = [self moneyCommenLabel:CGRectMake(SCREEN_WIDTH/4 * 3 - 13, lineView7.bottom + 35, SCREEN_WIDTH/4.0, 33)];
    [self addSubview:_money2Label];
    _money3Label = [self moneyCommenLabel:CGRectMake(SCREEN_WIDTH/4 * 3 - 13, lineView7.bottom + 67, SCREEN_WIDTH/4.0, 33)];
    [self addSubview:_money3Label];
}
- (void)commenLabel:(NSString *)nameStr frame:(CGRect)frame{
    UILabel *label1 = [[UILabel alloc]initWithFrame:frame];
    label1.font = [UIFont systemFontOfSize:13];
    label1.textColor = [UIColor colorWithHex:@"333333"];
    label1.text = nameStr;
    [self addSubview:label1];
}
- (UILabel *)moneyCommenLabel:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = [UIColor colorWithHex:@"fe5200"];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textAlignment = NSTextAlignmentRight;
    label.text = @"￥500000";
    return label;
}
- (UIView *)lineView{
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UISeperatorColor;
    lineView.height = ONE_PIXEL;
    lineView.width = SCREEN_WIDTH;
    return lineView;
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
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
}

@end