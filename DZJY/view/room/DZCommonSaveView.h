//
//  DZCommonSaveView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCommonSaveView : UIView
@property (nonatomic, copy)void (^saveBlock)(void);
@end
