//
//  DZTitleView.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZTitleView : UIView

@property (nonatomic,strong,readonly)UIButton *leftView;
@property (nonatomic, strong, readonly)UIButton *rightView;

@property (nonatomic,assign)NSInteger contentPadding;
@property (nonatomic, strong)NSString *title;

@property (nonatomic,assign)BOOL backEnabled;

@end
