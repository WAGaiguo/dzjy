//
//  DZMineCommenScrollView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMineCommenScrollView : UIView
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)NSArray *dataSource;
@property (nonatomic, strong)NSMutableArray *tableArr;
@property (nonatomic, assign)NSInteger me_height;
@property (nonatomic, copy)void (^scrollBlock)(NSInteger num);
@end
