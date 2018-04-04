//
//  DZLoginViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZLoginViewController.h"
#import "DZPathGetter.h"

@interface DZLoginViewController ()

@end

@implementation DZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"登录"];
    [self setBackEnabled:YES];
    [self configButton];
}

- (void)configButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = UIGreenColor;
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 220, 100, 100);
    btn2.backgroundColor = UIGreenColor;
    [btn2 setTitle:@"读取" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(touchBtn2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchBtn{
    NSDictionary *info = @{@"username" :@"usernameTTtt", @"nickname":@"nicknameTT"};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", jsonString);
    if (jsonString.length != 0) {
        [jsonString writeToFile:UIDocumentFile(@"user.bat") atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

- (void)touchBtn2{
    NSString *encodeString = [[NSString alloc]initWithContentsOfFile:UIDocumentFile(@"user.bat") encoding:NSUTF8StringEncoding error:nil];
    id userInfo = [NSJSONSerialization JSONObjectWithData:[encodeString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"---%@----",encodeString);
    NSLog(@"%@", userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
