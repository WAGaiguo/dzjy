//
//  DZHomeItemView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/3.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeItemView.h"

@interface DZHomeItemView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    UICollectionView *_collectV;
}
@end

@implementation DZHomeItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4.0 - 1, 99);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 0;
        _collectV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) collectionViewLayout:layout];
        _collectV.delegate = self;
        _collectV.dataSource = self;
        [self addSubview:_collectV];
        [_collectV registerClass:[DZHomeItemCell class] forCellWithReuseIdentifier:@"homeItem"];
        _collectV.backgroundColor = UICyanColor;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeItem" forIndexPath:indexPath];
    cell.titleLabel.text = @"title";
    cell.backgroundColor = UIRedColor;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectIndex) {
        _selectIndex(indexPath);
    }
}

@end

@implementation DZHomeItemCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageV = [[UIImageView alloc]init];
        _imageV.width = 50;
        _imageV.height = 50;
        _imageV.centerX = SCREEN_WIDTH/8.0;
        _imageV.centerY = 35 ;
        [self addSubview:_imageV];
//    _imageV.sd_layout.widthIs(50).heightIs(50).centerXEqualToView(self).centerYEqualToView(self);
        _imageV.backgroundColor = UIGrayColor;
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _imageV.bottom + 10, self.width, 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"test";
        [self addSubview:_titleLabel];
    }
    return self;
}
@end



