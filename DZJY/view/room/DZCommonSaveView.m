//
//  DZCommonSaveView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCommonSaveView.h"

@implementation DZCommonSaveView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.width = SCREEN_WIDTH;
        self.height = 43;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(7, 0, SCREEN_WIDTH - 14, 43);
        [btn setBackgroundImage:[UIImage imageNamed:@"导航条"] forState:UIControlStateNormal];
        btn.tag = 520;
        [btn setTitle:@"保存" forState:UIControlStateNormal];
        [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        [btn bk_addEventHandler:^(id sender) {
            if (_saveBlock) {
                _saveBlock();
            }
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}
- (void)setTitleText:(NSString *)text{
    UIButton *btn = [self viewWithTag:520];
    [btn setTitle:text forState:UIControlStateNormal];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
