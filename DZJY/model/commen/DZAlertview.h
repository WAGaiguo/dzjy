//
//  BAAlertView.h
//  BA
//
//  Created by wangaiguo on 2017/6/26.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^AlertViewBlock)(void);
typedef void (^ActionSheetBlock)(NSInteger );

@interface DZAlertview : NSObject
//+ (BAAlertView *)shareInstance;
- (void)showAlert:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle controller:(UIViewController *)controller confirm:(AlertViewBlock)confirm;
- (void)showAlert:(NSString *)title controller:(UIViewController *)controller confirm:(AlertViewBlock)confirm;

- (void)showSheet:(NSString *)title controller:(UIViewController *)controller confirm:(ActionSheetBlock)confirm buttonTitles:(NSArray *)buttonTitles;
@end
