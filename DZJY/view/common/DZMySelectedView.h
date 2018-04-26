//
//  DZMySelectedView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMySelectedView : UIView
@property (nonatomic, copy)void (^selectIndex)(NSIndexPath *);
@property (nonatomic, strong)NSArray *dataSource;
- (void)setAnimation;
- (void)setSelfHide;
@property (nonatomic, assign)NSInteger current;
@end
