//
//  DZMyContractAbormalCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/28.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyContractAbormalCell : UITableViewCell
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *stateLabel;
@property (nonatomic, strong)UILabel *applyTopLabel;
@property (nonatomic, strong)UILabel *applayBottomLabel;
@property (nonatomic, strong)UILabel *reasonLabel;
@property (nonatomic, strong)UILabel *contractTopLabel;
@property (nonatomic, strong)UILabel *contractBottomLabel;
@property (nonatomic, strong)UILabel *companyLabel;
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, copy)void(^callBlock)(void);
@end
