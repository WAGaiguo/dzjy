//
//  DZDeleteTipsView.m
//  DZJY
//
//  Created by wangaiguo on 2018/6/5.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

//#import <PYSearch/dzt>
#import "DZDeleteTipsView.h"

@implementation DZDeleteTipsView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = SCREEN_BOUNDS;
        UIView *backView = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
        backView.alpha = 0.5;
        backView.backgroundColor = UIBlackColor;
        [self addSubview:backView];
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"是否删除弹框"]];
    [self addSubview:imageV];
    imageV.userInteractionEnabled = YES;
    imageV.layer.masksToBounds = YES;
    imageV.layer.cornerRadius = 8.0f;
    imageV.width = 300;
    imageV.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0);
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.height/2.0 - 10, imageV.width, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"历史搜索记录将被清空";
    [imageV addSubview:label];
    
    
    UILabel *subLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.height/2.0 + 10, imageV.width, 20)];
    subLabel.textAlignment = NSTextAlignmentCenter;
    subLabel.text = @"确定要删除？";
    [imageV addSubview:subLabel];
    
    
    UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, imageV.height - 50, imageV.width, ONE_PIXEL)];
    horizontalLineView.backgroundColor = UISeperatorColor;
    [imageV addSubview:horizontalLineView];
    
    
    UIView *verticalLineView = [[UIView alloc]initWithFrame:CGRectMake(imageV.width/2.0, horizontalLineView.top, ONE_PIXEL, 50)];
    verticalLineView.backgroundColor = UISeperatorColor;
    [imageV addSubview:verticalLineView];
    
    
    UILabel *cancelLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.height - 50, imageV.width/2.0, 50)];
    cancelLabel.textAlignment = NSTextAlignmentCenter;
    cancelLabel.text = @"取消";
    [imageV addSubview:cancelLabel];
    [cancelLabel setUserInteractionEnabled:YES];
    [cancelLabel bk_whenTapped:^{
        [self removeSelfView];
    }];
    
    UILabel *confimLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageV.width/2.0, imageV.height - 50, imageV.width/2.0, 50)];
    confimLabel.textAlignment = NSTextAlignmentCenter;
    confimLabel.text = @"确认";
    confimLabel.textColor = UICommonColor;
    [imageV addSubview:confimLabel];
    [confimLabel setUserInteractionEnabled:YES];
    [confimLabel bk_whenTapped:^{
        if (_deleteBlock) {
            _deleteBlock();
        }
        [self removeSelfView];
    }];
}

- (void)removeSelfView{
    self.alpha = 1;
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
