//
//  DZCalendarViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZCalendarViewController.h"
#import "GTLCalendarView.h"

@interface DZCalendarViewController ()<GTLCalendarViewDataSource, GTLCalendarViewDelegate>{
    NSString *_fromDate;
    NSString *_toDate;
}

@end

@implementation DZCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self setupGTLCalendarViews];
}
- (void)configHeader{
    [self setTitle:@"日期选择"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    [self.titleView.rightView setTitle:@"确认" forState:UIControlStateNormal];
    [self.titleView.rightView setTitleColor:UIWhiteColor forState:UIControlStateNormal];
    [self setHasRightBtn:YES];
}
- (void)setupGTLCalendarViews {
    CGRect frame = CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP);
    GTLCalendarView *gtlCalendarView = [[GTLCalendarView alloc] initWithFrame:frame];
    gtlCalendarView.dataSource = self;
    gtlCalendarView.delegate = self;
    [self.view addSubview:gtlCalendarView];
}

- (void)more{
    if (_dateBlock) {
        _dateBlock(_fromDate, _toDate);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - GTLCalendarViewDataSource

- (NSDate *)minimumDateForGTLCalendar {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter dateFromString:@"2015-05-01"];
}

- (NSDate *)maximumDateForGTLCalendar {
    return [NSDate new];
}

//- (NSDate *)defaultSelectFromDate {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = @"yyyy-MM-dd";
//    return [dateFormatter dateFromString:@"2018-05-10"];
//}
//
//- (NSDate *)defaultSelectToDate {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = @"yyyy-MM-dd";
//    return [dateFormatter dateFromString:@"2018-05-26"];
//}

#pragma mark - GTLCalendarViewDelegate

- (NSInteger)rangeDaysForGTLCalendar {
    return 30 * 6;
}

- (void)selectNSStringFromDate:(NSString *)fromDate toDate:(NSString *)toDate {
    _fromDate = fromDate;
    _toDate = toDate;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
