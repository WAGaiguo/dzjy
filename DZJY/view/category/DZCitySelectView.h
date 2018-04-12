//
//  DZCitySelectView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCitySelectView : UIView
@property (nonatomic, copy)void (^tapCityBlock)(NSString *nameStr);
- (void)setAnimation;
- (void)setSelfHide;
@end
