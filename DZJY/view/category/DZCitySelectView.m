//
//  DZCitySelectView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCitySelectView.h"
#import "DZCityAdapter.h"
#import "DZCityCell.h"
#import "DZPathGetter.h"
#import <MJExtension/MJExtension.h>


@interface DZCitySelectView()
{
    UITableView *_cityTableView;
    
    DZProvinceAdapter *_provinceAdapter;
}
@property(nonatomic, assign)NSInteger selectRow;
@property(nonatomic, strong)UITableView *provinceTableView;
@property(nonatomic, strong)NSArray *proviceData;
@property(nonatomic, strong)NSArray *cityData;
@property(nonatomic, strong)DZCityAdapter *cityAdapter;
@property(nonatomic, strong)NSString *provinceStr;

@end

@implementation DZCitySelectView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _selectRow = 0;
        [self makeDataSource];
        [self configProvince];
        [self configCity];
//        self.hidden = YES;
    }
    return self;
}
- (void)makeDataSource{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"areas" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    _proviceData = [NSArray arrayWithArray:jsonArr];
    _cityData = [NSArray arrayWithArray:_proviceData[1][@"children"]];
    _provinceStr = [_proviceData firstObject][@"label"];
}
- (void)configProvince{
    _provinceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.4, SCREEN_HEIGHT - DZ_TOP - 43)];
    [self addSubview:_provinceTableView];
    _provinceAdapter = [[DZProvinceAdapter alloc]initWithDataSource:_proviceData];
    [_provinceTableView setAdapter:_provinceAdapter];
    WEAK_SELF
    [_provinceAdapter setDidCellSelected:^(DZProvinceCell * cell, NSIndexPath *indexPath) {
        DZProvinceCell *cellBefore = [me.provinceTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:me.selectRow inSection:0]];
        [cellBefore setIsSelected:NO];
        
        [cell setIsSelected:YES];
        me.selectRow = indexPath.row;
        [me.cityAdapter reloadData:me.proviceData[indexPath.row][@"children"]];
        _provinceStr = cell.titleLabel.text;
    }];
    [_provinceAdapter setAfterReuseCell:^(DZProvinceCell * cell, NSIndexPath *indexPath) {
        if (me.selectRow == indexPath.row){
            [cell setIsSelected:YES];
        }else{
            [cell setIsSelected:NO];
        }
    }];
    _provinceTableView.backgroundColor = UIBackgroundColor;
}
- (void)configCity{
    _cityTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, 0, SCREEN_WIDTH * 0.6, SCREEN_HEIGHT - DZ_TOP - 43)];
    [self addSubview:_cityTableView];
    _cityAdapter = [[DZCityAdapter alloc]initWithDataSource:_cityData];
    [_cityTableView setAdapter:_cityAdapter];
    WEAK_SELF
    [_cityAdapter setDidCellSelected:^(DZCityCell* cell, NSIndexPath *indexPath) {
        if (me.tapCityBlock) {
            NSString *str = [NSString stringWithFormat:@"%@%@",me.provinceStr, cell.titleLabel.text];
            me.tapCityBlock(str);
        }
        [me setSelfHide];
    }];
    _cityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_cityTableView setTableHeaderView:[self headerView]];
}
- (UIView *)headerView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH *0.6, 44)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, 0, SCREEN_WIDTH * 0.6 - 13, 44)];
    headerLabel.text = @"全部";
    headerLabel.font = [UIFont systemFontOfSize:15];
    headerLabel.textColor = UITitleColor;
    [backView addSubview:headerLabel];
    WEAK_SELF
    [backView bk_whenTapped:^{
        if (me.tapCityBlock){
            me.tapCityBlock(_proviceData[me.selectRow][@"label"]);
        }
        [me setSelfHide];
    }];
    return backView;
}
- (void)setAnimation{
    self.alpha = 0;
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 1;
    }];
}
- (void)setSelfHide{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
