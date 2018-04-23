//
//  DZMineFooterView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMineFooterView : UIView
@property (nonatomic, copy)void (^tapLeftBlock)(NSInteger num);
@property (nonatomic, copy)void (^tapRightBlock)(NSInteger num);
@end

@interface DZMineFooterLeftItem: UIView
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)setIndexItemDetail:(NSDictionary *)dic;
@end

@interface DZmineFooterRightItem: UIView
@end
