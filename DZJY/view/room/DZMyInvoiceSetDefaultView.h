//
//  DZMyInvoiceSetDefaultView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyInvoiceSetDefaultView : UIView
@property (nonatomic, assign)BOOL isOn;
@property (nonatomic, copy)void(^onBlock)(BOOL isOn);
@end
