//
//  SVSegmentedView.m
//  SVCommonComponent
//
//  Created by shuvigoss on 15-4-14.
//  Copyright (c) 2015年 com.shuvigoss. All rights reserved.
//

#import "SVSegmentedView.h"
#import <objc/runtime.h>

typedef struct _SvSegmentedItemFrame {
    CGFloat totalWidthWithMargin;
    CGFloat totalWidthNoMargin;
}SvSegmentedItemFrame;

static char btRuntimeIndexKey;
@interface SVSegmentedView ()
@property(nonatomic, strong) NSMutableArray *titleViews;
@end

@implementation SVSegmentedView

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.85];
    //init scrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.bounces = YES;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.alwaysBounceHorizontal = YES;
    _label = [[UILabel alloc]init];
    [_scrollView addSubview:_label];
    [self addSubview:_scrollView];
    //init with default
    _titleViews = [NSMutableArray array];
    _minTitleMargin = 5.f;
    _horizontalMargin = _minTitleMargin;
    _defaultFont = [UIFont systemFontOfSize:16.f];
    _selectedFontSize = 16.f;
    //kvo for selectedIndex
    [self addObserver:self forKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    if ([_titleViews count] > 0) {
        /*Sends to each object in the array the message identified by a given selector, starting with the first object and continuing through the array to the last object*/
        [_titleViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_titleViews removeAllObjects];
    }
    [_titles enumerateObjectsUsingBlock:^(id title, NSUInteger index, BOOL *stop){
        SVSegmentedTitleButton *bt = [SVSegmentedTitleButton buttonWithType:UIButtonTypeCustom];
        bt.adjustsImageWhenHighlighted = NO;
        objc_setAssociatedObject(bt, &btRuntimeIndexKey, @(index), OBJC_ASSOCIATION_RETAIN);
        [bt addTarget:self action:@selector(titleBeClick:) forControlEvents:UIControlEventTouchUpInside];
        bt.backgroundColor = [UIColor clearColor];
        [_titleViews addObject:bt];
        [_scrollView addSubview:bt];
    }];
}


- (void)setSelectedIndex:(NSInteger)selectedIndex{
    if ([_titleViews count] == 0) { return; }
    if (selectedIndex > [_titles count] - 1 || selectedIndex < 0) { return; }
    _selectedIndex = selectedIndex;
    UIButton *selectedBt = [_titleViews objectAtIndex:_selectedIndex];
    [UIView animateWithDuration:0.25 animations:^{
        _label.frame = CGRectMake(selectedBt.frame.origin.x + 30, 42, selectedBt.frame.size.width - 60, 2);
    }];
}

- (void)titleBeClick:(SVSegmentedTitleButton *)bt{
    NSInteger btIndex = [objc_getAssociatedObject(bt, &btRuntimeIndexKey) integerValue];
    if (!_duplicateNotification && btIndex == _selectedIndex) { return; }
    if ([_delegate respondsToSelector:@selector(segmentedWillChange:oldIndex:)]) {
        BOOL shouldChange = [_delegate segmentedWillChange:btIndex oldIndex:_selectedIndex];
        if (!shouldChange) { return; }
    }
    self.selectedIndex = btIndex;
    if ([_delegate respondsToSelector:@selector(segmentedDidChange:)]) {
        [_delegate segmentedDidChange:_selectedIndex];
    }
}

