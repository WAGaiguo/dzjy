//
//  DZHomeCategoryView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZHomeCategoryView : UIView
@property (nonatomic, strong)NSArray *dataSource;
@property (nonatomic, copy)void (^tapItemBlock)(NSString *cid, NSString *title, NSArray *commVarietList);
@property (nonatomic, copy)void (^tapHeaderBlock)(NSString *cid, NSString *title);
@property (nonatomic, copy)void (^tapAllBlock)(NSString *cid, NSString *title);
- (void)removeSelfFromSuperview;
@end
