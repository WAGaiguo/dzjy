//
//  DZCategoryCollectionViewCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCategoryCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *titleBtn;
@end

@interface DZCategoryCollectionReusableView: UICollectionReusableView
@property (nonatomic, strong) UILabel *titleLabel;
@end
