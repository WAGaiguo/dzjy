//
//  DZAboutUsViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/6.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZAboutUsViewController.h"

@interface DZAboutUsViewController (){
    UIView *backHeaderV;
}

@end

@implementation DZAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"关于我们"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    backHeaderV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP)];
    [self.tableView setTableHeaderView:backHeaderV];
}
- (void)configUI{
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    logo.center = CGPointMake(SCREEN_WIDTH/2.0, 50);
    [backHeaderV addSubview:logo];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(18, logo.bottom + 50, SCREEN_WIDTH - 36, 0)];
    label.numberOfLines = 0;
    [backHeaderV addSubview:label];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = UI666666Color;
    label.text = @"“菜盟盟”山东寿光大宗蔬菜电子交易平台，由寿光百胜菜盟电子商务科技有限公司在寿光市委市政府的关心和推动下，在中国（寿光）国际蔬菜博览会和寿光市蔬菜协会的支持下，聚合寿光蔬菜生产企业和专合组织，引领我国大宗";
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
