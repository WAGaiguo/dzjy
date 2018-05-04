//
//  DZMyAddressView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyAddressView : UIView
@property (nonatomic, strong)UIView *backV;
@property (nonatomic, strong)UITextField *personField;
@property (nonatomic, strong)UITextField *addressField;
@property (nonatomic, strong)UITextField *phoneField;
@property (nonatomic, strong)UITextField *codeField;
@property (nonatomic, strong)UITextField *districtField;
@property (nonatomic, strong)UITextField *accountField;
@property (nonatomic, copy)void (^tapDistrictBlock)(void);
@end
