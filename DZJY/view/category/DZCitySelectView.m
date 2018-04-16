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


@interface DZCitySelectView()
{
    UITableView *_cityTableView;
    DZCityAdapter *_cityAdapter;
    DZProvinceAdapter *_provinceAdapter;
}
@property(nonatomic, assign)NSInteger selectRow;
@property(nonatomic, strong)UITableView *provinceTableView;
@property(nonatomic, strong)NSArray *proviceData;

@end

@implementation DZCitySelectView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _selectRow = 199;
        [self makeDataSource];
        [self configProvince];
        [self configCity];
        self.hidden = YES;
        self.alpha = 0;
    }
    return self;
}
- (void)makeDataSource{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonarr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSString *value = [NSString stringWithContentsOfFile:UIDocumentFile(@"cities.json") encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",value);
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    _proviceData = [[arr objectAtIndex:0]objectForKey:@"children"];
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
    }];
    _provinceTableView.backgroundColor = UIBackgroundColor;
}
- (void)configCity{
    _cityTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, 0, SCREEN_WIDTH * 0.6, SCREEN_HEIGHT - DZ_TOP - 43)];
    [self addSubview:_cityTableView];
    _cityAdapter = [[DZCityAdapter alloc]init];
    [_cityTableView setAdapter:_cityAdapter];
    WEAK_SELF
    [_cityAdapter setDidCellSelected:^(id cell, NSIndexPath *indexPath) {
        if (me.tapCityBlock) {
            me.tapCityBlock(@"city");
        }
    }];
//    _cityTableView.backgroundColor = UIWhiteColor;
    _cityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
