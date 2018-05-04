//
//  DZMyAddressCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyAddressCell.h"

@interface DZMyAddressCell(){
    UIView *backV;
}
@end

@implementation DZMyAddressCell

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
    backV = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 166)];
    backV.backgroundColor = UIWhiteColor;
    [self addSubview:backV];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 0, 50, 48)];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.textColor = UI333333Color;
    [backV addSubview:_nameLabel];
    
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(_nameLabel.right, 0, 180, 48)];
    _phoneLabel.font = [UIFont systemFontOfSize:13];
    _phoneLabel.textColor = UI666666Color;
    [backV addSubview:_phoneLabel];
    [self lineView:48];
    
    _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 49, SCREEN_WIDTH - 36, 68)];
    _addressLabel.font = [UIFont systemFontOfSize:13];
    _addressLabel.textColor = UI333333Color;
    _addressLabel.numberOfLines = 2;
    [backV addSubview:_addressLabel];
    [self lineView:_addressLabel.bottom - 1];
    
    _editView = [[DZMyInvoiceEditView alloc]initWithFrame:CGRectMake(0, 117, SCREEN_WIDTH - 14, 47)];
    [backV addSubview:_editView];
    WEAK_SELF
    [_editView setClickBlock:^(NSInteger integer) {
        if (me.tapBlock) {
            me.tapBlock(integer);
        }
    }];
    
    [self test];
}
- (void)test{
    _nameLabel.text = @"张三三";
    _phoneLabel.text = @"15501281444";
    _addressLabel.attributedText = [self mutableStr:@"北京市朝阳区海淀区丰台区西城区东城区大兴区各种区你好啊"];
}
- (void)lineView:(CGFloat)top{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, top, SCREEN_WIDTH - 14, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [backV addSubview:lineView];
}
// 行间距设置：：：
- (NSMutableAttributedString *)mutableStr:(NSString *)string{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:10];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    return attributedString;
}
@end
