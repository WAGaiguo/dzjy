//
//  DZSearchView.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSearchView.h"

@implementation DZSearchView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self afterView];
    }
    return self;
}

- (void)afterView{
    self.backgroundColor = UICyanColor;
    self.width = SCREEN_WIDTH - 64 * 2;
    self.height = 40;
    self.left = 64;
    self.top = IS_IPHONE_X ? 44 : 20;
    
//    self.userInteractionEnabled = YES;
    [self bk_whenTapped:^{
        if (_tapBlock) {
            _tapBlock();
        }
    }];
    
}

@end
