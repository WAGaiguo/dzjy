//
//  DZMineFooterView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMineFooterView.h"
#import "SVSegmentedView.h"

@interface DZMineFooterView()<SVSegmentedViewDelegate, UIScrollViewDelegate>{
    SVSegmentedView *_segmentView;
    UIScrollView *_scrollView;
    UIView *_firstView;
}
@end
@implementation DZMineFooterView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setWidth:SCREEN_WIDTH];
        [self setHeight:350];
        [self setBackgroundColor:UIWhiteColor];
        [self configTopItem];
        [self configBottomItem];
    }
    return self;
}

-(void)configTopItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    _segmentView.titles = @[@"挂牌交易", @"长期协议", @"集合采购"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(153, 153, 153);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    [self addSubview:_segmentView];
}
- (void)segmentedDidChange:(NSInteger) index{
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
-(void)configBottomItem{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 300)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, 300);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    _firstView = [[UIView alloc]initWithFrame:_scrollView.frame];
    [_scrollView addSubview:_firstView];
    _firstView.top = 0;
    [self makeLeft];
    [self makeRight];
}
- (void)makeLeft{
    NSArray *arr = @[@{@"title":@"我的求购", @"image":@"我的求购"},
                     @{@"title":@"我的订单", @"image":@"我的订单"},
                     @{@"title":@"我的合同", @"image":@"我的合同"},
                     @{@"title":@"我的交收", @"image":@"我的交收"}];
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZMineFooterLeftItem *item = [[DZMineFooterLeftItem alloc]initWithFrame:CGRectMake(0, 75 * idx, SCREEN_WIDTH/4.0, 75)];
        [item setIndexItemDetail:obj];
        [_firstView addSubview:item];
        [item bk_whenTapped:^{
            if (_tapLeftBlock) {
                _tapLeftBlock(idx);
            }
        }];
    }];
}
- (void)makeRight{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        _segmentView.selectedIndex = (scrollView.contentOffset.x +SCREEN_WIDTH/2)/SCREEN_WIDTH;
    }
    
}
@end

@implementation DZMineFooterLeftItem
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

@implementation DZmineFooterRightItem
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
@end

