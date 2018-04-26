//
//  DZVarietyCollectionViewCell.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZVarietyCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *titleBtn;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL isSelected;
@end
