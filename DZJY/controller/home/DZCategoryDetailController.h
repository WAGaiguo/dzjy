//
//  DZCategoryDetailController.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewController.h"

@interface DZCategoryDetailController : DZTableViewController
@property (nonatomic, strong)NSString *thirdId;
@property (nonatomic, strong)NSString *navTitle;
@property (nonatomic, strong)NSString *searchTitle;
// 上级菜单传过来的分类数据源
@property (nonatomic, strong)NSArray *categoryDataArr;
// 品种数据源
@property (nonatomic, strong)NSArray *varietyDataArr;
@end
