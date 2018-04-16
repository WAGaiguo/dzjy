//
//  DZCityCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCityCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, assign)BOOL isSelected;
@end

@interface DZProvinceCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, assign)BOOL isSelected;
- (void)setContent:(NSDictionary *)dic;
@end
