//
//  DZMyAddressCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZMyInvoiceEditView.h"

@interface DZMyAddressCell : UITableViewCell
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *addressLabel;
@property (nonatomic, strong)DZMyInvoiceEditView *editView;
@property (nonatomic, copy)void(^tapBlock)(NSInteger integer);
- (void)setContent:(NSDictionary *)dic;
@end
