//
//  DZMessageSearchView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageSearchView.h"

@implementation DZMessageSearchView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setHeight:44];
        [self setWidth:SCREEN_WIDTH];
        [self setBackgroundColor:UIBackgroundColor];
        [self afterView];
    }
    return self;
}
- (void)afterView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 37)];
    backView.layer.masksToBounds = YES;
    backView.backgroundColor = UIWhiteColor;
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 18.5f;
    [self addSubview:backView];
    
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_gray"]];
    imageV.centerY = 18.5;
    imageV.left = 11;
    [backView addSubview:imageV];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(imageV.right + 8, 0, SCREEN_WIDTH - 66, 37)];
    _textField.placeholder = @"搜索";
    _textField.font = [UIFont systemFontOfSize:16];
    _textField.keyboardType = UIKeyboardTypeWebSearch;
    [backView addSubview:_textField];
    WEAK_SELF
    [_textField setBk_shouldReturnBlock:^BOOL(UITextField *textF) {
        [textF resignFirstResponder];
        if ([self strLength:textF.text] <= 0) {
            [HudUtils showMessage:@"请输入您要搜索的内容"];
            return YES;
        }
        if (me.searchBlock) {
            me.searchBlock(textF.text);
        }
        return YES;
    }];
}
/**
  *  计算searchText去除空格后的长度
 **/
- (NSInteger)strLength:(NSString *)str{
    return [self deleteSpaceAndEnter:str].length;
}
- (NSString *)deleteSpaceAndEnter:(NSString *)str{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
