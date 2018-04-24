//
//  DZMineCommenScrollView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/24.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineCommenScrollView.h"

@interface DZMineCommenScrollView()<UIScrollViewDelegate>
{
    
}
@end

@implementation DZMineCommenScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 44)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        [self addSubview:_scrollView];
        _scrollView.delegate = self;
     
        
       
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    if (dataSource.count > 0) {
        _tableArr = [NSMutableArray array];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _dataSource.count, SCREEN_HEIGHT - DZ_TOP - 44);
        [_dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(idx * SCREEN_WIDTH, 0, SCREEN_WIDTH , SCREEN_HEIGHT - DZ_TOP - 44)];
            table.backgroundColor = UIBackgroundColor;
            table.sectionFooterHeight = 0;
            table.sectionHeaderHeight = 0;
            table.showsVerticalScrollIndicator = NO;
            table.separatorStyle = UITableViewCellSeparatorStyleNone;
            [_scrollView addSubview:table];
            [_tableArr addObject:table];
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_scrollView == scrollView) {
        if (_scrollBlock) {
            _scrollBlock((scrollView.contentOffset.x +SCREEN_WIDTH/2)/SCREEN_WIDTH);
        }
    }
}
@end
