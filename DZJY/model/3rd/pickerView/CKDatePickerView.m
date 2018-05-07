//
//  ZXPPickerView.m
//  Demo
//
//  Created by 张孝平 on 16/3/23.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "CKDatePickerView.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <NSObject+MJCoding.h>

#define kZXPWeakSelf autoreleasepool {} __weak typeof(self) p_self_weak = self;
#define kZXPStrongSelf autoreleasepool {} __strong typeof(p_self_weak) self = p_self_weak;

static const CGFloat kAnimateDurationOfBackgroundView = 0.25;
static const CGFloat kHeightForPickerView = 216;
static const CGFloat kHeightForToolBarView = 40;
static const void * kZXPPickerViewKey = &kZXPPickerViewKey;

#pragma mark - toolBar class

@interface CKToolBarView : UIView

- (void)confirmButtonActionBlock:(nonnull void(^)(UIButton *btn))block;
- (void)cancelButtonActionBlock:(nonnull void(^)(UIButton *btn))block;

@end

@interface CKToolBarView ()

@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *confirmButton;

@property (nonatomic,copy) void(^confirmActionBlock)(UIButton *);
@property (nonatomic,copy) void(^cancelActionBlock)(UIButton *);

@end

@implementation CKToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //init background color
//        self.backgroundColor = [UIColor colorWithRed:0 green:187/255.0 blue:255/255.0 alpha:1];
        
        self.backgroundColor = UICommonColor;
        [self addSubview:self.cancelButton];
        [self addSubview:self.confirmButton];
        
        [self p_initLayout];
        
    }
    return self;
}

#pragma mark - public

- (void)confirmButtonActionBlock:(void (^)(UIButton *))block {
    NSAssert(block, @"block can't nil");
    self.confirmActionBlock = [block copy];
}

- (void)cancelButtonActionBlock:(void (^)(UIButton *))block {
    NSAssert(block, @"block can't nil");
    self.cancelActionBlock = [block copy];
}

#pragma mark - private

- (void)p_initLayout {
    self.cancelButton.frame = CGRectMake(0, 0, 60, CGRectGetHeight(self.frame));
    self.confirmButton.frame = CGRectMake(CGRectGetWidth(self.frame) - 60 , 0, 60, CGRectGetHeight(self.frame));
}

- (__kindof UIButton * _Nonnull)p_initPropertiesForButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}

- (void)p_confirmActon:(UIButton *)sender {
    NSAssert(self.confirmActionBlock, @"block can't nil");
    self.confirmActionBlock(sender);
}

- (void)p_cancelActon:(UIButton *)sender {
    NSAssert(self.cancelActionBlock, @"block can't nil");
    self.cancelActionBlock(sender);
}

#pragma mark - getter

- (UIButton *)cancelButton {
    return _cancelButton?:(_cancelButton = ({
        UIButton *btn = [self p_initPropertiesForButtonWithTitle:@"取消"];
        [btn addTarget:self action:@selector(p_cancelActon:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    }));
}

- (UIButton *)confirmButton {
    return _confirmButton?:(_confirmButton = ({
        UIButton *btn = [self p_initPropertiesForButtonWithTitle:@"确定"];
        [btn addTarget:self action:@selector(p_confirmActon:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    }));
}

@end


#pragma mark - picker view class

@interface CKDatePickerView () <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSString *provinceName;
    NSString *provinceId;
    NSString *cityName;
    NSString *cityId;
    NSString *districtName;
}
@property (nonatomic,strong) UIView *backgroundView;

@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic,strong) CKToolBarView *toolBarView;

@property (nonatomic,assign) NSUInteger selectedOfRow;
@property (nonatomic,assign) NSUInteger selectedOfSection;

@property (nonatomic,strong) NSMutableArray<NSNumber *> *selectedIndexs;

@property (strong, nonatomic) NSArray *cityArray;
@property (nonatomic, strong) NSArray *provinceArray;
@property (nonatomic, strong) NSArray *districtArray;


@end

@implementation CKDatePickerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[UIApplication sharedApplication].keyWindow addSubview:self.backgroundView];
        [self p_setupInitDataSource];
        [self.backgroundView addSubview:self.pickerView];
        [self.backgroundView addSubview:self.toolBarView];
        
        [self p_initLayout];
        
        
        
    }
    return self;
}

#pragma mark - public

- (void)show {
    CGRect frameForPicker = self.pickerView.frame;
    frameForPicker.origin.y = frameForPicker.origin.y - kHeightForPickerView - kHeightForToolBarView;
    
    __block CGRect frameForToolBar = self.toolBarView.frame;
    frameForToolBar.origin.y = frameForToolBar.origin.y - kHeightForToolBarView - kHeightForPickerView;
    
    [UIView animateWithDuration:kAnimateDurationOfBackgroundView animations:^{
        self.backgroundView.alpha = 1;
        self.pickerView.frame = frameForPicker;
        self.toolBarView.frame = frameForToolBar;
    }];
}

