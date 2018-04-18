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
#import "DZOrderBuyView.h"
#import "DZOrderAttentionBuyView.h"


@interface DZWeb2ViewController ()
{
    WKWebView *webV;
    DZOrderAttentionBuyView *btnV;
    DZOrderBuyView *buyView;
    
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
    [self makeBtnView];
}
- (void)makeTipsView{
    DZOrderTipsView *tipView = [[DZOrderTipsView alloc]initWithFrame:SCREEN_BOUNDS];
    [self.view addSubview:tipView];
}
- (void)makeBtnView{
    btnV = [[DZOrderAttentionBuyView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 57, SCREEN_WIDTH, 57)];
    [btnV setBottom:SCREEN_HEIGHT+8];
    [self.view addSubview:btnV];
    WEAK_SELF
    [btnV setBuyBlock:^{
        [me makeBuyView];
    }];
}
- (void)makeBuyView{
    buyView = [[DZOrderBuyView alloc]init];
    [buyView animation];
    [self.view addSubview:buyView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
