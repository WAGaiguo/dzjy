//
//  DZWeb2ViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/17.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZWeb2ViewController.h"
#import <WebKit/WebKit.h>
#import "DZOrderTipsView.h"

@interface DZWeb2ViewController ()
{
    WKWebView *webV;
}
@end

@implementation DZWeb2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_navigationTitle == nil){
        _navigationTitle = @"内容详情";
    }
    [self setBackEnabled:YES];
    self.title = _navigationTitle;
    webV = [[WKWebView alloc]init];
    webV.backgroundColor = UIWhiteColor;
    webV.scrollView.backgroundColor = UIWhiteColor;
    webV.opaque = NO;
    webV.frame = CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - (DZ_TOP));
    [self.view addSubview:webV];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_content]];
    [webV loadRequest:request];
    
    [self makeTipsView];
}
- (void)makeTipsView{
    DZOrderTipsView *tipView = [[DZOrderTipsView alloc]initWithFrame:SCREEN_BOUNDS];
    [self.view addSubview:tipView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
