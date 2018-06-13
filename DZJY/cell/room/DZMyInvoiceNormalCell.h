//
//  DZMyInvoiceNormalCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/6/13.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZMyInvoiceNormalView.h"
#import "DZMyInvoiceEditView.h"

@interface DZMyInvoiceNormalCell : UITableViewCell
@property (nonatomic, strong)DZMyInvoiceNormalView *invoiceView;
@property (nonatomic, strong)DZMyInvoiceEditView *editView;
@property (nonatomic, copy)void(^tapBlock)(NSInteger integer);
- (void)setContent:(NSDictionary *)dic;
@end
