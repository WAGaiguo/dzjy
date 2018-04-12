//
//  DZSearchResultViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/29.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZSearchResultViewController.h"
#import "DZSearchNilView.h"
#import "DZSearchView.h"

@interface DZSearchResultViewController ()
{
    DZSearchNilView *nilView;
}
@end

@implementation DZSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackEnabled:YES];
    [self makeRightBtn];
    nilView = [[DZSearchNilView alloc]initWithFrame:CGRectMake(0, DZ_TOP, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP) fatherView:self.view];
}
- (void)makeRightBtn{
    CGFloat s_width = self.titleView.leftView.right;
    DZSearchView *searchV = [[DZSearchView alloc]initWithFrame:CGRectMake(s_width, DZ_TOP - 40, SCREEN_WIDTH - s_width - 40, 40)];
    [searchV setTapBlock:^{
        [self back];
    }];
    [self.titleView addSubview:searchV];
    
    [self setHasRightBtn:YES];
    [self.titleView.rightView setTitle:@"取消" forState:UIControlStateNormal];

}
-(void)back{
    if (self.navigationController != nil){
        [self.navigationController popViewControllerAnimated:NO];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
- (void)more{
    [self back];
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
