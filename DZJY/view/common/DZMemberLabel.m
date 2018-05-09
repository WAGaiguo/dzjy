//
//  DZMemberLabel.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/9.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMemberLabel.h"

@implementation DZMemberLabel

-(instancetype)init{
    self = [super init];
    if (self) {
        self.height = 17;
        self.width = 48;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        self.font = [UIFont systemFontOfSize:10];
        self.backgroundColor = [UIColor colorWithHex:@"e09f79"];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = UIWhiteColor;
        self.type = MyMemberTypePrimary; // 默认初级会员
    }
    return self;
}
- (void)setType:(MyMemberType )type{
    if (type == MyMemberTypePrimary) {
        self.text = @"初级会员";
    }else if (type == MyMemberTypeMiddel){
        self.text = @"中级会员";
    }else if (type == MyMemberTypeHigh){
        self.text = @"高级会员";
    }else if (type == MyMemberTypeVip){
        self.text = @"VIP会员";
    }
}
@end
