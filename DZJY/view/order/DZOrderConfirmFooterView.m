//
//  DZOrderConfirmFooterView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderConfirmFooterView.h"

@implementation DZOrderConfirmFooterView

-(instancetype)init{
    self = [super init];
    if(self){
        [self setHeight:122];
        [self setWidth:SCREEN_WIDTH];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 26)];
        label.text = @"正常交易流程";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithHex:@"777777"];
        label.font = [UIFont systemFontOfSize:15];
        [self addSubview:label];
        [self configFourItem];
    }
    return self;
}

- (void)configFourItem{
    DZOrderConfirmFooterItemView *item1 = [[DZOrderConfirmFooterItemView alloc]initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH/4.0, 65)];
    item1.imageV.image = [UIImage imageNamed:@"支付"];
    item1.label1.attributedText = [self attString:@"支付保证金" isFirst:YES];
    item1.label1.top = item1.imageV.bottom + 12;
    item1.label2.top = item1.label1.bottom + 1;
    item1.label2.text = @"生成合同";
    [self addSubview:item1];
    
    DZOrderConfirmFooterItemView *item2 = [[DZOrderConfirmFooterItemView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4.0, 35, SCREEN_WIDTH/4.0, 87)];
    item2.imageV.image = [UIImage imageNamed:@"交收"];
    item2.label1.attributedText = [self attString:@"发起交收" isFirst:NO];
    item2.label2.text = @"支付货款";
    item2.label3.text = @"平台监管";
    [self addSubview:item2];
    
    DZOrderConfirmFooterItemView *item3 = [[DZOrderConfirmFooterItemView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0, 35, SCREEN_WIDTH/4.0, 87)];
    item3.imageV.image = [UIImage imageNamed:@"验货"];
    item3.label1.attributedText = [self attString:@"确认验货" isFirst:NO];
    item3.label2.text = @"解冻货款";
    item3.label3.text = @"付给卖家";
    [self addSubview:item3];
    
    DZOrderConfirmFooterItemView *item4 = [[DZOrderConfirmFooterItemView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4.0 * 3, 35, SCREEN_WIDTH/4.0, 87)];
    item4.imageV.image = [UIImage imageNamed:@"验票"];
    item4.label1.attributedText = [self attString:@"确认验票" isFirst:NO];
    item4.label2.text = @"解冻货款";
    item4.label3.text = @"付给卖家";
    [self addSubview:item4];
}

- (NSMutableAttributedString *)attString:(NSString *)string isFirst:(BOOL)first{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:string];
    if (first){
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:@"fe5300"] range:NSMakeRange(0, 2)];
    }else{
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:@"fe5300"] range:NSMakeRange(string.length - 2, 2)];
    }
    return attString;
}

@end




@implementation DZOrderConfirmFooterItemView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        _imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"支付"]];
        _imageV.top = 5;
        _imageV.width = 34;
        _imageV.height = 34;
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
        _imageV.centerX = SCREEN_WIDTH/8.0;
        [self addSubview:_imageV];
        
        _label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, _imageV.bottom + 8, SCREEN_WIDTH/4.0, 13)];
        _label1.font = [UIFont systemFontOfSize:12];
        _label1.textColor = [UIColor colorWithHex:@"666666"];
        _label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label1];
        
        _label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, _label1.bottom + 1, SCREEN_WIDTH/4.0, 13)];
        _label2.font = [UIFont systemFontOfSize:12];
        _label2.textColor = [UIColor colorWithHex:@"666666"];
        _label2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label2];
        
        _label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, _label2.bottom + 1, SCREEN_WIDTH/4.0, 13)];
        _label3.font = [UIFont systemFontOfSize:12];
        _label3.textColor = [UIColor colorWithHex:@"666666"];
        _label3.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label3];
        
    }
    return self;
}
@end
