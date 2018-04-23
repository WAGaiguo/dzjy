//
//  SVSegmentedView.h
//  SVCommonComponent
//
//  Created by shuvigoss on 15-4-14.
//  Copyright (c) 2015年 com.shuvigoss. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SV_SEGMENTEDVIEW_DEFAULT_FONT_NAME @"STHeitiSC-Light"

@protocol SVSegmentedViewDelegate <NSObject>
@optional
- (BOOL)segmentedWillChange:(NSInteger) index oldIndex:(NSInteger)oldIndex;
- (void)segmentedDidChange:(NSInteger) index;
@end


@interface SVSegmentedView : UIView

@property(nonatomic, readonly) UIScrollView *scrollView;

@property(nonatomic, strong) NSArray *titles;

@property(nonatomic, assign) id<SVSegmentedViewDelegate> delegate;

/**
 *  default is NO, whether send message if the segmented item be selected
 */
@property(nonatomic, assign) BOOL duplicateNotification;

/**
 *  |--text----text--|  '--' is the margin 
 */
@property(nonatomic, assign) CGFloat minTitleMargin;

/**
 *  |**--text----text--**| '**' is horizontalMargin (btw:还挺形象…) default is equal minTitleMargin
 */
@property(nonatomic, assign) CGFloat horizontalMargin;

/**
 *  default font name is STHeitiSC-Light、font size is 16.f
 */
@property(nonatomic, strong) UIFont *defaultFont;
/**
 *  default font color is grayColor
 */
@property(nonatomic, strong) UIColor *defaultFontColor;
/**
 *  default selected font size  is 18.f
 */
@property(nonatomic, assign) CGFloat selectedFontSize;
/**
 *  default selected font color is redColor
 */
@property(nonatomic, strong) UIColor *selectedFontColor;

/**
 *  default selected index is 0
 */
@property(nonatomic, assign) NSInteger selectedIndex;

// the red bottom Line 
@property(nonatomic,strong) UILabel *label;
@end


@interface SVSegmentedTitleButton : UIButton

@property(nonatomic, assign) CGFloat selectedFontSize;

@end