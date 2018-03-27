//
//  HudUtils.h
//  BA
//
//  Created by wangaiguo on 17/6/9.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HudUtils : NSObject
+ (void)showMessage:(NSString *)message;
+ (void)show:(UIView *)view;
+ (void)hide:(UIView *)view;
+ (void)showMessage:(NSString *)message view:(UIView *)view duration:(NSTimeInterval)duration;
@end
