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
#import "DZOrderConfirmViewController.h"
#import "NSString+Common.h"

@interface DZWeb2ViewController ()<UIScrollViewDelegate>
{
    WKWebView *webV;
    DZOrderAttentionBuyView *btnV;
    DZOrderBuyView *buyView;
    CGPoint _currentPoint;
}
@property (nonatomic, strong)NSDictionary *dataDic;
@end

@implementation DZWeb2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_navigationTitle == nil){
        _navigationTitle = @"内容详情";
    }
    [self setBackEnabled:YES];
    [self setBackImageGray];
    [self setRightImage:@"问号"];
    self.title = _navigationTitle;
    webV = [[WKWebView alloc]init];
    webV.backgroundColor = UIWhiteColor;
    webV.scrollView.backgroundColor = UIWhiteColor;
    webV.opaque = NO;
    webV.frame = CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - (DZ_TOP));
    webV.scrollView.delegate = self;
//    webV.scrollView.bounces = NO;
    _content = [DZURLFactory homeListDetail:_dic[@"data"][@"id"]];
    [self.view addSubview:webV];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_content]];
    [webV loadRequest:request];
    
    [self makeBtnView];
    [self reqeustDetailData];
}
- (void)makeTipsView{
    DZOrderTipsView *tipView = [[DZOrderTipsView alloc]initWithFrame:SCREEN_BOUNDS];
    tipView.alpha = 0;
    [self.view addSubview:tipView];
    [UIView animateWithDuration:0.33 animations:^{
        tipView.alpha = 1;
    }];
}
- (void)makeBtnView{
    btnV = [[DZOrderAttentionBuyView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 47, SCREEN_WIDTH, 47)];
    [self.view addSubview:btnV];
    WEAK_SELF
    [btnV setBuyBlock:^{
        [me makeBuyView];
    }];
    [btnV setAttentionBlock:^{
        [me requestData];
    }];
}
- (void)makeBuyView{
    if (buyView == nil) {
        buyView = [[DZOrderBuyView alloc]init];
        [buyView setContentDic:_dic[@"data"]];
        [self.view addSubview:buyView];
    }
    [buyView animation];
    WEAK_SELF
    [buyView setTapBuyBlock:^(double nums) {
        NSString *allowBuyCount = me.dic[@"data"][@"allowBuyCount"];
        if (nums > [allowBuyCount doubleValue]) {
            [HudUtils showMessage:@"亲，您买的有点多"]; return ;
        }
        NSString *startBuyCount = me.dic[@"data"][@"startBuyCount"];
        if (nums < [startBuyCount doubleValue]) {
            [HudUtils showMessage:[NSString stringWithFormat:@"亲，您购买的数量必须大于%@%@", startBuyCount, [NSString isBlankString:me.dic[@"measUnit"]]]]; return;
        }
//        if ([allowBuyCount doubleValue] - nums < [startBuyCount doubleValue]) {
//            [HudUtils showMessage:@"亲，请重新选择您的购买量"]; return;
//        }
        if ([[me.dic[@"data"][@"id"] description] isEqualToString:[DZUserManager manager].user.id]) {
            [HudUtils showMessage:@"自己就不要买自己的东西了"];
        }
        DZOrderConfirmViewController *confirmV = [DZOrderConfirmViewController new];
        confirmV.buyCount = nums;
        confirmV.cid = [me.dic[@"data"][@"commCatgId"] description];
        confirmV.membId = [me.dic[@"data"][@"membId"] description];
        confirmV.dataDic = me.dataDic;
        [me.navigationController pushViewController:confirmV animated:YES];
    }];
}
- (void)more{
    [self makeTipsView];
}
/**
 *  关注数据请求
 **/
- (void)requestData{
    if (btnV.isAttentioned) {
        [HudUtils showMessage:@"您已经关注过了"];return;
    }
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [btnV setIsAttentioned:YES];
    }];
    NSString *listId = [_dic[@"data"] objectForKey:@"id"];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:listId forKey:@"listId"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory attentionAdd]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}
#pragma 动态调节下面按钮的高度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ((scrollView.contentOffset.y < _currentPoint.y) || scrollView.contentOffset.y <= 0.5) {
        //必须出现bottomView
        //1.如果之前没有，就出现
        if (btnV.top == SCREEN_HEIGHT) {
            //出现动画
            [self setBottomViewVisibility:YES];
        }
        _currentPoint = scrollView.contentOffset;
        return;
    }
    if (scrollView.contentOffset.y > _currentPoint.y && scrollView.contentOffset.y < scrollView.contentSize.height - scrollView.height) {
        //1.如果之前有，就隐藏
        if (btnV.top == SCREEN_HEIGHT - btnV.height) {
            [self setBottomViewVisibility:NO];
        }
        _currentPoint = scrollView.contentOffset;
        return;
    }
    //如果到达底端就出现
    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.height - 0.1) {
        if (btnV.top == SCREEN_HEIGHT) {
            [self setBottomViewVisibility:YES];
        }
        _currentPoint = scrollView.contentOffset;
        return;
    }
    
}

- (void)setBottomViewVisibility:(BOOL)visibility{
    if (visibility) {
        [UIView animateWithDuration:0.25 animations:^{
            btnV.top = SCREEN_HEIGHT - btnV.height;
        } completion:nil];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            btnV.top = SCREEN_HEIGHT ;
        } completion:nil];
    }
}

- (void)reqeustDetailData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        _dataDic = [NSDictionary dictionaryWithDictionary:obj];
        if ([_dataDic[@"comConId"] isEqual:[NSNull null]]) {
            [btnV setIsAttentioned:NO];
        }else{
            [btnV setIsAttentioned:YES];
        }
    }];
    DZRequestParams *params = [DZRequestParams new];
    [params putString:_dic[@"data"][@"id"] forKey:@"id"];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory orderDetail]];
    [manager setParams:[params params]];
    [manager setHandler:handler];
    [manager post];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
