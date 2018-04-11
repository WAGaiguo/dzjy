//
//  DZCategoryAllHeaderView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryAllHeaderView.h"
#import "UIImage+resize.h"

@implementation DZCategoryAllHeaderView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.width = SCREEN_WIDTH - 115;
        self.height = 47;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(16, 6, self.width - 32, 35);
        [btn setBackgroundImage:[UIImage resizableImage] forState:UIControlStateNormal];
        [btn setTitle:@"全部" forState:UIControlStateNormal];
        [btn setTitleColor:RGBCOLOR(51, 51, 51) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:btn];
        btn.userInteractionEnabled = NO;
        
        [self bk_whenTapped:^{
            if (_tapBlock) {
                _tapBlock();
            }
        }];
    }
    return self;
}
//- (UIImage *)resizableImage{
//    UIImage *image = [UIImage imageNamed:@"框框"];
//    image =  [image resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 3, 3)];
//    return image;
//}

@end
