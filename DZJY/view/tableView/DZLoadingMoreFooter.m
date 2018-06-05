//
//  CKLoadingMoreFooter.m
//  ck
//
//  Created by Chin on 14/10/21.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "DZLoadingMoreFooter.h"

@implementation DZLoadingMoreFooter
- (void)setLoadingState:(YLLoadingMoreState)loadingState
{
    _loadingState = loadingState;
    switch (_loadingState) {
        case Normal:
            [_textLabel setText:@"上拉加载更多"];
            [_loadingIndicatorView setHidden:YES];
            [_loadingIndicatorView stopAnimating];
            break;
        case Loading:
            [_textLabel setText:@"加载更多"];
            [_loadingIndicatorView setHidden:NO];
            [_loadingIndicatorView startAnimating];
            break;
        case Done:
            [_textLabel setText:@"没有更多数据"];
            [_loadingIndicatorView setHidden:YES];
            [_loadingIndicatorView stopAnimating];
            break;
        default:
            break;
    }
}
- (void)afterViews{
//    [self setBackgroundColor:UIClearColor];
//    [self.containerView setBackgroundColor:DZTableViewBGGrayColor];
    [_textLabel setTextColor:UIDarkGrayColor];
}
- (void)resize{
    [_textLabel setCenter:CGPointMake(SCREEN_WIDTH/2.0f, 22)];
    [_loadingIndicatorView setRight: _textLabel.left];
}
@end
