//
//  DZMyInvoiceNormalAddController.h
//  DZJY
//
//  Created by wangaiguo on 2018/6/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewController.h"

@interface DZMyInvoiceNormalAddController : DZTableViewController
@property (nonatomic, copy) void (^successBlock)(void);
@property (nonatomic, strong)NSString *addTitle;
@property (nonatomic, strong)NSString *invoType;
@property (nonatomic, strong)NSDictionary *dic;
@end
