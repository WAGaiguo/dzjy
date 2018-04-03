//
//  DZMineCollectionReusableView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZMineCollectionReusableView : UICollectionReusableView

@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, copy)void (^tapBlock)(void);

@end