- (SvSegmentedItemFrame)widthUseMargin:(CGFloat)margin{
    __block CGFloat totalWidth = 0;
    [_titles enumerateObjectsUsingBlock:^(id title, NSUInteger index, BOOL *stop){
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: _defaultFont}];
        totalWidth += size.width;
    }];
    SvSegmentedItemFrame frame;
    frame.totalWidthNoMargin = totalWidth;
    totalWidth += margin * [_titles count] * 2;
    frame.totalWidthWithMargin = totalWidth;
    return frame;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"selectedIndex"]) {
        NSInteger newIndex = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        NSInteger oldIndex = [[change objectForKey:NSKeyValueChangeOldKey] integerValue];
        if (newIndex == oldIndex) {
            UIButton *bt = [_titleViews objectAtIndex:newIndex];
            if (!bt.selected) { bt.selected = YES; }
            return;
        }
        UIButton *newSelectedBt = [_titleViews objectAtIndex:newIndex];
        newSelectedBt.selected = YES;
        UIButton *oldSelectedBt = [_titleViews objectAtIndex:oldIndex];
        oldSelectedBt.selected = NO;
        [self adjustPosition];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)adjustPosition{
    if (_scrollView.contentSize.width <= self.frame.size.width) { return; }
    UIButton *selectedBt = [_titleViews objectAtIndex:_selectedIndex];
    CGFloat selectedBtLx = selectedBt.center.x;
    CGFloat selectedBtRx = _scrollView.contentSize.width - selectedBt.center.x;
    BOOL canMoveToCenter = (selectedBtLx >= _scrollView.frame.size.width / 2 && selectedBtRx >= _scrollView.frame.size.width / 2) ? YES : NO;
    CGPoint moveToPoint = CGPointZero;
    if (canMoveToCenter){
        moveToPoint = CGPointMake(selectedBt.center.x - _scrollView.frame.size.width / 2, 0);
    }else{
        if (selectedBtLx <= selectedBtRx){//left
            moveToPoint = CGPointZero;
        }else{//right
            moveToPoint = CGPointMake(_scrollView.contentSize.width - _scrollView.frame.size.width, 0);
        }
    }
    [UIView animateWithDuration:0.25 animations:^{
        _scrollView.contentOffset = moveToPoint;
    }];
}

- (void)setSelectedFontSize:(CGFloat)selectedFontSize{
    _selectedFontSize = selectedFontSize;
    [_titleViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ((SVSegmentedTitleButton *)obj).selectedFontSize = _selectedFontSize;
    }];
}

- (void)setMinTitleMargin:(CGFloat)minTitleMargin{
    _minTitleMargin = minTitleMargin;
    _horizontalMargin = _minTitleMargin;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _scrollView.frame = self.bounds;
    SvSegmentedItemFrame frame = [self widthUseMargin:_minTitleMargin];
    CGFloat totalWidthWithMargin = frame.totalWidthWithMargin;
    CGFloat perferMargin = _minTitleMargin;
    if (totalWidthWithMargin < self.frame.size.width) {
        perferMargin = (self.frame.size.width - frame.totalWidthNoMargin) / ([_titles count] * 2);
    }
    [self layoutTitleViews:perferMargin];
    UIButton *selectedBt = [_titleViews objectAtIndex:0];
    _label.frame = CGRectMake(selectedBt.frame.origin.x + 30, 42, selectedBt.frame.size.width - 60, 2);
    _label.backgroundColor = RGBCOLOR(254, 82, 0);
}

- (void)layoutTitleViews:(CGFloat)margin{
    __block CGFloat x = _horizontalMargin;
    [_titleViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SVSegmentedTitleButton *titleBt = obj;
        NSString *title = [_titles objectAtIndex:idx];
        titleBt.titleLabel.font = _defaultFont;
        titleBt.selectedFontSize = _selectedFontSize;
        [titleBt setTitleColor:_defaultFontColor forState:UIControlStateNormal];
        [titleBt setTitle:title forState:UIControlStateNormal];
        [titleBt setTitleColor:_selectedFontColor forState:UIControlStateSelected];
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: _defaultFont}];
        titleBt.frame = CGRectMake(x, 0, size.width + 2 * margin, self.frame.size.height);
        x += titleBt.frame.size.width;
        if (idx == _selectedIndex && !titleBt.selected) {
            titleBt.selected = YES;
        }
    }];
    _scrollView.contentSize = CGSizeMake(CGRectGetMaxX(((UIView *)[_titleViews lastObject]).frame) + _horizontalMargin, _scrollView.contentSize.height);
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"selectedIndex"];
}
@end

@implementation SVSegmentedTitleButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    CGFloat scaleValue = (_selectedFontSize == 0 ? self.titleLabel.font.pointSize + 2 : _selectedFontSize) / self.titleLabel.font.pointSize;
    if (selected) {
        [UIView animateWithDuration:0.25 animations:^{
            self.titleLabel.transform = CGAffineTransformScale(self.titleLabel.transform, scaleValue, scaleValue);
        }completion:^(BOOL finished){}];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.titleLabel.transform = CGAffineTransformIdentity;
        }completion:^(BOOL finished){}];
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
}

@end
