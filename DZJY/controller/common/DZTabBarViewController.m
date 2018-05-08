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
#import "DZMessageViewController.h"

@interface DZTabBarViewController ()

@property (nonatomic,strong)DZHomeViewController *homeViewController;
@property (nonatomic,strong)DZMineViewController *mineViewController;
@property (nonatomic,strong)DZMessageViewController *messageViewController;

@end

@implementation DZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _homeViewController = [[DZHomeViewController alloc]init];
    _mineViewController = [[DZMineViewController alloc]init];
    _messageViewController = [[DZMessageViewController alloc]init];
    
    
    _homeViewController.tabBarItem.title = @"首页";
    _homeViewController.tabBarItem.image = [UIImage imageNamed:@"首页"];
    
    _mineViewController.tabBarItem.title = @"我的";
    _mineViewController.tabBarItem.image = [UIImage imageNamed:@"我的"];
    
    _messageViewController.tabBarItem.title = @"消息";
    _messageViewController.tabBarItem.image = [UIImage imageNamed:@"消息"];
    _messageViewController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",0];
//    _messageViewController.tabBarItem.badgeValue = nil;
    
    self.tabBar.tintColor = UICommonColor;
    self.viewControllers = @[_homeViewController, _messageViewController, _mineViewController];
    
    WEAK_SELF
    me.delegate = self;
}

-(void)setBadageValue:(NSString *)nums{
    _messageViewController.tabBarItem.badgeValue = nums;
}

// 处理点击其它 item 返回自定义事件
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[DZMineViewController class]]) {
        return YES;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