- (void)dismiss {
    CGRect frameForPicker = self.pickerView.frame;
    frameForPicker.origin.y += kHeightForPickerView + kHeightForToolBarView;
    
    CGRect frameForToolBar = self.toolBarView.frame;
    frameForToolBar.origin.y = CGRectGetHeight(self.backgroundView.frame);
    
    [UIView animateWithDuration:kAnimateDurationOfBackgroundView animations:^{
        self.backgroundView.alpha = 0;
        self.pickerView.frame = frameForPicker;
        self.toolBarView.frame = frameForToolBar;
    } completion:^(BOOL finished) {
        [self.backgroundView removeFromSuperview];
        
        // dealloc self
        objc_setAssociatedObject(self, kZXPPickerViewKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
}

- (void)selectedRow:(NSInteger)row section:(NSInteger)section animation:(BOOL)animation {
    [self.pickerView selectRow:row inComponent:section animated:animation];
    self.selectedIndexs[section] = @(row);
}

- (void)reloadData {
    [self.pickerView reloadAllComponents];
}

- (void)reloadDataWithSection:(NSInteger)section {
    [self.pickerView reloadComponent:section];
}

#pragma mark - UIPickerViewDelegate & UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _provinceArray.count;
    }else if(component == 1){
        return _cityArray.count;
    }else{
        return _districtArray.count;
    }

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        provinceName = [_provinceArray[row] objectForKey:@"name"];
        return provinceName;
    }else if(component == 1){
        cityName = [_cityArray[row] objectForKey:@"name"];
        return cityName;
    }else {
        districtName = [_districtArray[row] objectForKey:@"name"];
        return districtName;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        provinceName = [_provinceArray[row] objectForKey:@"name"];
        _cityArray = [_provinceArray[row] objectForKey:@"children"];
        _districtArray = [_cityArray[0] objectForKey:@"children"];
        [self.pickerView reloadComponent:1];
        [self.pickerView reloadComponent:2];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        [self.pickerView selectRow:1 inComponent:2 animated:YES];
    }else if (component == 1){
        cityName = [_provinceArray[row] objectForKey:@"name"];
        _districtArray = [_cityArray[row] objectForKey:@"children"];
        [self.pickerView reloadComponent:2];
        [self.pickerView selectRow:1 inComponent:2 animated:YES];
    }else{
        districtName = [_districtArray[row] objectForKey:@"name"];
    }
}

#pragma mark - private

- (void)p_initLayout {
    self.backgroundView.frame = [UIApplication sharedApplication].keyWindow.frame;
    
    self.pickerView.frame = CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) + kHeightForToolBarView, CGRectGetWidth(UIScreen.mainScreen.bounds), kHeightForPickerView);
    
    self.toolBarView.frame = CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds), CGRectGetWidth(UIScreen.mainScreen.bounds), kHeightForToolBarView);
}

- (void)p_pickerConfirmAction {
    if (_selectBlock) {
        _selectBlock([NSString stringWithFormat:@"%@%@%@",provinceName,cityName,districtName], provinceName, cityName, districtName);
    }
}

- (void)p_setupInitDataSource {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"wag" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    _provinceArray = [NSArray arrayWithArray:jsonArr];
    _cityArray = [_provinceArray[0] objectForKey:@"children"];
    _districtArray = [_cityArray[0] objectForKey:@"children"];
    [self.pickerView selectRow:0 inComponent:0 animated:YES];
    [self.pickerView selectRow:2 inComponent:1 animated:YES];
    [self.pickerView selectRow:2 inComponent:2 animated:YES];
}

#pragma mark - getter & setter

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        _backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _backgroundView.alpha = 0;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backgroundView addSubview:btn];
        btn.frame = [UIApplication sharedApplication].keyWindow.frame;
        
        // retain self
        objc_setAssociatedObject(self, kZXPPickerViewKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundView;
}

- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

- (NSMutableArray<NSNumber *> *)selectedIndexs {
    return _selectedIndexs?:(_selectedIndexs = ({
        NSMutableArray *array = [NSMutableArray array];
        for (long int i = 0; i<self.dataSource.count; i++) {
            [array addObject:@0];
        }
        array;
    }));
}

- (CKToolBarView *)toolBarView {
    return _toolBarView?:(_toolBarView = ({
        CKToolBarView *toolBar = [[CKToolBarView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds), kHeightForToolBarView)];
        @kZXPWeakSelf;
        [toolBar confirmButtonActionBlock:^(UIButton *btn) {
            @kZXPStrongSelf;
            [self p_pickerConfirmAction];
            [self dismiss];
        }];
        [toolBar cancelButtonActionBlock:^(UIButton *btn) {
            @kZXPStrongSelf;
            [self dismiss];
        }];
        toolBar;
    }));
}

@end
