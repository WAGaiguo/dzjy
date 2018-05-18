//
//  DZSearchResultViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewController.h"

@interface DZSearchResultViewController : DZTableViewController
@property (nonatomic, strong)NSString *searchTitle;
@property (nonatomic, strong)NSString *categoryTitle;

// 一级分类
@property (nonatomic, strong)NSString *commFirstId;
// 二级分类
@property (nonatomic, strong)NSString *commCateSecondId;
// 三级分类
@property (nonatomic, strong)NSString *commCatgId;
@end
