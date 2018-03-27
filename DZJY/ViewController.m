//
//  ViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%lf", SCREEN_WIDTH);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.backgroundColor = UIGrayColor;
    btn.left = 20;
    btn.top = 100;
    btn.width = 100;
    btn.height = 100;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnTap) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnTap{
    [HudUtils showMessage:@"test---test"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
