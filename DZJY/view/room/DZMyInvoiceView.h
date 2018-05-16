//
//  DZMyInvoiceView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyInvoiceView : UIView
@property (nonatomic, strong)UIView *backV;
@property (nonatomic, strong)UITextField *companyField;
@property (nonatomic, strong)UITextField *addressField;
@property (nonatomic, strong)UITextField *phoneField;
@property (nonatomic, strong)UITextField *codeField;
@property (nonatomic, strong)UITextField *bankField;
@property (nonatomic, strong)UITextField *accountField;
- (void)setContent:(NSDictionary *)dic;
- (void)setUnabled;
- (void)setPlaceholderNil;
@end
