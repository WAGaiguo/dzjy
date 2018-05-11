//
//  DZMyMembersCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMyMembersCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLeftLabel;
@property (nonatomic, strong)UILabel *titleRightLabel;
- (void)setAccountContent:(NSIndexPath *)indexPath;
- (void)setCompanyContent:(NSIndexPath *)indexPath;
- (void)setConnectContent:(NSIndexPath *)indexPath;
@property (nonatomic, strong)NSDictionary *dic;
@end

@interface DZMyMembersLogoCell: UITableViewCell
@property (nonatomic, strong)UIImageView *imageV;
@end
