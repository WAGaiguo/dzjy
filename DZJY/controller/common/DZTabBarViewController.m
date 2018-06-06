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
#import "NSString+Common.h"
#import "DZLoginViewController.h"

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
    [self requestData];
}

-(void)setBadageValue:(NSString *)nums{
    _messageViewController.tabBarItem.badgeValue = [NSString formateString:nums];
    if ([nums isEqualToString:@"0"] || [nums length] <= 0) {
        _messageViewController.tabBarItem.badgeValue = nil;
    }
}
- (void)setDecreaseBadageValue{
    if (_messageViewController.tabBarItem.badgeValue != nil) {
        NSInteger currentNums = [_messageViewController.tabBarItem.badgeValue integerValue];
        [self setBadageValue:[NSString stringWithFormat:@"%ld", currentNums - 1]];
    }
}

// 处理点击其它 item 返回自定义事件
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[DZMessageViewController class]]) {
        if (![[DZUserManager manager] isLogined]) {
            [self presentViewController:[DZLoginViewController new] animated:YES completion:nil];
            return NO;
        }
        return YES;
    }
    return YES;
}

// 消息数量
- (void)requestData{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeBackground;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (obj != nil) {
            [self setBadageValue:[NSString stringWithFormat:@"%@", obj]];
        }
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        [self setBadageValue:@"0"];
    }];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory messageNums]];
    [manager setHandler: handler];
    [manager post];
    
    [self performSelector:@selector(requestData) withObject:nil afterDelay:5 * 60];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
