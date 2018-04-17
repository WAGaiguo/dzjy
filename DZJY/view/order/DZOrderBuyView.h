//
//  DZOrderBuyView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/16.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZOrderBuyView : UIView
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *numsTopLabel;
@property (nonatomic, strong) UILabel *numsBottomLabel;

@property (nonatomic, copy)void(^tapBuyBlock)(NSInteger nums);
@end
