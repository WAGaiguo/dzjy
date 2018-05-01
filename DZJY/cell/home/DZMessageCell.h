//
//  DZMessageCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZMessageAdapter.h"

@interface DZMessageCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UIImageView *imageFolder;
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, assign)BOOL isFolder;
@property (nonatomic, strong)DZMessageModel*model;
- (void)setContent:(DZMessageModel *)content;
@end
