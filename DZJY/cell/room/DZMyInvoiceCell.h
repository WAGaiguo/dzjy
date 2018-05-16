//
//  DZMyInvoiceCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZMyInvoiceView.h"
#import "DZMyInvoiceEditView.h"

@interface DZMyInvoiceCell : UITableViewCell
@property (nonatomic, strong)DZMyInvoiceView *invoiceView;
@property (nonatomic, strong)DZMyInvoiceEditView *editView;
@property (nonatomic, copy)void(^tapBlock)(NSInteger integer);
- (void)setContent:(NSDictionary *)dic;
@end
