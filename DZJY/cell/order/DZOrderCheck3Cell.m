//
//  DZOrderCheck3Cell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCheck3Cell.h"

@implementation DZOrderCheck3Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UI666666Color;
        label.text = @"合同信息";
        label.backgroundColor = UIBackgroundColor;
        [self addSubview:label];
        UIView *lineV = [self lineView];
        lineV.top = 43 - ONE_PIXEL;
        [self addSubview:lineV];
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _label1 = [self labelContent:CGRectMake(135, 43, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label1];
    _label2 = [self labelContent:CGRectMake(135, 43 + 30 * 1, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label2];
    _label3 = [self labelContent:CGRectMake(135, 43 + 30 * 2, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label3];
    _label4 = [self labelContent:CGRectMake(135, 43 + 30 * 3, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label4];
    _label5 = [self labelContent:CGRectMake(135, 43 + 30 * 4, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label5];
    _label6 = [self labelContent:CGRectMake(135, 43 + 30 * 5, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label6];
    _label7 = [self labelContent:CGRectMake(135, 43 + 30 * 6, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label7];
    _label8 = [self labelContent:CGRectMake(135, 43 + 30 * 7, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label8];
    _label9 = [self labelContent:CGRectMake(135, 43 + 30 * 8, SCREEN_WIDTH - 144, 30)];
    [self addSubview:_label9];
    
    
    NSArray *arr = @[@"付款方式",@"买方保证金",@"卖方保证金",@"验货后付款",@"保证金截止日",@"发货截止日",@"付款截止日",@"验货截止日",@"验票截止日"];
    [arr enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [self labelFactory:CGRectMake(25, 43 + idx * 30, 90, 30)];
        label.text = obj;
        [self addSubview:label];
        UIView *lineV = [self lineView];
        lineV.bottom = label.bottom;
        [self addSubview:lineV];
    }];
    UIView *vertical1 = [self verticalLine];
    vertical1.left = 7;
    [self addSubview:vertical1];
    UIView *vertical2 = [self verticalLine];
    vertical2.left = 122;
    [self addSubview:vertical2];
    UIView *vertical3 = [self verticalLine];
    vertical3.left = SCREEN_WIDTH - 7;
    [self addSubview:vertical3];
    
    [self test];
}
- (UILabel *)labelFactory:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = UI666666Color;
    return label;
}
- (UILabel *)labelContent:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = UITitleColor;
    return label;
}
- (UIView *)lineView{
    UIView *lineV = [[UIView alloc]init];
    lineV.backgroundColor = UISeperatorColor;
    lineV.width = SCREEN_WIDTH - 14;
    lineV.height = ONE_PIXEL;
    lineV.left = 7;
    return lineV;
}
- (UIView *)verticalLine{
    UIView *lineV = [[UIView alloc]init];
    lineV.backgroundColor = UISeperatorColor;
    lineV.width = ONE_PIXEL;
    lineV.height = 270;
    lineV.top = 43;
    return lineV;
}
- (void)test{
    _label5.backgroundColor = UICyanColor;
    _label2.text = _label1.text = _label5.text = @"订单点单点单点单";
}
- (void)setContent:(NSDictionary *)dic{
    
}
@end
