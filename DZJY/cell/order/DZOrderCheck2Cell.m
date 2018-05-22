//
//  DZOrderCheck2Cell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCheck2Cell.h"

@implementation DZOrderCheck2Cell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UI666666Color;
    label.text = @"交收信息";
    label.backgroundColor = UIBackgroundColor;
    [self addSubview:label];
    [self first];
}
- (void)first{
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(13, 40, 67, 25)];
    lab1.font = [UIFont systemFontOfSize:15];
    lab1.textColor = UI666666Color;
    lab1.text = @"品类:";
    lab1.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab1];
    _label1 = [[UILabel alloc]initWithFrame:CGRectMake(lab1.right + 8, lab1.top, SCREEN_WIDTH - lab1.width - 26, 25)];
    _label1.textColor = UITitleColor;
    _label1.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label1];
    
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(13, lab1.bottom, 67, 25)];
    lab2.font = [UIFont systemFontOfSize:15];
    lab2.textColor = UI666666Color;
    lab2.text = @"品种:";
    lab2.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab2];
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(lab2.right + 8, lab2.top, SCREEN_WIDTH - lab2.width - 26, 25)];
    _label2.textColor = UITitleColor;
    _label2.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label2];
    
    UILabel *lab3 = [[UILabel alloc]initWithFrame:CGRectMake(13, lab2.bottom, 67, 25)];
    lab3.font = [UIFont systemFontOfSize:15];
    lab3.textColor = UI666666Color;
    lab3.text = @"商品名称:";
    lab3.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab3];
    _label3 = [[UILabel alloc]initWithFrame:CGRectMake(lab3.right + 8, lab3.top, SCREEN_WIDTH - lab3.width - 26, 25)];
    _label3.textColor = UITitleColor;
    _label3.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label3];
    
    UIView *lineV1 = [self lineView];
    lineV1.top = _label3.bottom + 7;
    [self addSubview:lineV1];
    
    UILabel *lab4 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineV1.bottom + 7, 67, 25)];
    lab4.font = [UIFont systemFontOfSize:15];
    lab4.textColor = UI666666Color;
    lab4.text = @"交收方式:";
    lab4.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab4];
    _label4 = [[UILabel alloc]initWithFrame:CGRectMake(lab4.right + 8, lab4.top, SCREEN_WIDTH - lab4.width - 26, 25)];
    _label4.textColor = UITitleColor;
    _label4.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label4];
    
    UILabel *lab5 = [[UILabel alloc]initWithFrame:CGRectMake(13, lab4.bottom, 67, 25)];
    lab5.font = [UIFont systemFontOfSize:15];
    lab5.textColor = UI666666Color;
    lab5.text = @"计量单位:";
    lab5.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab5];
    _label5 = [[UILabel alloc]initWithFrame:CGRectMake(lab5.right + 8, lab5.top, SCREEN_WIDTH - lab5.width - 26, 25)];
    _label5.textColor = UITitleColor;
    _label5.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label5];
    
    UIView *lineV2 = [self lineView];
    lineV2.top = _label5.bottom + 7;
    [self addSubview:lineV2];
    
    UILabel *lab6 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineV2.bottom + 7, 67, 25)];
    lab6.font = [UIFont systemFontOfSize:15];
    lab6.textColor = UI666666Color;
    lab6.text = @"配送方式:";
    lab6.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab6];
    _label6 = [[UILabel alloc]initWithFrame:CGRectMake(lab6.right + 8, lab6.top, SCREEN_WIDTH - lab6.width - 26, 25)];
    _label6.textColor = UITitleColor;
    _label6.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label6];
    
    UILabel *lab7 = [[UILabel alloc]initWithFrame:CGRectMake(13, lab6.bottom, 67, 25)];
    lab7.font = [UIFont systemFontOfSize:15];
    lab7.textColor = UI666666Color;
    lab7.text = @"存货地:";
    lab7.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab7];
    _label7 = [[UILabel alloc]initWithFrame:CGRectMake(lab7.right + 8, lab7.top, SCREEN_WIDTH - lab7.width - 26, 25)];
    _label7.textColor = UITitleColor;
    _label7.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label7];
    
    UILabel *lab8 = [[UILabel alloc]initWithFrame:CGRectMake(13, lab7.bottom, 67, 25)];
    lab8.font = [UIFont systemFontOfSize:15];
    lab8.textColor = UI666666Color;
    lab8.text = @"详细地址:";
    lab8.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab8];
    _label8 = [[UILabel alloc]initWithFrame:CGRectMake(lab8.right + 8, lab8.top, SCREEN_WIDTH - lab8.width - 26, 25)];
    _label8.textColor = UITitleColor;
    _label8.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label8];
    
    UIView *lineV3 = [self lineView];
    lineV3.top = lab8.bottom + 7;
    [self addSubview:lineV3];
    
    UILabel *lab9 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineV3.bottom + 7, 67, 25)];
    lab9.font = [UIFont systemFontOfSize:15];
    lab9.textColor = UI666666Color;
    lab9.text = @"争议处理:";
    lab9.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab9];
    _label9 = [[UILabel alloc]initWithFrame:CGRectMake(lab9.right + 8, lab9.top, SCREEN_WIDTH - lab9.width - 26, 25)];
    _label9.textColor = UITitleColor;
    _label9.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label9];
    
    UILabel *lab10 = [[UILabel alloc]initWithFrame:CGRectMake(13, lab9.bottom, 67, 25)];
    lab10.font = [UIFont systemFontOfSize:15];
    lab10.textColor = UI666666Color;
    lab10.text = @"发票方式:";
    lab10.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab10];
    _label10 = [[UILabel alloc]initWithFrame:CGRectMake(lab10.right + 8, lab10.top, SCREEN_WIDTH - lab10.width - 26, 25)];
    _label10.textColor = UITitleColor;
    _label10.font = [UIFont systemFontOfSize:15];
    [self addSubview:_label10];
    
    UIView *lineV4 = [self lineView];
    lineV4.top = lab10.bottom + 7;
    [self addSubview:lineV4];
    
    UILabel *lab11 = [[UILabel alloc]initWithFrame:CGRectMake(13, lineV4.bottom + 7, 67, 25)];
    lab11.font = [UIFont systemFontOfSize:15];
    lab11.textColor = UI666666Color;
    lab11.text = @"补充说明:";
    lab11.textAlignment = NSTextAlignmentRight;
    [self addSubview:lab11];
    _label11 = [[UILabel alloc]initWithFrame:CGRectMake(lab11.right + 8, lab11.top, SCREEN_WIDTH - lab11.width - 26, 37)];
    _label11.textColor = UITitleColor;
    _label11.font = [UIFont systemFontOfSize:15];
    _label11.numberOfLines = 2;
    [self addSubview:_label11];
    
    [self test];
}
- (UIView *)lineView{
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UISeperatorColor;
    lineView.height = ONE_PIXEL;
    lineView.width = SCREEN_WIDTH - 10;
    lineView.left = 10;
    return lineView;
}
- (void)test{
    _label1.text = _label2.text = _label5.text = @"蔬菜";
    _label11.text = @"蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜蔬菜";
}
- (void)setContent:(NSDictionary *)dic{
    
}
@end
