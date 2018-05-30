//
//  DZSpecificationCollectionViewCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DZSpecificationModel;
@interface DZSpecificationCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *titleBtn;
@property (nonatomic, assign) BOOL isSelected;
- (void)setContentModel:(DZSpecificationModel *)model indexPath:(NSIndexPath *)indexPath;
@end
