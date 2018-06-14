//
//  DZCommonTipsView.h
//  DZJY
//
//  Created by wangaiguo on 2018/5/30.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZCommonTipsView : UIView
@property (nonatomic, strong)UIImageView *tipBackView;
@property (nonatomic, strong)UITextView *textView;
- (void)startAnimation;

- (void)myContractText;
- (void)myDeliveryText;
- (void)myDeliveryAbnormalText;
- (void)myLadingText;
- (void)myOrder;
@end

@interface DZCommonTipsShortView : UIView
@property (nonatomic, strong)UIImageView *tipBackView;
@property (nonatomic, strong)UITextView *textView;
- (void)startAnimation;
- (void)myContractAbnormalText;
@end
