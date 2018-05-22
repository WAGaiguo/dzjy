//
//  DZOrderCancelAndPayView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZOrderCancelAndPayView : UIView
@property (nonatomic, copy)void (^cancelBlock)(void);
@property (nonatomic, copy)void (^payBlock)(void);
@end
