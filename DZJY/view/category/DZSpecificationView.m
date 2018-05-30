//
//  DZSpecificationView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSpecificationView.h"
#import "DZSpecificationCollectionViewCell.h"
#import "DZCommenCollectionHeaderView.h"

@interface DZSpecificationView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    UICollectionView *_collectionV;
    UIView *_backView;
    UIButton *cancelBtn;
    UIButton *sureBtn;
    NSMutableArray *_commSetAttrildArr;
    NSMutableArray *_commAttrildArr;
    NSMutableArray *_commAttribtValArr;
}
@end

@implementation DZSpecificationView

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
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT - DZ_TOP - 43) * 0.7 + 63)];
        _backView.backgroundColor = UIWhiteColor;
        [self addSubview:_backView];
        [self configCollectionV];
        self.alpha = 0;
        self.hidden = YES;
        [self configTwoBtn];
        
        _commAttrildArr = [NSMutableArray array];
        _commSetAttrildArr = [NSMutableArray array];
        _commAttribtValArr = [NSMutableArray array];
    }
    return self;
}

- (void)configCollectionV{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 3;
    //    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 42)/3, 43);
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 42);
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT - DZ_TOP - 43) * 0.7) collectionViewLayout:layout];
//    _collectionV.height = 0;
    _collectionV.showsVerticalScrollIndicator = NO;
    _collectionV.backgroundColor = UIWhiteColor;
    [_backView addSubview:_collectionV];
    _collectionV.dataSource = self;
    _collectionV.delegate = self;
    [_collectionV registerClass:[DZSpecificationCollectionViewCell class] forCellWithReuseIdentifier:@"mineCell"];
    [_collectionV registerClass:[DZCommenCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view"];
}
- (void)configTwoBtn{
    cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(20, 0, (SCREEN_WIDTH - 50)/2, 43);
    cancelBtn.bottom = _backView.height - 10;
    cancelBtn.layer.masksToBounds = YES;
    cancelBtn.layer.cornerRadius = 5.0f;
    cancelBtn.layer.borderWidth = 1.0f;
    cancelBtn.layer.borderColor = RGBCOLOR(119, 119, 119).CGColor;
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:RGBCOLOR(119, 119, 119) forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_backView addSubview:cancelBtn];
    [cancelBtn addTarget:self action:@selector(setSelfHide) forControlEvents:UIControlEventTouchUpInside];
    
    sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(cancelBtn.right + 20, 0, (SCREEN_WIDTH - 50)/2, 43);
    sureBtn.bottom = _backView.height - 10;
    sureBtn.layer.masksToBounds = YES;
    sureBtn.layer.cornerRadius = 5.0f;
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:RGBCOLOR(255, 255, 255) forState:UIControlStateNormal];
    [sureBtn setBackgroundColor:UICommonColor];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_backView addSubview:sureBtn];
    [sureBtn addTarget:self action:@selector(tapSure) forControlEvents:UIControlEventTouchUpInside];
}
#pragma collectionV delegate and dataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZSpecificationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCell" forIndexPath:indexPath];
    DZSpecificationModel *model = self.dataSource[indexPath.section];
    [cell setContentModel:model indexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    DZCommenCollectionHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view" forIndexPath:indexPath];
    DZSpecificationModel *model = self.dataSource[indexPath.section];
    view.titleLabel.text = model.commAttribtName;
    return view;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    DZSpecificationModel *model = _dataSource[section];
    return [model.dictTaxt count]   ;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [_dataSource count];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 11, 0, 11);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DZSpecificationModel *model = self.dataSource[indexPath.section];
    model.currentIndex = indexPath.item;
    [_collectionV reloadData];
    
    if (model.currentSection == -1) {
        [_commSetAttrildArr addObject:model.attribtId];
        [_commAttrildArr addObject:model.id];
        [_commAttribtValArr addObject:@(indexPath.item + 1)];
        model.currentSection = [_commAttribtValArr count] - 1;
    }else{
        _commAttribtValArr[model.currentSection] = @(indexPath.item + 1);
    }

}

- (void)setAnimation{
    self.hidden = NO;
//    _backView.height = 0;
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 1;
//        _collectionV.height = (SCREEN_HEIGHT - DZ_TOP - 43) * 0.7;
//        _backView.height = (SCREEN_HEIGHT - DZ_TOP - 43) * 0.7 + 63;
//        [_backView addSubview:sureBtn];
//        [_backView addSubview:cancelBtn];
    } completion:^(BOOL finished) {
//        [_backView addSubview:sureBtn];
//        [_backView addSubview:cancelBtn];
    }];
}
- (void)setSelfHide{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
//        [cancelBtn removeFromSuperview];
//        [sureBtn removeFromSuperview];
    }];
}

- (void)tapSure{
    if (_selectBlock) {
        _selectBlock(_commSetAttrildArr, _commAttrildArr, _commAttribtValArr);
        [_commSetAttrildArr removeAllObjects];
        [_commAttrildArr removeAllObjects];
        [_commAttribtValArr removeAllObjects];
    }
    [self setSelfHide];
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    [_collectionV reloadData];
}

@end

@implementation DZSpecificationModel

@end
