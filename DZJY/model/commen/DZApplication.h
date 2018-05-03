//
//  DZApplication.h
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAIN_WINDOW    [[DZApplication currentApplication] mainWindow]
#define SCREEN_BOUNDS  [[DZApplication currentApplication] screenBounds]
#define SCREEN_WIDTH   [[DZApplication currentApplication] screenWidth]
#define SCREEN_HEIGHT  [[DZApplication currentApplication] screenHeight]
#define APPDELEGATE    [[DZApplication currentApplication] appDelegate]
#define DIMENSION(dimen)   [[DZApplication currentApplication] dimension:dimen]
#define WEAK_SELF __weak typeof(self) me = self;
#define ONE_PIXEL 1.0/[UIScreen mainScreen].scale
#define IS_IPHONE_X    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define DZ_TOP         (IS_IPHONE_X ? 88:64)
#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)
#define TRIM_STRING( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ]

@class AppDelegate;
@interface DZApplication : NSObject
+ (DZApplication *)currentApplication;
- (UIWindow *)mainWindow;
- (int)systemVersion;
- (CGRect)screenBounds;
- (float)screenScale;
- (float)screenWidth;
- (float)screenHeight;
- (NSString *)version;
- (NSString *)shortVersion;
- (AppDelegate *)appDelegate;
- (CGFloat)dimension:(CGFloat)dimension;
- (void)openUrl: (NSString *)urlStr;
@end
