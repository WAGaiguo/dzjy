//
//  DZMyBoughtCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MyBoughtType) {
    MyBoughtTypeNormal,
    MyBoughtTypeRevocation,
    MyBoughtTypePass,
};
@interface DZMyBoughtCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *currentsLabel;
@property (nonatomic, strong) UILabel *newsLabel;
@property (nonatomic, assign) MyBoughtType type;

- (void)setCellConttent:(NSDictionary *)dic;
@end
