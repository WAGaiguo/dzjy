//
//  UIToolbar+Builder.m
//  wte
//
//  Created by 范文青 on 14-6-10.
//  Copyright (c) 2014年 fwq. All rights reserved.
//

#import "UIToolbar+Builder.h"
@implementation UIToolbar (Builder)
+ (UIView *)inputAccessoryView:(id)target sel:(SEL)sel
{

    UIView  *toolBar = [[UIView alloc ]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [toolBar setBackgroundColor:UIWhiteColor];
    UIButton  *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(SCREEN_WIDTH - 50, 0, 50, 40)];
    [rightButton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [[rightButton titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [rightButton setTitleColor:[UIColor lightGray] forState:UIControlStateHighlighted];
    [toolBar addSubview:rightButton];
    [toolBar setBackgroundColor:UIWhiteColor];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ONE_PIXEL)];
    [line setBottom:40];
    [line setBackgroundColor:UIGrayColor];
    [toolBar addSubview:line];
    return toolBar;
}
@end
