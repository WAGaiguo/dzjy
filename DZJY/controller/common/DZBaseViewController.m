//
//  DZBaseViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/3/27.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZBaseViewController.h"

@interface DZBaseViewController (){
    DZTitleView *_titleView;
}

@end

@implementation DZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIWhiteColor];
}


- (DZTitleView *)titleView{
    if (_titleView == nil) {
        _titleView = [[DZTitleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, DZ_TOP)];
        [self.view addSubview:_titleView];
        [_titleView.rightView addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleView;
}

-(void)setTitle:(NSString *)title{
    [[self titleView] setTitle:title];
}
- (void)more{
    
}

-(void)setBackEnabled:(BOOL)backEnabled{
    [self.titleView setBackEnabled:backEnabled];
    if (backEnabled){
        [self.titleView.leftView addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self.titleView.leftView removeTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)back{
    if (self.navigationController != nil){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)setHasRightBtn:(BOOL)hasRightBtn{
    if (hasRightBtn) {
        _titleView.rightView.hidden = NO;
    }
}

- (void)setBackImageGray{
    [_titleView.leftView setImage:[UIImage imageNamed:@"back_gray"] forState:UIControlStateNormal];
}

- (void)setHeaderBackGroud:(BOOL)has{
    [self titleView];
    [_titleView setHasBackGroud:has];
}

- (void)setRightImage:(NSString *)image{
    [self titleView];
    [self setHasRightBtn:YES];
    [_titleView.rightView setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
