//
//  HZRequestMananger.h
//  llhz
//
//  Created by kelamo on 2016/11/20.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "DZResponseHandler.h"

@interface DZRequestMananger : NSObject
{
    
}
@property (nonatomic,strong)NSString       *urlString;
@property (nonatomic,strong)NSDictionary   *params;
@property (nonatomic,strong)DZResponseHandler   *handler;
@property (nonatomic,strong)NSString       *header;

- (void)get;
- (void)post;
- (void)post:(void (^)(id <AFMultipartFormData> formData))block;
@property (nonatomic,assign) NSInteger tag;

- (void)cancelAll;
@end
