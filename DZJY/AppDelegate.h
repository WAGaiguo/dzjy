//
//  AppDelegate.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTabBarViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DZTabBarViewController *tabBarViewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

