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

@end

@implementation DZCitySelectView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _selectRow = 0;
        [self makeDataSource];
        [self configProvince];
        [self configCity];
        self.hidden = YES;
        self.alpha = 0;
    }
    return self;
}
- (void)makeDataSource{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wag" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//    NSLog(@"%@",[jsonarr mj_JSONString]);
    _proviceData = [NSArray arrayWithArray:jsonArr];
    _cityData = [NSArray arrayWithArray:_proviceData[1][@"children"]];
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
    [_cityAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        if (me.tapCityBlock) {
            me.tapCityBlock(@"city");
        }
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
            me.tapCityBlock(_proviceData[me.selectRow][@"name"]);
        }
    }];
    return backView;
}
- (void)setAnimation{
    self.hidden = NO;
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 1;
    }];
}
- (void)setSelfHide{
    [UIView animateWithDuration:0.33 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
@end
