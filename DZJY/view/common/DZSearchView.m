//
//  DZSearchView.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSearchView.h"
#import <TKRoundedView.h>

@interface DZSearchView(){
    UILabel *titleLabel;
}
@end

@implementation DZSearchView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self afterView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        UIImageView *backImageV = [[UIImageView alloc]initWithFrame:CGRectMake(13, 0, frame.size.width - 26, 32)];
//        backImageV.image = [UIImage imageNamed:@"搜索框"];
//        backImageV.contentMode = UIViewContentModeScaleToFill;
//        [self addSubview:backImageV];
        TKRoundedView *backView = [[TKRoundedView alloc]initWithFrame:CGRectMake(13, 0, frame.size.width - 26, 32)];
        backView.fillColor = UIWhiteColor;
        backView.roundedCorners = TKRoundedCornerBottomLeft|TKRoundedCornerTopLeft|TKRoundedCornerBottomRight|TKRoundedCornerTopRight;
        backView.borderWidth = 0;
        backView.alpha = 0.3;
        backView.cornerRadius = 16.0f;
        [self addSubview:backView];
        
        UIImageView *searchV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索"]];
        searchV.centerY = 16;
        searchV.left = 25;
        [self addSubview:searchV];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(searchV.right + 5, 0, 200, 32)];
        titleLabel.textColor = UIWhiteColor;
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.text = @"输入商品名称";
        [self addSubview:titleLabel];
        
        [self bk_whenTapped:^{
            if (_tapBlock) {
                _tapBlock();
            }
        }];
        
    }
    return self;
}
- (void)setPlaceholder:(NSString *)text{
    titleLabel.text = [text description];
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
