//
//  HudUtils.m
//  BA
//
//  Created by wangaiguo on 17/6/9.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import "HudUtils.h"

@implementation HudUtils
+ (void)show:(UIView *)view{
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}
+ (void)hide:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
}
+ (void)showMessage:(NSString *)message{
    [HudUtils showMessage:message view:MAIN_WINDOW duration:1.4f];
}
+ (void)showMessage:(NSString *)message view:(UIView *)view duration:(NSTimeInterval)duration{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud  hide:YES afterDelay:duration];
}
@end
