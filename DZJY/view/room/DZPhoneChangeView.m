//
//  DZPhoneChangeView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZPhoneChangeView.h"

@implementation DZPhoneChangeView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIWhiteColor;
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2.0, 37)];
        imageV.image = [UIImage imageNamed:@"phone_one"];
        [self addSubview:imageV];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2.0, 37)];
        label1.font = [UIFont systemFontOfSize:15];
        label1.textColor = UICommonColor;
        label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label1];
        label1.text = @"1.验证原号码";
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0, 0, SCREEN_WIDTH/2.0, 37)];
        label2.text = @"2.绑定新手机";
        label2.textColor = UI333333Color;
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:15];
        [self addSubview:label2];
    }
    return self;
}

@end

@implementation DZPhoneChangeView2
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIWhiteColor;
        self.backgroundColor = UIWhiteColor;
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0, 0, SCREEN_WIDTH/2.0, 37)];
        imageV.image = [UIImage imageNamed:@"phone_two"];
        [self addSubview:imageV];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2.0, 37)];
        label1.font = [UIFont systemFontOfSize:15];
        label1.textColor = UI333333Color;
        label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label1];
        label1.text = @"1.验证原号码";
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0, 0, SCREEN_WIDTH/2.0, 37)];
        label2.text = @"2.绑定新手机";
        label2.textColor = UICommonColor;
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:15];
        [self addSubview:label2];
    }
    return self;
}
@end
