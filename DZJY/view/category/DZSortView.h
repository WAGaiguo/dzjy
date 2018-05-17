//
//  DZSortView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZSortView : UIView
@property (nonatomic, copy)void (^tapSelect)(NSInteger num, NSString *name);
- (void)setAnimation;
- (void)setSelfHide;
@end

@interface DZSortItemView: UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) BOOL isSelected;
@end
