//
//  CKRefreshHeader.m
//  ck
//
//  Created by wangaiguo on 15/12/7.
//  Copyright © 2015年 chin. All rights reserved.
//

#import "DZRefreshHeader.h"

@implementation DZRefreshHeader

-(void)setRefreshState:(YLRefreshState)refreshState{
    _refreshState = refreshState;
    switch (_refreshState) {
        case WillRefreshl:
            [_textLabel setText:@"松开立即更新"];
            break;
        case Refreshing:
            [self rotate360WithDuration:2 repeatCount:0];
            [_textLabel setText:@"正在更新中"];
            break;
        case RefreshDone:
            [pullCircle.layer removeAllAnimations];
            [_textLabel setText:@"已经更新完毕"];
            break;
        default:
            break;
    }
}
- (void)afterViews{
//    self.containerView.backgroundColor = DZTableViewBGGrayColor;
}
- (void)resize{
    [_textLabel setCenter:CGPointMake(SCREEN_WIDTH/2.0, _textLabel.center.y)];
    [pullContentImage setCenterX:SCREEN_WIDTH/2.0];
    [pullCircle setCenterX:SCREEN_WIDTH/2.0];
}

- (void)rotate360WithDuration:(CGFloat)duration repeatCount:(float)repeatCount
{
    
    CABasicAnimation *fullRotation;
    fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360 * M_PI) / 180)];
    fullRotation.duration = duration;
    if (repeatCount == 0)
        fullRotation.repeatCount = MAXFLOAT;
    else
        fullRotation.repeatCount = repeatCount;
    [pullCircle.layer addAnimation:fullRotation forKey:@"360"];
}

@end
