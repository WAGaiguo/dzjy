//
//  DZOrderCheckCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZOrderCheckCell : UITableViewCell
@property (nonatomic, strong)UILabel *companyLabel;
@property (nonatomic, strong)UILabel *personLabel;
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *priceLabel;

@property (nonatomic, strong)UILabel *startNumsLabel;
@property (nonatomic, strong)UILabel *buyNumsLabel;
@property (nonatomic, strong)UILabel *totalMoneyLabel;
@property (nonatomic, strong)UILabel *moneyLabel1;
@property (nonatomic, strong)UILabel *moneyLabel2;
@property (nonatomic, strong)UILabel *moneyLabel3;
@property (nonatomic, strong)UILabel *orderNums;
@property (nonatomic, strong)UILabel *sellerName;
- (void)setContent:(NSDictionary *)dic;
@end
