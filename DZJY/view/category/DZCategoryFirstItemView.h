//
//  DZCategoryFirstItemView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCategoryFirstItemView : UIView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, copy)void (^selectIndex)(NSInteger index);
- (void)setAddressName:(NSString *)name;
- (void)setSelectedNone;
- (void)setSelectedCity;
- (void)setSelectedOrder;
@end
