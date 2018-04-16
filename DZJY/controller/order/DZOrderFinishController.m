//
//  DZOrderFinishController.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/16.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderFinishController.h"
#import "DZOrderFinishView.h"

@interface DZOrderFinishController ()
{
    DZOrderFinishView *_finshView;
}
@end

@implementation DZOrderFinishController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"订单提交成功"];
    [self setBackEnabled:YES];
    [self setHasRightBtn:YES];
    [self.titleView.rightView setTitle:@"完成" forState:UIControlStateNormal];
    [self.titleView.rightView setTitleColor:UICommonColor forState:UIControlStateNormal];
    [self.titleView setBackgroundColor: UIWhiteColor];
    [self.titleView.leftView setImage:[UIImage imageNamed:@"back_gray"] forState:UIControlStateNormal];
    UIImageView *backImageV = [self.view viewWithTag:999];
    [backImageV removeFromSuperview];
    
    _finshView = [[DZOrderFinishView alloc]initWithFrame:CGRectMake(0, DZ_TOP + 7, SCREEN_WIDTH, 288)];
    [self.view addSubview:_finshView];
    [self.view setBackgroundColor:UIBackgroundColor];
    
}

- (void)more{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
