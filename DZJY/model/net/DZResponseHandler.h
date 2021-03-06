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


@class DZRequestMananger;
@protocol DZResponseHandlerProtocol <NSObject>
@required
- (void)requestStarted:(DZRequestMananger *)request;
- (void)request:(DZRequestMananger *)request success:(id)responseData;
- (void)requestFailed:(DZRequestMananger *)request error:(NSError *)error;
@end



@interface DZResponseHandler : NSObject<DZResponseHandlerProtocol>
@property (nonatomic,weak)UIView  *hudView;

@property (nonatomic,assign)BOOL logEnabled;
@property (nonatomic,assign)BOOL willParseData;
@property (nonatomic,assign)BOOL willParsedDataContainsDataKey;
@property (nonatomic,assign)BOOL is20000Code;
@property (nonatomic,assign)HZRequestManangerType type;




+ (DZResponseHandler *)handlerWithView:(UIView *)view;
@property (nonatomic,copy)void(^didStarted)(DZRequestMananger *);
@property (nonatomic,copy)void(^didSuccess)(DZRequestMananger *manager,id obj);
@property (nonatomic,copy)void(^didFailed)(DZRequestMananger *manager);

@end
