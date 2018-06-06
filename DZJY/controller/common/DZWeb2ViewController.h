//
//  DZWeb2ViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/17.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZBaseViewController.h"

// *** 挂牌详情页面 ***
@interface DZWeb2ViewController : DZBaseViewController
@property (nonatomic, strong)NSString *navigationTitle;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSDictionary *dic;
@property (nonatomic, assign)float buyCount;
@end
