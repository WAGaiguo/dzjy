//
//  DZSpecificationView.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/11.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZSpecificationView : UIView
@property (nonatomic, copy)void (^selectBlock)(NSArray *commSetAttrildArr, NSArray *commAttrildArr, NSArray *commAttribtValArr);
@property (nonatomic, strong)NSArray *dataSource;
- (void)setAnimation;
- (void)setSelfHide;
@end

@interface DZSpecificationModel: NSObject
@property (nonatomic, strong)NSString *commAttribtName;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, strong)NSDictionary *dictTaxt;
@property (nonatomic, strong)NSString *attribtId;
@property (nonatomic, assign)NSInteger currentIndex;
@property (nonatomic, assign)NSInteger currentSection;
@end
