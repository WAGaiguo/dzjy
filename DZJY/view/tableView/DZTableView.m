//
//  DZTableView.m
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "DZTableView.h"
#import "SVPullToRefresh.h"
@interface DZTableView()
{
}
@property (nonatomic,assign)BOOL isRefreshing;
@property (nonatomic,assign)BOOL isLoadingMore;

@property (nonatomic,assign)NSTimeInterval lastLoadMore;
@end

@implementation DZTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self){
        _hasMoreData = YES;
        _blockLoadMore = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        
        //观察contentOffset偏离的距离
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (BOOL)shouldDelayLoadMore{
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval interval = now - _lastLoadMore;
    return interval < 1.5;
}

- (void)goTop{
    [self gotop:YES];
}


- (void)setPullRefreshEnabled:(BOOL)pullRefreshEnabled{
    __weak DZTableView *me = self;
    if (pullRefreshEnabled == _pullRefreshEnabled) {
        return;
    }
    _pullRefreshEnabled = pullRefreshEnabled;
    if (_pullRefreshEnabled && self.pullToRefreshView == nil) {
        [self addPullToRefreshWithActionHandler:^{
            [me refresh];
        }];
    }
    self.showsPullToRefresh = _pullRefreshEnabled;
}


- (void)refresh{
    if (_isRefreshing) return;
    _isRefreshing = YES;
    if (_onRefresh != nil) {
        _onRefresh(self);
    }
//    [_refreshHeaderView setRefreshState:Refresh];
}
- (void)loadMore{
    if (_blockLoadMore) {
        return;
    }
    if (_isLoadingMore) return;
    if (!_hasMoreData) return;
    _isLoadingMore = YES;
    if (_onLoadMore != nil) {
        _onLoadMore(self);
    }
    _lastLoadMore = [[NSDate date] timeIntervalSince1970];
    [_loadingFooterView setLoadingState:Loading];
}

- (void)setLoadingMoreEnabled:(BOOL)loadingMoreEnabled{
    if (loadingMoreEnabled == _loadingMoreEnabled) {
        return;
    }
    _loadingMoreEnabled = loadingMoreEnabled;
    if (_loadingMoreEnabled && _loadingFooterView == nil) {
        _loadingFooterView = [[DZLoadingMoreFooter alloc]init];
        [_loadingFooterView setTop:self.height];
        [self addSubview:_loadingFooterView];
    }else{
        [_loadingFooterView removeFromSuperview];
    }
}

- (void)stopRefresh:(BOOL)hasMore{
    if (hasMore){
        _isRefreshing = NO;
        [self.pullToRefreshView stopAnimating];
//      [self setHasMoreData:hasMore];
      }
}


- (void)stopLoading:(BOOL)hasMore{
    _isLoadingMore = NO;
    [self setHasMoreData:hasMore];
}


- (void)setHasMoreData:(BOOL)hasMoreData{
    _hasMoreData = hasMoreData;
    if (_hasMoreData) {
        [_loadingFooterView setLoadingState:Normal];
    }else{
        [_loadingFooterView setLoadingState:Done];
    }
}


- (void)setContentSize:(CGSize)contentSize{
    CGSize nsize = contentSize;
    if (_loadingMoreEnabled){
        nsize.height += _loadingFooterView.height;
        float top = contentSize.height < self.height ? self.height :contentSize.height;
        [_loadingFooterView setTop:top];
        if (nsize.height < self.height){
            nsize.height = self.height + 1;
        }
    }
    [super setContentSize:nsize];
}

//返回到顶端
- (void)gotop:(BOOL)animated{
    [self setContentOffset:CGPointZero animated:animated];
}

//当观测到这个DZTableView的contentOffset出现变化的时候调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    __weak DZTableView  *me = self;
    CGPoint point = [change[NSKeyValueChangeNewKey] CGPointValue];
    if (point.y <= 0 && _onScrollToTop != nil){
        _onScrollToTop(me,YES);
    }
    else{
        if (_onScrollToTop != nil){
            _onScrollToTop(me,NO);
        }
    }
    
    float scrollViewHeight = me.height;
    float scrollContentSizeHeight = me.contentSize.height;
    float scrollOffset = point.y;
    
    if (![me shouldDelayLoadMore] && _hasMoreData && _loadingMoreEnabled){
        if (scrollOffset + scrollViewHeight + me.loadMoreOffset >= scrollContentSizeHeight && point.y > 0){
            [me loadMore];
        }
    }
}


- (void)dealloc{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [MAIN_WINDOW endEditing:YES];
//}
@end
