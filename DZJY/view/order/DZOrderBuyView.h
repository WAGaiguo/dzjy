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
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *numsTopLabel;
@property (nonatomic, strong) UILabel *numsBottomLabel;
@property (nonatomic, strong) UILabel *unitLabel;

@property (nonatomic, copy)void(^tapBuyBlock)(double nums);
- (void)setContentDic:(NSDictionary *)dic;
- (void)animation;
@end

@interface DZOrderBuyBtnView: UIView
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, copy)void (^tapBlcok)(void);
@end
