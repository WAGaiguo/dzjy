//
//  DZTableViewAdapter.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/26.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZTableViewAdapter.h"

@interface DZTableViewAdapter()
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation DZTableViewAdapter
- (instancetype)initWithDataSource:(NSArray *)dataSource{
    self = [super init];
    if (self){
        self.dataSource = [NSMutableArray arrayWithArray:dataSource];
        self.deselectedAnimated = NO;
    }
    return self;
}

-(void)goTop:(BOOL)animated{
    [self.view setContentOffset:CGPointZero animated:animated];
}

-(void)reloadData:(NSArray *)data{
    self.dataSource = [data mutableCopy];
    [self.view reloadData];
}

- (void)appendData:(NSArray *)data{
    [self.dataSource addObjectsFromArray:data];
    [self.view reloadData];
}

-(void)setView:(UITableView *)view{
    _view = view;
    [self afterSetView];
}

- (void)afterSetView{
    
}


- (void)cellSelected:(NSIndexPath *)indexPath{
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:_deselectedAnimated];
    [self cellSelected:indexPath];
    if (self.didCellSelected){
        self.didCellSelected([tableView cellForRowAtIndexPath:indexPath],indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (_afterReuseCell) {
        _afterReuseCell(cell,indexPath);
    }
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)sender{
    if (_didScroll){
        _didScroll(self.view);
    }
}


- (UIViewController *)firstViewController{
    id responder = self.view;
    //while循环找到响应者链条中第一个具备响应能力，并通过if筛选出该响应者链条中的控制器类型(只要是UIVC的之类都能通过isKindOfClass)
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass:[UIViewController class]]){
            return responder;
        }
    }
    return nil;
}
@end
