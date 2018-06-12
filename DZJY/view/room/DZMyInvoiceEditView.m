//
//  DZMyInvoiceEditView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyInvoiceEditView.h"

@implementation DZMyInvoiceEditView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _isAddress = NO;
        
        _selectBtn = [self button:@"默认发票" image:@"选中" integer:1];
        _selectBtn.width = 90;
        _selectBtn.height = 47;
        _selectBtn.left = 0;
        [self addSubview:_selectBtn];
        
        _deleteBtn = [self button:@"删除" image:@"删除" integer:3];
        _deleteBtn.right = frame.size.width - 60;
        _deleteBtn.width = 60;
        _deleteBtn.top = 0;
        _deleteBtn.height = 47;
        [self addSubview:_deleteBtn];
        
        _editBtn = [self button:@"编辑" image:@"编辑" integer:2];
        _editBtn.right = _deleteBtn.left - 60;
        _editBtn.top = 0;
        _editBtn.width = 60;
        _editBtn.height = 47;
        [self addSubview:_editBtn];
    }
    return self;
}
- (UIButton *)button:(NSString *)text image:(NSString *)image integer:(NSInteger)integer{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:UI555555Color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -10, 0.0, 0.0)];
    [btn bk_addEventHandler:^(id sender) {
        if (_clickBlock) {
            _clickBlock(integer);
        }
    } forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (void)setDefalut:(BOOL)isDefalut{
    if (isDefalut) {
        [_selectBtn setTitle:@"默认发票" forState:UIControlStateNormal];
        if (_isAddress) {
            [_selectBtn setTitle:@"默认地址" forState:UIControlStateNormal];
        }
        [_selectBtn setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    }else{
        [_selectBtn setTitle:@"设为默认" forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    }
}
- (void)setIsAddress:(BOOL)isAddress{
    _isAddress = isAddress;
    if (_isAddress) {
        [_selectBtn setTitle:@"默认地址" forState:UIControlStateNormal];
    }else{
        [_selectBtn setTitle:@"默认地址" forState:UIControlStateNormal];
    }
}
@end
