//
//  DZSearchView.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZSearchView : UIView
@property (nonatomic, copy)void (^tapBlock)(void);
- (void)setPlaceholder:(NSString *)text;
@end
