//
//  DZCalendarViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZCalendarViewController : DZBaseViewController
@property (nonatomic, copy)void (^dateBlock)(NSString *fromDate, NSString *toDate);
@end
