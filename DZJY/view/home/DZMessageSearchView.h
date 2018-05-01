//
//  DZMessageSearchView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMessageSearchView : UIView
@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, copy)void (^searchBlock)(NSString *text);
@end
