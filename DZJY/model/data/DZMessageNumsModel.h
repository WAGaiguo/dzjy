//
//  DZMessageNumsModel.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZMessageNumsModel : NSObject
- (void)startRequest;
@property (nonatomic, strong)NSMutableDictionary *dataDic;
@property (nonatomic, copy)void(^successBlock)(NSDictionary *dic);
@property (nonatomic, copy)void(^faildBlock)(void);
@end
