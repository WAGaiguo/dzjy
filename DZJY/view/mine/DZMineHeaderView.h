//
//  DZMineHeaderView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMineHeaderView : UIView
@property (nonatomic, assign)BOOL logined;
- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle img:(NSString *)imageUrl;
@property (nonatomic, copy)void (^loginBlock)(void);
@property (nonatomic, copy)void (^selectBlock)(NSInteger integer);
@end

@class DZMemberLabel;
@interface DZMineLoginedView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *titleImageV;
@property (nonatomic, strong) DZMemberLabel *memberLabel;
@end

@interface DZMineUnLoginedView : UIView
@property (nonatomic, copy) void(^loginBlock)(void);
@end
