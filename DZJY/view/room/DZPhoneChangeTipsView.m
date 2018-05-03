//
//  DZPhoneChangeTipsView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZPhoneChangeTipsView.h"

@implementation DZPhoneChangeTipsView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label1 = [[UILabel alloc]init];
        label1.height = 15;
        label1.text = @"手机号码修改成功后需要使用新的手机号码进行登录";
        label1.font = [UIFont systemFontOfSize:12];
        label1.textColor = UI666666Color;
        [label1 sizeToFit];
        label1.centerX = SCREEN_WIDTH/2.0;
        
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zhuce_tishi"]];
        imageV.bottom = label1.top - 5;
        imageV.left = label1.left;
        
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.textColor = UI666666Color;
        label2.font = [UIFont systemFontOfSize:12];
        label2.text = @"温馨提示：";
        label2.height = 15;
        label2.left = imageV.right + 5;
        label2.top = imageV.top;
        [label2 sizeToFit];
        
        [self addSubview:label1];
        [self addSubview:imageV];
        [self addSubview:label2];
    }
    return self;
}
@end
