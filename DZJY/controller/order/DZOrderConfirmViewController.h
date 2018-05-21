//
//  DZOrderConfirmViewController.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewController.h"

@interface DZOrderConfirmViewController : DZTableViewController
@property (nonatomic, assign) NSInteger buyCount;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *membId;
@property (nonatomic, strong) NSDictionary *dataDic;
@end
