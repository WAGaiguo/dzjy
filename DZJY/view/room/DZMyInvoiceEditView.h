//
//  DZMyInvoiceEditView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyInvoiceEditView : UIView
@property (nonatomic, strong)UIButton *selectBtn;
@property (nonatomic, strong)UIButton *editBtn;
@property (nonatomic, strong)UIButton *deleteBtn;
@property (nonatomic, copy)void (^clickBlock)(NSInteger integer);
- (void)setDefalut:(BOOL)isDefalut;
@end
