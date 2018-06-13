//
//  DZMyInvoiceNormalView.h
//  DZJY
//
//  Created by wangaiguo on 2018/6/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyInvoiceNormalView : UIView
@property (nonatomic, strong)UIView *backV;
@property (nonatomic, strong)UITextField *companyField;
@property (nonatomic, strong)UITextField *codeField;
- (void)setContent:(NSDictionary *)dic;
- (void)setUnabled;
- (void)setPlaceholderNil;
@end
