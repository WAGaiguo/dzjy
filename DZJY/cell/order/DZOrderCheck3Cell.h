//
//  DZOrderCheck3Cell.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/22.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZOrderCheck3Cell : UITableViewCell

@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UILabel *label3;
@property (nonatomic, strong)UILabel *label4;
@property (nonatomic, strong)UILabel *label5;
@property (nonatomic, strong)UILabel *label6;
@property (nonatomic, strong)UILabel *label7;
@property (nonatomic, strong)UILabel *label8;
@property (nonatomic, strong)UILabel *label9;

- (void)setContent:(NSDictionary *)dic;
@end
