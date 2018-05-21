//
//  DZOrderConfirmCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PPNumberButton.h>
#import <YYLabel.h>
typedef NS_ENUM(NSUInteger, DZPayState) {
    DZPayState1,
    DZPayState2,
    DZPayStateAll,
};
@interface DZOrderConfirmCell : UITableViewCell
@property (nonatomic, strong)UILabel *companyLabel;
@property (nonatomic, strong)UILabel *personLabel;
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *startNumsLabel;
@property (nonatomic, strong)UILabel *buyNumsLabel;
@property (nonatomic, strong)PPNumberButton *numberButton;

@property (nonatomic, strong)UILabel *money1abel;
@property (nonatomic, strong)UILabel *money2Label;
@property (nonatomic, strong)UILabel *money3Label;

@property (nonatomic, strong)NSArray *arr;
- (void)setContent:(NSArray *)arr;
@end
