//
//  DZMessageAdapter.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewAdapter.h"

@interface DZMessageAdapter : DZTableViewAdapter

@end

// message content模型封装
@interface DZMessageModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, assign)BOOL isFolder;
@property (nonatomic, assign)CGFloat height;
- (void)hightForContent:(NSString *)content;
@end

