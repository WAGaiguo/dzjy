//
//  DZMineFooterView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZmineFooterRightItem;
@interface DZMineFooterView : UIView
@property (nonatomic, copy)void (^tapLeftBlock)(NSInteger num);
@property (nonatomic, copy)void (^tapRightBlock)(NSInteger num);

@property (nonatomic, strong)DZmineFooterRightItem *firstItem;
@property (nonatomic, strong)DZmineFooterRightItem *secondItem;
@property (nonatomic, strong)DZmineFooterRightItem *thirdItem;
@property (nonatomic, strong)DZmineFooterRightItem *fourthItem;
@property (nonatomic, strong)DZmineFooterRightItem *fifthItem;
@property (nonatomic, strong)DZmineFooterRightItem *sixthItem;
@property (nonatomic, strong)DZmineFooterRightItem *seventhItem;
@property (nonatomic, strong)DZmineFooterRightItem *eighthItem;
@property (nonatomic, strong)DZmineFooterRightItem *ninthItem;
@end

@interface DZMineFooterLeftItem: UIView
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)setIndexItemDetail:(NSDictionary *)dic;
@end

@interface DZmineFooterRightItem: UIView
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *numTips;
- (void)setNums:(NSInteger)num;
- (void)setTitle:(NSString *)title image:(NSString *)image;
@end
