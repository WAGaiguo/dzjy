//
//  DZMyDeliveryAbnormalCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/15.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DZLeftTob2Label;
@interface DZMyDeliveryAbnormalCell : UITableViewCell
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *stateLabel;
@property (nonatomic, strong)UILabel *applyTopLabel;
@property (nonatomic, strong)UILabel *applayBottomLabel;
@property (nonatomic, strong)UILabel *objectionTypeLabel;
@property (nonatomic, strong)DZLeftTob2Label *reasonLabel;
@property (nonatomic, strong)UILabel *contractTopLabel;
@property (nonatomic, strong)UILabel *contractBottomLabel;
@property (nonatomic, strong)UILabel *companyLabel;
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIImageView *imageV1;
@property (nonatomic, strong)UIImageView *imageV2;
@property (nonatomic, strong)UIImageView *imageV3;
@property (nonatomic, strong)UIImageView *imageV4;
@property (nonatomic, strong)UIImageView *imageV5;
@property (nonatomic, copy)void(^callBlock)(void);
- (void)setContent:(NSDictionary *)dic;
@end

@interface DZLeftTob2Label:UILabel
@end
