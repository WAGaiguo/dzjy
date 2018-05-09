//
//  DZMemberLabel.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/9.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MyMemberType) {
    MyMemberTypePrimary,
    MyMemberTypeMiddel,
    MyMemberTypeHigh,
    MyMemberTypeVip
};
@interface DZMemberLabel : UILabel
@property (nonatomic, assign)MyMemberType type;
@end
