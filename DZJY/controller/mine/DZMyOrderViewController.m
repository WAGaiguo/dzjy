//
//  DZMyOrderViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/25.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyOrderViewController.h"
#import "DZMyOrderTipsView.h"

@interface DZMyOrderViewController ()

@end

@implementation DZMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTitle];
}
- (void)configTitle{
    [self setBackEnabled:YES];
    [self setHeaderBackGroud:YES];
    [self setTitle:@"我的订单"];
    [self setRightImage:@"question_mark"];
}
- (void)more{
    DZMyOrderTipsView *tipView = [[DZMyOrderTipsView alloc]init];
    [self.view addSubview:tipView];
    [tipView startAnimation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
