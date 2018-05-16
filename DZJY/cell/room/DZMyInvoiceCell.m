//
//  DZMyInvoiceCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceCell.h"

@implementation DZMyInvoiceCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _invoiceView = [[DZMyInvoiceView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 343)];
        [_invoiceView setUnabled];
        [_invoiceView setPlaceholderNil];
        [self addSubview:_invoiceView];
        
        _editView = [[DZMyInvoiceEditView alloc]initWithFrame:CGRectMake(0, 48 * 6 + 1, SCREEN_WIDTH - 14, 47)];
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
}
- (void)afterView{
    
}
@end
