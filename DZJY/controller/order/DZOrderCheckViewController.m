//
//  DZOrderCheckViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderCheckViewController.h"
#import "DZOrderCheckAdapter.h"
#import "DZOrderCancelAndPayView.h"

@interface DZOrderCheckViewController (){
    DZOrderCheckAdapter *_adapter;
    DZOrderCancelAndPayView *_btnView;
    CGPoint _currentPoint;
}

@end

@implementation DZOrderCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"订单查看"];
    [self setBackEnabled:YES];
    [self setBackImageGray];
    [self configAdapter];
    [self configPayView];
    [self requestData];
}
- (void)configAdapter{
    _adapter = [DZOrderCheckAdapter new];
    [self.tableView setAdapter:_adapter];
    self.tableView.allowsSelection = NO;
    WEAK_SELF
    [_adapter setDidScroll:^(UITableView *tableView) {
        [me scrollViewDidScroll:tableView];
    }];
}
- (void)configPayView{
    _btnView = [[DZOrderCancelAndPayView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    [self.view addSubview:_btnView];
    [_btnView setCancelBlock:^{
        [HudUtils showMessage:@"取消"];
    }];
    [_btnView setPayBlock:^{
        [HudUtils showMessage:@"支付"];
    }];
}
- (void)requestData{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma 动态调节下面按钮的高度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ((scrollView.contentOffset.y < _currentPoint.y) || scrollView.contentOffset.y <= 0.5) {
        //必须出现bottomView
        //1.如果之前没有，就出现
        if (_btnView.top == SCREEN_HEIGHT) {
            //出现动画
            [self setBottomViewVisibility:YES];
        }
        _currentPoint = scrollView.contentOffset;
        return;
    }
    if (scrollView.contentOffset.y > _currentPoint.y && scrollView.contentOffset.y < scrollView.contentSize.height - scrollView.height) {
        //1.如果之前有，就隐藏
        if (_btnView.top == SCREEN_HEIGHT - _btnView.height) {
            [self setBottomViewVisibility:NO];
        }
        _currentPoint = scrollView.contentOffset;
        return;
    }
    //如果到达底端就出现
    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.height - 0.1) {
        if (_btnView.top == SCREEN_HEIGHT) {
            [self setBottomViewVisibility:YES];
        }
        _currentPoint = scrollView.contentOffset;
        return;
    }
}
- (void)setBottomViewVisibility:(BOOL)visibility{
    if (visibility) {
        [UIView animateWithDuration:0.25 animations:^{
            _btnView.top = SCREEN_HEIGHT - _btnView.height;
        } completion:nil];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            _btnView.top = SCREEN_HEIGHT ;
        } completion:nil];
    }
}

@end
