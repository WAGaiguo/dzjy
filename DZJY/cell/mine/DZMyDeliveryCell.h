//
//  DZDeliveryCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, DZPayState) {
    DZPayState1,
    DZPayState2,
    DZPayStateAll,
};
@interface DZMyDeliveryCell : UITableViewCell
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *stateLabel;
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *dealLabel;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UILabel *companyLabel;
@property (nonatomic, copy)void(^callBlock)(void);
@end
