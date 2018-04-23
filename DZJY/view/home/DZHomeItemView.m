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
    NSMutableArray *_dataSource;
}
@end

@implementation DZHomeItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIWhiteColor;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 10)/4.0 - 1, 88);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 0;
        _collectV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 14, 186) collectionViewLayout:layout];
        _collectV.delegate = self;
        _collectV.dataSource = self;
        [self addSubview:_collectV];
        [_collectV registerClass:[DZHomeItemCell class] forCellWithReuseIdentifier:@"homeItem"];
        _collectV.backgroundColor = UIWhiteColor;
        
        _dataSource =[NSMutableArray arrayWithArray:
                        @[@{@"title":@"茄果菜类", @"image":@"茄果菜类"},
                        @{@"title":@"瓜果类", @"image":@"瓜果类"},
                        @{@"title":@"叶菜类", @"image":@"叶菜类"},
                        @{@"title":@"甘蓝类", @"image":@"甘蓝类"},
                        @{@"title":@"根茎菜类", @"image":@"根茎菜类"},
                        @{@"title":@"豆菜类", @"image":@"豆菜类"},
                        @{@"title":@"葱姜蒜类", @"image":@"葱姜蒜类"},
                        @{@"title":@"全部菜类", @"image":@"全部菜类"}]];
    }
    return self;
}
/**
 外部数据源更新
 **/
- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = [NSMutableArray arrayWithArray:dataSource];
    _collectV.height = (dataSource.count / 4) * 100;
    [_collectV reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataSource.count;
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeItem" forIndexPath:indexPath];
    [cell setIndexItemDetail:_dataSource[indexPath.item]];
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
        _imageV.width = 48;
        _imageV.height = 48;
        _imageV.centerX = (SCREEN_WIDTH-10)/8.0;
        _imageV.centerY = 44 ;
        [self addSubview:_imageV];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _imageV.bottom + 5, self.width, 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"test";
        [self addSubview:_titleLabel];
    }
    return self;
}
- (void)setIndexItemDetail:(NSDictionary *)dic{
    _titleLabel.text = [dic[@"title"]description];
    _imageV.image = [UIImage imageNamed:[dic[@"image"]description]];
}

@end



