//
//  DZWebViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/8.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZWebViewController.h"
#import <WebKit/WebKit.h>

@interface DZWebViewController ()//<WKUIDelegate, WKNavigationDelegate>
{
    WKWebView *webV;
}

@end

@implementation DZWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    if (_navigationTitle == nil) {
        _navigationTitle = @"内容详情";
    }
    self.title = _navigationTitle;
    [self setHeaderBackGroud:YES];
    
    webV = [[WKWebView alloc]init];
    webV.backgroundColor = UIBackgroundColor;
    webV.scrollView.backgroundColor = UIBackgroundColor;
    webV.opaque = NO;
    webV.frame = CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - (DZ_TOP));
    [self.view addSubview:webV];

    if (_content) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_content]];
        [webV loadRequest:request];
    } else if (_nativeContent){
        NSString *htmlPath = [[NSBundle mainBundle]pathForResource:_nativeContent ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:htmlPath];
        [webV loadFileURL:url allowingReadAccessToURL:url];
    }
//    webV.UIDelegate = self;
//    webV.navigationDelegate = self;
}

//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
//    [[DZApplication currentApplication] openUrl:[webView.URL absoluteString]];
//}

//-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//
//    decisionHandler(WKNavigationActionPolicyAllow);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
