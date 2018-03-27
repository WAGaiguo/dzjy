//
//  DZTabBarViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTabBarViewController.h"
#import "DZHomeViewController.h"
#import "DZMineViewController.h"

@interface DZTabBarViewController ()

@property (nonatomic,strong)DZHomeViewController *homeViewController;
@property (nonatomic,strong)DZMineViewController *mineViewController;

@end

@implementation DZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _homeViewController = [[DZHomeViewController alloc]init];
    _mineViewController = [[DZMineViewController alloc]init];
    
    _homeViewController.tabBarItem.title = @"首页";
    _homeViewController.tabBarItem.image = [UIImage imageNamed:@"icon-server"];
    _mineViewController.tabBarItem.title = @"我的";
    _mineViewController.tabBarItem.image = [UIImage imageNamed:@"icon-mine"];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    self.viewControllers = @[_homeViewController, _mineViewController];
    
    WEAK_SELF
    me.delegate = self;
}


// 处理点击其它 item 返回自定义事件
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[DZMineViewController class]]) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
