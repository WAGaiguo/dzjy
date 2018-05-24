//
//  DZMineHeaderView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineHeaderView.h"
#import "DZHomeItemView.h"
#import "DZMemberLabel.h"
@interface DZMineHeaderView(){
    DZMineLoginedView *_loginView;
    DZMineUnLoginedView *_unLoginView;
    DZHomeItemView *_itemView;
}
@end

@implementation DZMineHeaderView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self afterView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self afterView];
    }
    return self;
}

// 四个我的相关按钮
- (void)afterView{
    [self setHeight:292];
    [self setWidth:SCREEN_WIDTH];
    _itemView = [[DZHomeItemView alloc]initWithFrame:CGRectMake(7, 180, SCREEN_WIDTH - 14, 105)];
    _itemView.dataSource = @[@{@"title":@"我的资金", @"image":@"我的资金"},
                             @{@"title":@"我的客户", @"image":@"我的客户"},
                             @{@"title":@"我的关注", @"image":@"我的关注"},
                             @{@"title":@"我的积分", @"image":@"我的积分"}];
    [self addSubview:_itemView];
    WEAK_SELF
    [_itemView setSelectIndex:^(NSIndexPath *indexPath) {
        if (me.selectBlock) {
            me.selectBlock(indexPath.row);
        }
    }];
    
}
- (void)setLogined:(BOOL)logined{
    _logined = logined;
    if(logined){
        if (_unLoginView != nil) {
            [_unLoginView removeFromSuperview];
            _unLoginView = nil;
        }
        if (_loginView == nil) {
            _loginView = [[DZMineLoginedView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 165)];
            [self addSubview:_loginView];
        }
    }else{
        if (_loginView != nil) {
            [_loginView removeFromSuperview];
            _loginView = nil;
        }
        if (_unLoginView == nil) {
            _unLoginView = [[DZMineUnLoginedView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 165)];
            [self addSubview:_unLoginView];
            WEAK_SELF
            [_unLoginView setLoginBlock:^{
                if (me.loginBlock) {
                    me.loginBlock();
                }
            }];
        }
    }
}
- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle img:(NSString *)imageUrl type:(NSString *)type{
    _loginView.subTitleLabel.text = subTitle;
    [_loginView.titleImageV sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"默认头像"]];
    [_loginView.titleLabel setText:[[DZUserManager manager] user].loginName];
    [_loginView.memberLabel setText:type];
}

@end

/**
 登录
 **/
#import "DZMemberLabel.h"
@implementation DZMineLoginedView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mineHeaderBackG"]];
        imageV.width = SCREEN_WIDTH;
        imageV.top = 0;
        imageV.left = 0;
        [self addSubview:imageV];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 20)];
        _titleLabel.textColor = UIWhiteColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _titleLabel.bottom + 7, SCREEN_WIDTH, 14)];
        _subTitleLabel.font = [UIFont systemFontOfSize:11];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.textColor = UIWhiteColor;
        [self addSubview:_subTitleLabel];
        
        _titleImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"默认头像"]];
        _titleImageV.bottom = imageV.bottom + 10;
        _titleImageV.centerX = SCREEN_WIDTH/2.0;
        [self addSubview:_titleImageV];
        
        _memberLabel = [[DZMemberLabel alloc]init];
        _memberLabel.centerX = SCREEN_WIDTH/2.0;
        _memberLabel.centerY = _titleImageV.bottom - 8;
        [self addSubview:_memberLabel];
        
        // 数据填充
        if ([[DZUserManager manager] isLogined]) {
//            [_memberLabel setType:[[[DZUserManager manager] user].userType integerValue]];
            [_titleLabel setText:[[DZUserManager manager] user].loginName];
        }
 
    }
    return self;
}
@end

/**
 未登录
 **/
@implementation DZMineUnLoginedView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mineHeaderBackG"]];
        imageV.width = SCREEN_WIDTH;
        imageV.top = 0;
        imageV.left = 0;
        [self addSubview:imageV];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.width = 130;
        btn.height = 30;
        [btn setTitle:@"点击登录" forState:UIControlStateNormal];
        [btn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 1.0f;
        btn.layer.borderColor = UIWhiteColor.CGColor;
        btn.centerX = SCREEN_WIDTH/2.0;
        btn.centerY = 100;
        [self addSubview:btn];
        [btn bk_addEventHandler:^(id sender) {
            if (_loginBlock) {
                _loginBlock();
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
@end
