//
//  DZMyInvoiceEditViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewController.h"

@interface DZMyInvoiceEditViewController : DZTableViewController
@property (nonatomic, strong)NSString *editTitle;
@property (nonatomic, strong)NSString *invoType;
@property (nonatomic, strong)NSDictionary *dic;
@property (nonatomic, copy) void (^successBlock)(void);
@end
