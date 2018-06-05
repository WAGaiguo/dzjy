//
//  CKRefreshHeader.h
//  ck
//
//  Created by wangaiguo on 15/12/7.
//  Copyright © 2015年 chin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,YLRefreshState){
    WillRefreshl,
    Refreshing,
    RefreshDone
};

@interface DZRefreshHeader : UIView
{
    __weak IBOutlet UILabel *_textLabel;
    __weak IBOutlet UIImageView *pullContentImage;
    __weak IBOutlet UIImageView *pullCircle;
    
}
@property (nonatomic,assign)YLRefreshState refreshState;
@end
