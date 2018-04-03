//
//  DZMineCollectionViewCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineCollectionViewCell.h"

@implementation DZMineCollectionViewCell
- (instancetype)init{
    self = [super init];
    if (self) {
        _imageV = [[UIImageView alloc]init];
        [self addSubview:_imageV];  _imageV.sd_layout.widthIs(50).heightIs(50).centerXEqualToView(self).centerYEqualToView(self);
        _imageV.backgroundColor = UIWhiteColor;
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageV = [[UIImageView alloc]init];
        [self addSubview:_imageV];  _imageV.sd_layout.widthIs(50).heightIs(50).centerXEqualToView(self).centerYEqualToView(self);
        _imageV.backgroundColor = UIWhiteColor;
    }
    return self;
}
@end
