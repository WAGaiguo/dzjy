//
//  CKLoadingMoreFooter.h
//  ck
//
//  Created by Chin on 14/10/21.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YLLoadingMoreState) {
    Normal,
    Loading,
    Done
};


@interface DZLoadingMoreFooter : UIView
{
    __weak IBOutlet UILabel *_textLabel;
    __weak IBOutlet UIActivityIndicatorView *_loadingIndicatorView;
    
}
@property (nonatomic,assign)YLLoadingMoreState loadingState;
@end
