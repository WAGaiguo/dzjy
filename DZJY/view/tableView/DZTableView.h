//
//  DZTableView.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZLoadingMoreFooter.h"
#import "DZRefreshHeader.h"
@interface DZTableView : UITableView
{
    DZLoadingMoreFooter  *_loadingFooterView;
}
@property (nonatomic, assign)BOOL loadingMoreEnabled;
@property (nonatomic, assign)BOOL pullRefreshEnabled;
@property (nonatomic, assign)BOOL blockLoadMore;

@property (nonatomic, copy)void (^onRefresh)(DZTableView *);
@property (nonatomic, copy)void (^onLoadMore)(DZTableView *);
@property (nonatomic, copy)void (^onScrollToTop)(DZTableView *,BOOL);

@property (nonatomic,assign)BOOL hasMoreData;

@property (nonatomic, assign)float loadMoreOffset;

//勿用
@property (nonatomic,assign)CGPoint originalContentOffset;
- (void)stopRefresh:(BOOL)hasMore;
- (void)stopLoading:(BOOL)hasMore;

- (void)gotop:(BOOL)animated;
- (void)goTop;
@end
