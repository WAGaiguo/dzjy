//
//  DZCategoryAllCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCategoryAllCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, assign) BOOL isSelected;
- (void)setContent:(NSDictionary *)dic;
@end
