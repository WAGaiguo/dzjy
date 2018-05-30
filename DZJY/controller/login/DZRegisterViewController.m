//
//  DZRegisterViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZRegisterViewController.h"
#import "DZPathGetter.h"

@interface DZRegisterViewController ()

@end

@implementation DZRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"注册"];
    [self setBackEnabled:YES];
    
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
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, 340, 100, 100);
    btn3.backgroundColor = UIGreenColor;
    [btn3 setTitle:@"清除" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(touchBtn3) forControlEvents:UIControlEventTouchUpInside];
}
- (void)touchBtn{
//    if ([[NSFileManager defaultManager] fileExistsAtPath:UIDocumentFile(@"address.plist")]) {
//        [HudUtils showMessage:@"存在"];
//    }else{
//        [HudUtils showMessage:@"不存在"];
//    }return;
    NSString *filePath = UIDocumentFile(@"address.plist");
    NSDictionary *dic1 = @{@"address":@"111111111111111", @"id":@"1"};
    NSDictionary *dic2 = @{@"address":@"222222222222222", @"id":@"2"};
//    NSArray *arr = @[dic1, dic2];
    NSMutableArray *mutalbeArr = [NSMutableArray array];
    NSLog(@"----%ld", [mutalbeArr count]);
    [mutalbeArr addObject:dic1];
    [mutalbeArr addObject:dic2];
    [mutalbeArr writeToFile:filePath atomically:YES];
    [mutalbeArr enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"address:%@, id:%@",obj[@"address"], obj[@"id"]);
    }];
//    [arr writeToFile:filePath atomically:YES];
}
- (void)touchBtn2{
//    NSMutableArray *arr = [[NSMutableArray alloc]initWithContentsOfFile:UIDocumentFile(@"address.plist")];

    NSString *filePath = UIDocumentFile(@"address.plist");
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
        NSLog(@"%ld",[arr count]);
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"address:%@, id:%@",obj[@"address"], obj[@"id"]);
    }];
}

- (void)touchBtn3{
    NSString *filePath = UIDocumentFile(@"address.plist");
    NSMutableArray *mutaleArr = [NSMutableArray arrayWithContentsOfFile:filePath];
    [mutaleArr removeAllObjects];
    [mutaleArr writeToFile:filePath atomically:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
