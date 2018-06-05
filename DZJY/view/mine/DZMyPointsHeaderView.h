//
//  DZMyPointsHeaderView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyPointsHeaderView : UIView
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *pointsLabel;
@property (nonatomic, copy)void (^tapBlock)(void);
- (void)setTopContent:(NSString *)str;
- (void)setBottomContent:(NSString *)str;
- (void)setBottomFundContent:(NSString *)disb reve:(NSString *)reve;
@end
