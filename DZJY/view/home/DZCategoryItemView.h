//
//  DZCategoryItemView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCategoryItemView : UIView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, copy)void (^selectIndex)(NSInteger );
- (void)setVarityTitle:(NSString *)title;
- (void)setSpecificationTitle:(NSString *)title;
- (void)setCityTitle:(NSString *)title;
@end


@interface DZCategoryItemSelectView: UIView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, assign)BOOL isSelected;
@end
