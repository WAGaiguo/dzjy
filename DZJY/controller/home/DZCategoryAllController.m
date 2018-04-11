//
//  DZCategoryAllController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCategoryAllController.h"
#import "DZCategoryAllAdapter.h"
#import "DZCategoryAllCell.h"
#import "DZCategoryCollectionViewCell.h"
#import "DZCategoryAllHeaderView.h"
#import "DZSearchView.h"
#import "DZCategoryDetailController.h"

@interface DZCategoryAllController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionV;
    DZCategoryAllAdapter *_adapter;
    NSArray *_dataSource;
    DZCategoryAllHeaderView *_headerV;
    
}
@property(nonatomic, assign)NSInteger selectRow;
@end

@implementation DZCategoryAllController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@""];
    _selectRow = 0;
    [self setBackEnabled:YES];
    [self configSearchView];
    [self configLeftTable];
    [self configCollection];
    [self configCollectionHeader];
}
- (void)configSearchView{
    CGFloat s_width = self.titleView.leftView.right;
    DZSearchView *searchV = [[DZSearchView alloc]initWithFrame:CGRectMake(s_width, DZ_TOP - 40, SCREEN_WIDTH - s_width - 40, 40)];
    [self.titleView addSubview:searchV];
}
- (void)configLeftTable{
    self.tableView.width = 115;
    self.tableView.separatorColor = UISeperatorColor;
    _adapter = [[DZCategoryAllAdapter alloc]initWithDataSource:@[@"蔬菜", @"水果"]];
    [self.tableView setAdapter:_adapter];
    WEAK_SELF
    [_adapter setDidCellSelected:^(DZCategoryAllCell * cell, NSIndexPath *indexPath) {
        DZCategoryAllCell *cellBefore = [me.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:me.selectRow inSection:0]];
        [cellBefore setIsSelected:NO];
        [cell setIsSelected:YES];
        me.selectRow = indexPath.row;
    }];
    [_adapter setAfterReuseCell:^(DZCategoryAllCell * cell, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            [cell setIsSelected:YES];
        }
    }];
}

- (void)configCollection{
    DZCustomFlowLayout *layout = [[DZCustomFlowLayout alloc]init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 9;
    layout.maximumInteritemSpacing = 9;
//    layout.minimumInteritemSpacing = 3;
//    layout.itemSize = CGSizeMake(SCREEN_WIDTH/3.0, 100);
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH - 115, 42);
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(115, DZ_TOP, SCREEN_WIDTH - 115, SCREEN_HEIGHT - (DZ_TOP)) collectionViewLayout:layout];
    _collectionV.showsVerticalScrollIndicator = NO;
    _collectionV.backgroundColor = UIWhiteColor;
    [self.view addSubview:_collectionV];
    _collectionV.dataSource = self;
    _collectionV.delegate = self;
    _collectionV.userInteractionEnabled = YES;
    [_collectionV registerClass:[DZCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"mineCell"];
    [_collectionV registerClass:[DZCategoryCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader"];
    
    
}
- (void)configCollectionHeader{
    _headerV = [[DZCategoryAllHeaderView alloc]init];
    [_collectionV setContentInset:UIEdgeInsetsMake(47, 0, 0, 0)];
    _headerV.left = 0;
    _headerV.top = -47;
    WEAK_SELF
    [_headerV setTapBlock:^{
        [me.navigationController pushViewController:[DZCategoryDetailController new] animated:YES];
    }];
    [_collectionV addSubview:_headerV];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCell" forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *str = @"";
//    str.length * 13 + 30;
    return CGSizeMake(64, 32);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    DZCategoryCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader" forIndexPath:indexPath];
    return view;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 16, 0, 16);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[DZCategoryDetailController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

@implementation DZCustomFlowLayout
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //使用系统帮我们计算好的结果。
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    //第0个cell没有上一个cell，所以从1开始
    for(int i = 1; i < [attributes count]; ++i) {
        //这里 UICollectionViewLayoutAttributes 的排列总是按照 indexPath的顺序来的。
        UICollectionViewLayoutAttributes *curAttr = attributes[i];
        UICollectionViewLayoutAttributes *preAttr = attributes[i-1];
        
        NSInteger origin = CGRectGetMaxX(preAttr.frame);
        //根据  maximumInteritemSpacing 计算出的新的 x 位置
        CGFloat targetX = origin + _maximumInteritemSpacing;
        // 只有系统计算的间距大于  maximumInteritemSpacing 时才进行调整
        if (CGRectGetMinX(curAttr.frame) > targetX) {
            // 换行时不用调整
            if (targetX + CGRectGetWidth(curAttr.frame) < self.collectionViewContentSize.width) {
                CGRect frame = curAttr.frame;
                frame.origin.x = targetX;
                curAttr.frame = frame;
            }
        }
    }
    return attributes;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    _maximumInteritemSpacing = 9;
}
@end
