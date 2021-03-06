//
//  DZVarietyView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZVarietyView : UIView

@property (nonatomic, copy)void (^selectIndex)(NSString *title, NSString *titleId);
@property (nonatomic, strong)NSArray *dataSource;
- (void)setAnimation;
- (void)setSelfHide;
@end
