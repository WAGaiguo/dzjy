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
        [self setHeight:400];
        [self setBackgroundColor:UIWhiteColor];
        [self configTopItem];
        [self configBottomItem];
    }
    return self;
}

-(void)configTopItem{
    _segmentView = [[SVSegmentedView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    _segmentView.titles =  @[@"挂牌交易"]; //@[@"挂牌交易", @"长期协议", @"集合采购"];
    _segmentView.selectedFontColor = RGBCOLOR(254, 82, 0);
    _segmentView.defaultFontColor = RGBCOLOR(153, 153, 153);
    _segmentView.minTitleMargin = 0;
    _segmentView.delegate = self;
    _segmentView.label.hidden = YES; // 隐藏底部 line
    [self addSubview:_segmentView];
    
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(0, 44 - ONE_PIXEL, SCREEN_WIDTH, ONE_PIXEL)];
    lineV.backgroundColor = UISeperatorColor;
    [self addSubview:lineV];
}
- (void)segmentedDidChange:(NSInteger) index{
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}
-(void)configBottomItem{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 400)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 400);//SCREEN_WIDTH * 3
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
/**
 左侧信息展示
 **/
- (void)makeLeft{
    NSArray *arr = @[@{@"title":@"我的求购", @"image":@"我的求购"},
                     @{@"title":@"我的订单", @"image":@"我的订单"},
                     @{@"title":@"我的合同", @"image":@"我的合同"},
                     @{@"title":@"我的交收", @"image":@"我的交收"}];
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZMineFooterLeftItem *item = [[DZMineFooterLeftItem alloc]initWithFrame:CGRectMake(0, 80 * idx, SCREEN_WIDTH/4.0, 80)];
        [item setIndexItemDetail:obj];
        [_firstView addSubview:item];
        [item bk_whenTapped:^{
            if (_tapLeftBlock) {
                _tapLeftBlock(idx);
            }
        }];
    }];
}
/**
 右侧九个按钮
 **/
- (void)makeRight{
    NSInteger item_width = SCREEN_WIDTH * 3/(4*4);
    
    _firstItem = [self rightItemFactory:@"供货意向" image:@"供货意向" frame:CGRectMake(SCREEN_WIDTH/4.0, 0, item_width, 80) num:1];
    
    _secondItem = [self rightItemFactory:@"待支付" image:@"待支付" frame:CGRectMake(SCREEN_WIDTH/4.0, 80, item_width, 80) num:2];
    
    _thirdItem = [self rightItemFactory:@"待交收" image:@"待交收" frame:CGRectMake(SCREEN_WIDTH/4.0, 160, item_width, 80) num:3];
    _fourthItem = [self rightItemFactory:@"待评价" image:@"待评价" frame:CGRectMake(_thirdItem.right, 160, item_width, 80) num:4];
    _fifthItem = [self rightItemFactory:@"异常处理" image:@"异常处理" frame:CGRectMake(_fourthItem.right, 160, item_width, 80) num:5];
    
    _sixthItem = [self rightItemFactory:@"待验货" image:@"待验货" frame:CGRectMake(SCREEN_WIDTH/4.0, 240, item_width, 80) num:6];
    _seventhItem = [self rightItemFactory:@"待验票" image:@"待验票" frame:CGRectMake(_sixthItem.right, 240, item_width, 80) num:7];
    _eighthItem = [self rightItemFactory:@"异常处理" image:@"异常处理" frame:CGRectMake(_seventhItem.right, 240, item_width, 80) num:8];
    _ninthItem = [self rightItemFactory:@"提货单" image:@"提货单" frame:CGRectMake(_eighthItem.right, 240, item_width, 80) num:9];
}
#pragma 工厂模式批量定制右侧item
- (DZmineFooterRightItem *)rightItemFactory:(NSString *)title image:(NSString *)image frame:(CGRect)frame num:(NSInteger)num{
    DZmineFooterRightItem *item = [[DZmineFooterRightItem alloc]initWithFrame:frame];
    [item setTitle:title image:image];
    [_firstView addSubview:item];
    [item bk_whenTapped:^{
        if (_tapRightBlock) {
            _tapRightBlock(num);
        }
    }];
    return item;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        _segmentView.selectedIndex = (scrollView.contentOffset.x +SCREEN_WIDTH/2)/SCREEN_WIDTH;
    }
    
}
@end

#pragma 左侧item
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
        
        UIView *onePixView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4.0 - ONE_PIXEL, _imageV.top, ONE_PIXEL, 68)];
        onePixView.backgroundColor = UISeperatorColor;
        [self addSubview:onePixView];
    }
    return self;
}
- (void)setIndexItemDetail:(NSDictionary *)dic{
    _titleLabel.text = [dic[@"title"]description];
    _imageV.image = [UIImage imageNamed:[dic[@"image"]description]];
}
@end

#pragma 右侧item
@implementation DZmineFooterRightItem
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageV = [[UIImageView alloc]init];
        _imageV.width = 25;
        _imageV.height = 25;
        _imageV.centerX = (SCREEN_WIDTH-10)*3/(4*8.0);
        _imageV.centerY = 44 ;
        [self addSubview:_imageV];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _imageV.bottom + 16, self.width, 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"test";
        [self addSubview:_titleLabel];
        
        _numTips = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right - 3, _imageV.top - 5, 11, 11)];
        _numTips.layer.masksToBounds = YES;
        _numTips.layer.cornerRadius = 5.5f;
        _numTips.backgroundColor = UIRedColor;
        _numTips.font = [UIFont systemFontOfSize:10];
        _numTips.textColor = UIWhiteColor;
        _numTips.text = @"5";
        _numTips.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numTips];
    }
    return self;
}
- (void)setNums:(NSInteger)num{
    if (num > 0) {
        _numTips.hidden = NO;
        _numTips.text = [NSString stringWithFormat:@"%ld", (long)num];
        [_numTips sizeToFit];
        _numTips.layer.cornerRadius = _numTips.width/2.0;
    }else{
        _numTips.hidden = YES;
    }
}
- (void)setTitle:(NSString *)title image:(NSString *)image{
    _titleLabel.text = title;
    _imageV.image = [UIImage imageNamed:image];
}
@end

