//
//  ZXPPickerView.h
//  Demo

//  version: 0.1

//  Created by 张孝平 on 16/3/23.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKDatePickerView;
@protocol CKDatePickerViewDelegate <NSObject>

@optional
- (void)zxp_pickerView:(CKDatePickerView *)pickerView didSelectRow:(NSInteger)row section:(NSInteger)section;

- (void)zxp_pickerViewConfirmAction:(CKDatePickerView *)pickerView didSelectArray:(NSArray <NSNumber *> *)selectedArray;

@end

@interface CKDatePickerView : NSObject
@property (nonatomic, copy)void(^selectBlock)(NSString *text, NSString*compAreaProv, NSString *compAreaCity, NSString *compAreaDist);
@property (nonatomic,strong) NSArray<NSArray<NSString *> *> *dataSource;
@property (nonatomic,assign) id<CKDatePickerViewDelegate> delegate;

- (void)show;

- (void)dismiss;

- (void)selectedRow:(NSInteger)row section:(NSInteger)section animation:(BOOL)animation;

- (void)reloadData;
- (void)reloadDataWithSection:(NSInteger)section;

@end
