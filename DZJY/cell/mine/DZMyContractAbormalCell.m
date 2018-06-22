//
//  DZMyContractAbormalCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyContractAbormalCell.h"
#import "NSDate+Format.h"

@implementation DZMyContractAbormalCell
@synthesize backView;

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
    backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 223)];
    backView.backgroundColor = UIWhiteColor;
    [self addSubview:backView];
    [self first];
    [self second];
    [self third];
}
- (void)first{
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
    [backView addSubview:_stateLabel];
    
}
- (void)second{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = [UIColor seperatorColor];
    [backView addSubview:lineView];
    
    UILabel *shenqing = [[UILabel alloc]initWithFrame:CGRectMake(11, lineView.bottom + 10, 60, 13)];
    shenqing.font = [UIFont systemFontOfSize:12];
    shenqing.tintColor = UITitleColor;
    shenqing.text = @"申请处理:";
    [backView addSubview:shenqing];
    
    _applyTopLabel = [[UILabel alloc]initWithFrame:CGRectMake(shenqing.right, shenqing.top, SCREEN_WIDTH - 17 - shenqing.right, 13)];
    _applyTopLabel.font = [UIFont systemFontOfSize:12];
    _applyTopLabel.textColor = UISubTitleColor;
    [backView addSubview:_applyTopLabel];
    
    _applayBottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(_applyTopLabel.left, _applyTopLabel.bottom + 5, _applyTopLabel.width, 13)];
    _applayBottomLabel.font = [UIFont systemFontOfSize:12];
    _applayBottomLabel.textColor = UISubTitleColor;
    [backView addSubview:_applayBottomLabel];
    
    UILabel *yuanyin = [[UILabel alloc]initWithFrame:CGRectMake(11, shenqing.bottom + 26, 60, 13)];
    yuanyin.font = [UIFont systemFontOfSize:12];
    yuanyin.tintColor = UITitleColor;
    yuanyin.text = @"原因说明:";
    [backView addSubview:yuanyin];
    
    _reasonLabel = [[DZLeftTobLabel alloc]initWithFrame:CGRectMake(yuanyin.right, yuanyin.top, _applyTopLabel.width, 43)];
    _reasonLabel.numberOfLines = 0;
    _reasonLabel.textColor = UISubTitleColor;
    _reasonLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_reasonLabel];
    
    UILabel *hetong = [[UILabel alloc]initWithFrame:CGRectMake(11, yuanyin.bottom + 37, 60, 13)];
    hetong.font = [UIFont systemFontOfSize:12];
    hetong.tintColor = UITitleColor;
    hetong.text = @"合同商品:";
    [backView addSubview:hetong];
    _contractTopLabel = [[UILabel alloc]initWithFrame:CGRectMake(hetong.right, hetong.top, _applyTopLabel.width, 13)];
    _contractTopLabel.font = [UIFont systemFontOfSize:12];
    _contractTopLabel.textColor = UISubTitleColor;
    [backView addSubview:_contractTopLabel];
    _contractBottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(_contractTopLabel.left, _contractTopLabel.bottom + 5, _contractTopLabel.width, 13)];
    _contractBottomLabel.textColor = UISubTitleColor;
    _contractBottomLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_contractBottomLabel];
}
- (void)third{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 175, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = [UIColor seperatorColor];
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

- (void)setContent:(NSDictionary *)dic{
    _timeLabel.text = [NSString stringWithFormat:@"申请时间：%@", [NSDate timestampToTime:dic[@"propDate"]]];
    _applyTopLabel.text = [dic[@"treatResltType"] isEqualToString:@"0"] ? @"合同结束，有违约金":@"合同结束，无违约金";
    NSString *buyOrSell = [dic[@"buySellFlag2"] isEqualToString:@"0"]?@"买方；":@"卖方；";
    if ([dic[@"treatResltType"] isEqualToString:@"1"]) {
        buyOrSell = @" 无；";
    }
    NSString *dedit = [dic[@"liquDama"] isEqual:[NSNull null]] ? @"0" : dic[@"liquDama"];
    _applayBottomLabel.attributedText = [self addColor: [NSString stringWithFormat:@"违约方：%@违约金：%@", buyOrSell, dedit]];
    
    _reasonLabel.text = dic[@"endReason"];
    _contractTopLabel.text = dic[@"commName"];
    _contractBottomLabel.text = [NSString stringWithFormat:@"￥%@*%@%@，共计：￥%@",dic[@"price"],dic[@"buyCount"],dic[@"measUnitName"],dic[@"totalMoney"]];
    _companyLabel.text = dic[@"sellerName"];
    [self setTypeStr:dic[@"termiContStateType"]];
}

- (NSString *)isNull:(NSString *)str{
    if ([str isEqual:[NSNull null]]) {
        return @"";
    }
    return str;
}

- (NSMutableAttributedString *)addColor:(NSString *)str{
    NSMutableAttributedString *colorStr = [[NSMutableAttributedString alloc]initWithString:str];
    [colorStr addAttribute:NSForegroundColorAttributeName value:UICommonColor range:NSMakeRange(4, 2)];
    [colorStr addAttribute:NSForegroundColorAttributeName value:UICommonColor range:NSMakeRange(11, str.length - 11)];
    return colorStr;
}

- (void)setTypeStr:(NSString *)type{
    if ([type isEqualToString:@"0"]) {
        _stateLabel.text = @"取消";
    }else if ([type isEqualToString:@"1"]){
        _stateLabel.text = @"完成";
    }else if ([type isEqualToString:@"2"]){
        _stateLabel.text = @"待卖方确认";
    }else if ([type isEqualToString:@"3"]){
        _stateLabel.text = @"拒绝";
    }else if ([type isEqualToString:@"4"]){
        _stateLabel.text = @"待买方确认";
    }
}
@end

@implementation DZLeftTobLabel
- (id)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    textRect.origin.y = bounds.origin.y;
    return textRect;
}
-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end

