//
//  DZMyDeliveryAbnormalCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/15.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyDeliveryAbnormalCell.h"
#import "NSDate+Format.h"

@implementation DZMyDeliveryAbnormalCell
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
    backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 290)];
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
    shenqing.textColor = UITitleColor;
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
    
    UILabel *objectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, _applayBottomLabel.bottom + 7, 60, 13)];
    objectionLabel.font = [UIFont systemFontOfSize:12];
    objectionLabel.textColor = UITitleColor;
    objectionLabel.text = @"异议类型:";
    [backView addSubview:objectionLabel];
    
    _objectionTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(objectionLabel.right, objectionLabel.top, SCREEN_WIDTH - 17 - shenqing.right, 13)];
    _objectionTypeLabel.font = [UIFont systemFontOfSize:12];
    _objectionTypeLabel.textColor = UISubTitleColor;
    [backView addSubview:_objectionTypeLabel];
    
    UILabel *yuanyin = [[UILabel alloc]initWithFrame:CGRectMake(11, objectionLabel.bottom + 7, 60, 13)];
    yuanyin.font = [UIFont systemFontOfSize:12];
    yuanyin.tintColor = UITitleColor;
    yuanyin.text = @"原因说明:";
    [backView addSubview:yuanyin];
    
    _reasonLabel = [[DZLeftTob2Label alloc]initWithFrame:CGRectMake(yuanyin.right, yuanyin.top, _applyTopLabel.width, 43)];
    _reasonLabel.numberOfLines = 0;
    _reasonLabel.textColor = UISubTitleColor;
    _reasonLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_reasonLabel];
    
    _imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(_reasonLabel.left, _reasonLabel.bottom + 7, 45, 45)];
    [backView addSubview:_imageV1];
    _imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(_imageV1.right + 7, _imageV1.top, 45, 45)];
    [backView addSubview:_imageV2];
    _imageV3 = [[UIImageView alloc]initWithFrame:CGRectMake(_imageV2.right + 7, _imageV2.top, 45, 45)];
    [backView addSubview:_imageV3];
    _imageV4 = [[UIImageView alloc]initWithFrame:CGRectMake(_imageV3.right + 7 , _imageV3.top, 45, 45)];
    [backView addSubview:_imageV4];
    _imageV5 = [[UIImageView alloc]initWithFrame:CGRectMake(_imageV4.right + 7, _imageV4.top, 45, 45)];
    [backView addSubview:_imageV5];
    
    UILabel *hetong = [[UILabel alloc]initWithFrame:CGRectMake(11, _imageV1.bottom + 7, 60, 13)];
    hetong.font = [UIFont systemFontOfSize:12];
    hetong.tintColor = UITitleColor;
    hetong.text = @"交收商品:";
    [backView addSubview:hetong];
    _contractTopLabel = [[UILabel alloc]initWithFrame:CGRectMake(hetong.right, hetong.top, _applyTopLabel.width, 13)];
    _contractTopLabel.font = [UIFont systemFontOfSize:12];
    _contractTopLabel.textColor = UISubTitleColor;
    [backView addSubview:_contractTopLabel];
    
    UILabel *shifa = [[UILabel alloc]initWithFrame:CGRectMake(11, hetong.bottom + 5, 53, 13)];
    shifa.text = @"实发:";
    shifa.textAlignment = NSTextAlignmentRight;
    shifa.font = [UIFont systemFontOfSize:12];
    shifa.textColor = UITitleColor;
    [backView addSubview:shifa];
    _contractBottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(_contractTopLabel.left, _contractTopLabel.bottom + 5, _contractTopLabel.width, 13)];
    _contractBottomLabel.textColor = UISubTitleColor;
    _contractBottomLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:_contractBottomLabel];
}
- (void)third{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 246, SCREEN_WIDTH - 14, ONE_PIXEL)];
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
    _timeLabel.text = [NSDate timestampToTime:[dic objectForKey:@"propDate"]];
    [self stateType:dic[@"examCommDissState"]];
    NSString *shenqing1 = [dic[@"dissTreatResltType"] isEqualToString:@"0"] ? @"交收单继续":@"解除交收单";
    NSString *shenqing2 = [NSDate timestampToCommonTime: [dic[@"examCommDeadLine"] description]];
    _applyTopLabel.text = [NSString stringWithFormat:@"%@,于%@前重新验货；",shenqing1,shenqing2];
    NSString *buyOrSell = [dic[@"buySellFlag2"] isEqualToString:@"0"]?@"买方":@"卖方";
    _applayBottomLabel.attributedText = [self addColor: [NSString stringWithFormat:@"违约方：%@；违约金：%@", buyOrSell, dic[@"liquDama"]]];
    _objectionTypeLabel.text = [[dic[@"dissType"] description] isEqualToString:@"0"] ? @"未到货":@"货有问题";
    _reasonLabel.text = [dic objectForKey:@"probDesc"];
    _contractTopLabel.text = [dic[@"commName"] description];
    _contractBottomLabel.text = [NSString stringWithFormat:@"￥%@*%@%@，共计：￥%@",dic[@"price"],dic[@"buyCount"],dic[@"measUnitName"],dic[@"totalMoney"]];
    _companyLabel.text = dic[@"sellerName"];
    _companyLabel.text = [dic[@"sellerName"] description];
    [self addImage:dic[@"fileUrls"]];

}
- (void)stateType:(NSString *)type{
    if ([type isEqualToString:@"0"]) {
        _stateLabel.text = @"卖方拒绝";
    }else if ([type isEqualToString:@"1"]){
        _stateLabel.text = @"完成";
    }else if ([type isEqualToString:@"2"]){
        _stateLabel.text = @"买方取消";
    }else if ([type isEqualToString:@"3"]){
        _stateLabel.text = @"强制取消";
    }else if ([type isEqualToString:@"4"]){
        _stateLabel.text = @"待买方确认";
    }
}
- (NSMutableAttributedString *)addColor:(NSString *)str{
    NSMutableAttributedString *colorStr = [[NSMutableAttributedString alloc]initWithString:str];
    [colorStr addAttribute:NSForegroundColorAttributeName value:UICommonColor range:NSMakeRange(4, 2)];
    [colorStr addAttribute:NSForegroundColorAttributeName value:UICommonColor range:NSMakeRange(11, str.length - 11)];
    return colorStr;
}
- (void)addImage:(NSArray *)arr{
    if ([arr isKindOfClass:[NSNull class]]) {
        _imageV1.backgroundColor = UIGrayColor;
        return;
    }else{
        [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 0) {
                [_imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl,obj[@"fileUrl"]]]];
            }else if (idx == 1){
                [_imageV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl,obj[@"fileUrl"]]]];
            }else if (idx == 2){
                [_imageV3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl,obj[@"fileUrl"]]]];
            }else if (idx == 3){
                [_imageV4 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl,obj[@"fileUrl"]]]];
            }else if (idx == 4){
                [_imageV5 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DZCommonUrl,obj[@"fileUrl"]]]];
            }
        }];
    }
}
- (void)test{
    _stateLabel.text = [NSString stringWithFormat:@"%@", @"待双发支付"];
    _timeLabel.text = [NSString stringWithFormat:@"申请时间: %@",@"2018-04-20 10:18:00"];
    _companyLabel.text = @"联信智源公司";
    _applyTopLabel.text = @"合同合同，合同";
    _applayBottomLabel.text = @"违约方";
    _reasonLabel.text = @"合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同合同合同，合同";
    _contractTopLabel.text = @"合同合同，合同合同合同，合同";
    _contractBottomLabel.text = @"合同合同，合同合同合同，合";
    _imageV5.backgroundColor = _imageV1.backgroundColor = UICyanColor;
}
@end

@implementation DZLeftTob2Label
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
