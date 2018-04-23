//
//  DZBaseViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTitleView.h"

@interface DZBaseViewController : UIViewController

- (DZTitleView *)titleView;

@property (nonatomic,assign)BOOL backEnabled;

- (void)back;

@property (nonatomic,assign)BOOL hasRightBtn;

- (void)setBackImageGray;
- (void)setHeaderBackGroud:(BOOL)has;

- (void)setRightImage:(NSString *)image;

@end
