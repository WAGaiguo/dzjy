//
//  DZSearchModel.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/12.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PYSearch/PYSearchViewController.h>

typedef void(^PYDidSearchBlock)(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText);

@interface DZSearchModel : NSObject
@property (nonatomic, copy)PYDidSearchBlock block;

+ (void)makeSearchViewController:(UIViewController *)controller;
@end
