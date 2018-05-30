//
//  DZVarietyView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZVarietyView.h"
#import "DZVarietyCollectionViewCell.h"


@interface DZVarietyView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    UICollectionView *_collectionV;
}
@end

@implementation DZVarietyView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)];
        backImageV.backgroundColor = UIBlackColor;
        backImageV.alpha = 0.5;
        [self addSubview:backImageV];
        backImageV.userInteractionEnabled = YES;
        [backImageV bk_whenTapped:^{
            [self setSelfHide];
        }];
        [self configCollectionV];
        self.alpha = 0;
        self.hidden = YES;
    }
    return self;
}

- (void)configCollectionV{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 4;
//    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 42)/3, 43);
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 20);
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0) collectionViewLayout:layout];
    _collectionV.height = 
    _collectionV.showsVerticalScrollIndicator = NO;
    _collectionV.backgroundColor = UIWhiteColor;
    [self addSubview:_collectionV];
    _collectionV.dataSource = self;
    _collectionV.delegate = self;
    [_collectionV registerClass:[DZVarietyCollectionViewCell class] forCellWithReuseIdentifier:@"mineCell"];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZVarietyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCell" forIndexPath:indexPath];
    NSDictionary *dic = _dataSource[indexPath.row];
    [cell.titleBtn setTitle:[dic[@"variName"] description] forState:UIControlStateNormal];
    cell.titleId = [dic[@"id"] description];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataSource.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 11, 0, 11);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = _dataSource[indexPath.row];
    if (_selectIndex) {
        _selectIndex([dic[@"variName"] description], [dic[@"id"] description]);
    }
}

// *** 数据处理 ***
- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    [_collectionV reloadData];
}

- (void)setAnimation{
    self.hidden = NO;
    _collectionV.height = 0;
    CGFloat height = ((_dataSource.count / 3 + 1) * 40 + 40) > ((SCREEN_HEIGHT - DZ_TOP - 44) * 7 / 10 ) ? (SCREEN_HEIGHT - DZ_TOP - 44) * 7 / 10  : ((_dataSource.count / 3 + 1) * 40 + 40);
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 1;
        _collectionV.height = height;
    }];
}
- (void)setSelfHide{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
         self.hidden = YES;
    }];
}
@end
