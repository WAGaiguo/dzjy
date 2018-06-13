//
//  DZMyInvoiceNormalCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/13.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceNormalCell.h"

@implementation DZMyInvoiceNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _invoiceView = [[DZMyInvoiceNormalView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48 * 3 + 7)];
        [_invoiceView setUnabled];
        [_invoiceView setPlaceholderNil];
        [self addSubview:_invoiceView];
        
        _editView = [[DZMyInvoiceEditView alloc]initWithFrame:CGRectMake(0, 48 * 2 + 1, SCREEN_WIDTH - 14, 47)];
        [_invoiceView.backV addSubview:_editView];
        WEAK_SELF
        [_editView setClickBlock:^(NSInteger integer) {
            if (me.tapBlock) {
                me.tapBlock(integer);
            }
        }];
    }
    return self;
}
- (void)setContent:(NSDictionary *)dic{
    [_invoiceView setContent:dic];
    [_editView setDefalut:[dic[@"defaultFlag"] isEqualToString:@"0"]];
}
- (void)afterView{
    
}

@end
