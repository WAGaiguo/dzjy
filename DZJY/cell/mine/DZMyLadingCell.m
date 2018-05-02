//
//  DZMyLadingCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyLadingCell.h"

@implementation DZMyLadingCell
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
        backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 223)];
        backView.backgroundColor = UIWhiteColor;
        [self addSubview:backView];
        self.backgroundColor = UIBackgroundColor;
        [self first];
        [self second];
        [self third];
    }
    return self;
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
    _stateLabel.right = backView.width - 10 ;
    _stateLabel.centerY = 17.5;
    _stateLabel.textAlignment = NSTextAlignmentRight;
    [backView addSubview:_stateLabel];
}
- (void)second{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = [UIColor seperatorColor];
    [backView addSubview:lineView];
    
    NSInteger dz_top = lineView.bottom;
    
    UILabel *label1 = [self commonLabel: dz_top + 14 text:@"提单商品:"];
    [backView addSubview:label1];
    _titleLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(label1.right + 10, label1.top, backView.width - 85, 13)];
    _titleLabel1.font = [UIFont systemFontOfSize:12];
    _titleLabel1.textColor = [UIColor colorWithHex:@"666666"];
    [backView addSubview:_titleLabel1];
    _titleLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(75, _titleLabel1.bottom + 4, _titleLabel1.width, 13)];
    _titleLabel2.font = [UIFont systemFontOfSize:12];
    _titleLabel2.textColor = [UIColor colorWithHex:@"666666"];
    [backView addSubview:_titleLabel2];
    
    UILabel *label2 = [self commonLabel:dz_top + 52 text:@"配送方式:"];
    [backView addSubview:label2];
    _methodsLabel = [[UILabel alloc]initWithFrame:CGRectMake(label2.right + 10, label2.top, backView.width - 85, 13)];
    _methodsLabel.font = [UIFont systemFontOfSize:12];
    _methodsLabel.textColor = [UIColor colorWithHex:@"666666"];
    [backView addSubview:_methodsLabel];
    
    UILabel *label3 = [self commonLabel:label2.bottom + 8 text:@"详细地址:"];
    [backView addSubview:label3];
    _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(label3.right + 10, label3.top, backView.width - 85, 13)];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    _addressLabel.textColor = [UIColor colorWithHex:@"666666"];
    [backView addSubview:_addressLabel];
    
    UILabel *label4 = [self commonLabel:label3.bottom + 8 text:@"提货人:"];
    [backView addSubview:label4];
    _personLabel = [[UILabel alloc]initWithFrame:CGRectMake(label4.right + 10, label4.top, backView.width - 85, 13)];
    _personLabel.font = [UIFont systemFontOfSize:12];
    _personLabel.textColor = [UIColor colorWithHex:@"666666"];
    [backView addSubview:_personLabel];
    
    UILabel *label5 = [self commonLabel:label4.bottom + 8 text:@"车辆信息:"];
    [backView addSubview:label5];
    _carLabel = [[UILabel alloc]initWithFrame:CGRectMake(label5.right + 10, label5.top, backView.width - 85, 13)];
    _carLabel.font = [UIFont systemFontOfSize:12];
    _carLabel.textColor = [UIColor colorWithHex:@"666666"];
    [backView addSubview:_carLabel];
}
- (UILabel *)commonLabel:(CGFloat)top text:(NSString *)text{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor colorWithHex:@"333333"];
    label.textAlignment = NSTextAlignmentRight;
    label.width = 65;
    label.height = 13;
    label.left = 0;
    label.top = top;
    label.text = text;
    return label;
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
        [HudUtils showMessage:@"打电话测试"];
        if (_callBlock) {
            _callBlock();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [self test];
}
- (void)test{
    _timeLabel.text = @"2018-5-1";
    _stateLabel.text = @"待打印";
    _titleLabel1.text = @"荷兰土豆";
    _titleLabel2.text = @"￥2.0*1000公斤";
    _methodsLabel.text = @"买家自提";
    _addressLabel.text = @"银川市";
    _personLabel.text = @"momomo";
    _carLabel.text = @"冀A-666666";
    _companyLabel.text = @"联信智源";
}
@end
