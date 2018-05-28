//
//  DZHomeCategoryView.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/18.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZHomeCategoryView.h"
#import "DZCategoryAllAdapter.h"
#import "DZCategoryAllCell.h"
#import "DZCategoryCollectionViewCell.h"
#import "DZCategoryAllHeaderView.h"
#import "DZCategoryAllController.h"

@interface DZHomeCategoryView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    
    DZCategoryAllAdapter *_adapter;
    DZCategoryAllHeaderView *_headerV;
    UITableView *_tableView;
}
@property(nonatomic, strong) NSString *firstId;
@property(nonatomic, strong) NSString *firstName;
@property(nonatomic, assign)NSInteger selectRow;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *collectionData;
@property(nonatomic, strong)UICollectionView *collectionV;
@end

@implementation DZHomeCategoryView

-(instancetype)init{
    self = [super init];
    if (self) {

        [self afterView];
        [self requestData];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self afterView];
        [self requestData];
    }
    return self;
}
- (void)afterView{
    // 初始化赋值
    _firstName = @"水果";
    _firstId = @"id";
    
    [self configLeftTable];
    [self configCollection];
    [self configCollectionHeader];
}
- (void)configLeftTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43) style:UITableViewStyleGrouped];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.showsVerticalScrollIndicator = NO;
    self.tableView.frame = CGRectMake(0, 0, 115, SCREEN_HEIGHT - DZ_TOP - 44);
    self.tableView.separatorColor = UISeperatorColor;
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setBackgroundColor:UIBackgroundColor];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
//        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self addSubview:_tableView];
    _adapter = [[DZCategoryAllAdapter alloc]init];
    [self.tableView setAdapter:_adapter];
    WEAK_SELF
    [_adapter setDidCellSelected:^(DZCategoryAllCell * cell, NSIndexPath *indexPath) {
        DZCategoryAllCell *cellBefore = [me.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:me.selectRow inSection:0]];
        [cellBefore setIsSelected:NO];
        [cell setIsSelected:YES];
        me.selectRow = indexPath.row;
        _firstId = cell.cid;
        _firstName = cell.titleLabel.text;
        _collectionData = self.dataSource[indexPath.row][@"children"];
        [me.collectionV reloadData];
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
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH - 115, 42);
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(115, 0, SCREEN_WIDTH - 115, SCREEN_HEIGHT - DZ_TOP - 43) collectionViewLayout:layout];
    _collectionV.showsVerticalScrollIndicator = NO;
    _collectionV.backgroundColor = UIWhiteColor;
    [self addSubview:_collectionV];
    _collectionV.dataSource = self;
    _collectionV.delegate = self;
    _collectionV.userInteractionEnabled = YES;
    [_collectionV registerClass:[DZCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"categoryCell"];
    [_collectionV registerClass:[DZCategoryCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"categoryHeader"];
}
- (void)configCollectionHeader{
    _headerV = [[DZCategoryAllHeaderView alloc]init];
    [_collectionV setContentInset:UIEdgeInsetsMake(47, 0, 0, 0)];
    _headerV.left = 0;
    _headerV.top = -47;
    WEAK_SELF
    [_headerV setTapBlock:^{
        if (me.tapAllBlock) {
            me.tapAllBlock(me.firstId, me.firstName);
        }
    }];
    [_collectionV addSubview:_headerV];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _collectionData.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_collectionData != nil) {
        if (![_collectionData[section][@"children"] isEqual:[NSNull null]]) {
            return [_collectionData[section][@"children"] count];
        }
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"categoryCell" forIndexPath:indexPath];
    NSDictionary *dicItem = [_collectionData[indexPath.section][@"children"] objectAtIndex:indexPath.item];
    [cell setContent:dicItem];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dicItem = [_collectionData[indexPath.section][@"children"] objectAtIndex:indexPath.item];
    CGFloat len = [dicItem[@"name"] description].length;
    return CGSizeMake(len * 13 + 30, 32);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    DZCategoryCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"categoryHeader" forIndexPath:indexPath];
    __weak DZCategoryCollectionReusableView *weak_view = view;
    [view setTapHeaderBlock:^(NSString *cid) {
        if (_tapHeaderBlock) {
            _tapHeaderBlock(cid, weak_view.titleLabel.text);
        }
    }];
    [view setContent:_collectionData[indexPath.section]];
    return view;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 16, 0, 16);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    DZCategoryCollectionViewCell *cell = (DZCategoryCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (_tapItemBlock) {
        _tapItemBlock(cell.cid, cell.titleBtn.titleLabel.text);
    }
}
- (void)removeSelfFromSuperview{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)requestData{
    DZResponseHandler *handler = [DZResponseHandler new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        [_adapter reloadData:obj];
        self.dataSource = obj;
        _collectionData = [[obj objectAtIndex:0] objectForKey:@"children"];
        [_collectionV reloadData];
    }];
    [handler setDidFailed:^(DZRequestMananger *manager) {
        NSLog(@"---失败---");
    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory getFileByName]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
@end
