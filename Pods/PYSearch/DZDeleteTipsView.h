//
//  DZDeleteTipsView.h
//  DZJY
//
//  Created by wangaiguo on 2018/6/5.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZDeleteTipsView : UIView
@property (nonatomic, copy)void (^deleteBlock)(void);
@end
