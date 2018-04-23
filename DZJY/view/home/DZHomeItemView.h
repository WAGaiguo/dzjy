//
//  DZHomeItemView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZHomeItemView : UIView
@property (nonatomic, copy)void (^selectIndex)(NSIndexPath *);
@property (nonatomic, strong)NSArray *dataSource;
@end

@interface DZHomeItemCell: UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)setIndexItemDetail:(NSDictionary *)dic;
@end
