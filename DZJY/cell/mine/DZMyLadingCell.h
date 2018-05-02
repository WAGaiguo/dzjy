//
//  DZMyLadingCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyLadingCell : UITableViewCell
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *stateLabel;
@property (nonatomic, strong)UILabel *companyLabel;
@property (nonatomic, strong)UIView *backView;

@property (nonatomic, strong)UILabel *titleLabel1;
@property (nonatomic, strong)UILabel *titleLabel2;
@property (nonatomic, strong)UILabel *methodsLabel;
@property (nonatomic, strong)UILabel *addressLabel;
@property (nonatomic, strong)UILabel *personLabel;
@property (nonatomic, strong)UILabel *carLabel;

@property (nonatomic, copy)void(^callBlock)(void);
@end
