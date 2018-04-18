//
//  DZOrderAttentionBuyView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/17.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZOrderAttentionBuyView : UIView
@property (nonatomic, copy)void(^attentionBlock)(void);
@property (nonatomic, copy)void(^buyBlock)(void);
@property (nonatomic, assign)BOOL isAttentioned;
@end
