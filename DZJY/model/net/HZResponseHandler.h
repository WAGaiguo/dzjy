//
//  HZResponseHandler.h
//  llhz
//
//  Created by kelamo on 2016/11/20.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HZRequestManangerType) {
    HZRequestManangerTypeDefault     = 101,
    HZRequestManangerTypeBackground  = 102,
    HZRequestManangerTypeLoadingOnly = 103,
    HZRequestManangerTypeTipsOnly    = 104
};


@class HZRequestMananger;
@protocol HZResponseHandlerProtocol <NSObject>
@required
- (void)requestStarted:(HZRequestMananger *)request;
- (void)request:(HZRequestMananger *)request success:(id)responseData;
- (void)requestFailed:(HZRequestMananger *)request error:(NSError *)error;
@end



@interface HZResponseHandler : NSObject<HZResponseHandlerProtocol>
@property (nonatomic,weak)UIView  *hudView;

@property (nonatomic,assign)BOOL logEnabled;
@property (nonatomic,assign)BOOL willParseData;
@property (nonatomic,assign)BOOL willParsedDataContainsDataKey;
@property (nonatomic,assign)HZRequestManangerType type;




+ (HZResponseHandler *)handlerWithView:(UIView *)view;
@property (nonatomic,copy)void(^didStarted)(HZRequestMananger *);
@property (nonatomic,copy)void(^didSuccess)(HZRequestMananger *,id obj);
@property (nonatomic,copy)void(^didFailed)(HZRequestMananger *);

@end
