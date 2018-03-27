//
//  BAAlertView.m
//  BA
//
//  Created by wangaiguo on 2017/6/26.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import "DZAlertview.h"

@implementation DZAlertview
//+ (BAAlertView *)shareInstance{
//    static BAAlertView *tools = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        tools = [[self alloc]init];
//    });
//    return tools;
//}
- (void)showAlert:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle controller:(UIViewController *)controller confirm:(AlertViewBlock)confirm{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (! cancelTitle) {
        cancelTitle = @"取消";
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertC addAction:cancelAction];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirm) {
            confirm();
        }
    }];
    [alertC addAction:confirmAction];
    [controller presentViewController:alertC animated:YES completion:nil];
}
- (void)showAlert:(NSString *)title controller:(UIViewController *)controller confirm:(AlertViewBlock)confirm{
    [self showAlert:title message:nil cancelTitle:nil controller:controller confirm:confirm];
}

- (void)showSheet:(NSString *)title controller:(UIViewController *)controller confirm:(ActionSheetBlock)confirm buttonTitles:(NSArray *)buttonTitles{
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [sheet addAction:cancelAction];
    [buttonTitles enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (confirm) {
                confirm(idx);
            }
        }];
        [sheet addAction:action];
    }];
    [controller presentViewController:sheet animated:YES completion:nil];
}
@end
