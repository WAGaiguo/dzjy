//
//  DZApplication.m
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import "DZApplication.h"
#import "CWLSynthesizeSingleton.h"

@implementation DZApplication
CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(DZApplication, currentApplication);
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (UIWindow *)mainWindow
{
    return [[[UIApplication sharedApplication] delegate] window];
}
- (CGRect)screenBounds
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    return bounds;
}
- (float)screenScale
{
    return [[UIScreen mainScreen] scale];
}
- (float)screenWidth
{
    return [self screenBounds].size.width;
}
- (float)screenHeight
{
    return [self screenBounds].size.height;
}
- (int)systemVersion
{
    return [[[UIDevice currentDevice] systemVersion] intValue];
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (NSString *)shortVersion
{
    return  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
- (NSString *)version
{
    return [self shortVersion];
}
- (CGFloat)dimension:(CGFloat)dimension{
    return ceil((dimension / 375.0) * SCREEN_WIDTH);
}
- (void)openUrl:(NSString *)urlStr{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}
@end
