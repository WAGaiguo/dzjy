//
//  DZMessageViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageViewController.h"
#import "DZMessageNilView.h"
#import "DZMessageSearchView.h"
#import "DZMessageAdapter.h"

@interface DZMessageViewController(){
    DZMessageNilView *nilView;
    DZMessageSearchView *searchView;
    DZMessageAdapter *_adapter;
}
@end

@implementation DZMessageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"站内信"];
    [self setHeaderBackGroud:YES];
//    [self configNilView];
    [self configSearchView];
    [self configAdapter];
}

- (void)configSearchView{
    searchView = [[DZMessageSearchView alloc]init];
    [self.tableView setTableHeaderView:searchView];
    [searchView setSearchBlock:^(NSString *text) {
        
    }];
}
- (void)configAdapter{
    NSArray * arr = @[@"阿斯加德佛爱家佛偈我也就覅偶爱耳温计我金额覅骄傲IE金佛IE积分奥IE见佛诶接哦我及覅",@"爱杰佛我昂IE爱护公我及饿哦我更接近覅偶二姐夫 爱家佛IE奇偶我为奇偶我见覅文件佛昂规矩",@"爱江山佛IE今晚if就我IE几个我个hi危机而我if就我诶见佛已你偶尔金佛IE金佛及欧文我杰佛我骄傲覅哦啊降温哦if奇偶IE金佛IE积分阿拉斯加的福利卡十多年覅欧冠hi偶尔加工诶文件奥我文件佛IE金佛我文件覅偶见"];
    NSMutableArray *mutableArr = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DZMessageModel *model = [DZMessageModel new];
        model.content = obj;
        model.isFolder = NO;
        [model hightForContent:model.content];
        [mutableArr addObject:model];
    }];
    _adapter = [[DZMessageAdapter alloc]initWithDataSource:mutableArr];
    [self.tableView setAdapter:_adapter];
    [_adapter setDidScroll:^(UITableView *tableView) {
        [MAIN_WINDOW endEditing:YES];
    }];
}
/**
     空---nilView处理
 **/
- (void)configNilView{
    if (nilView == nil) {
        nilView = [DZMessageNilView new];
        [self.view addSubview:nilView];
    }
}
- (void)removeNilView{
    [nilView removeFromSuperview];
    nilView = nil;
}

@end
