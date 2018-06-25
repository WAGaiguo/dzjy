//
//  DZMessageNumsModel.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/23.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageNumsModel.h"

@implementation DZMessageNumsModel
- (instancetype)init{
    self = [super init];
    if (self) {
        [self startRequest];
    }
    return self;
}
- (void)startRequest{
    _dataDic = [NSMutableDictionary dictionary];
    [self myBought];
}
- (void)myBought{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeBackground;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (obj != nil) {
            [_dataDic setObject:obj forKey:@"1"];
        }
        [self myOrder];
    }];
//    [handler setDidFailed:^(DZRequestMananger *manager) {
//        [HudUtils showMessage:@"请求异常，请稍后重试"];
//        if (_faildBlock) {
//            _faildBlock();
//        }
//    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory boughtNums]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)myOrder{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeBackground;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (obj[@"1"] != nil) {
            [_dataDic setObject:obj[@"1"] forKey:@"2"];
        }
        if (obj[@"2"] != nil) {
            [_dataDic setObject:obj[@"2"] forKey:@"3"];
        }
        [self myContract];
    }];
//    [handler setDidFailed:^(DZRequestMananger *manager) {
//        [HudUtils showMessage:@"请求异常，请稍后重试"];
//        if (_faildBlock) {
//            _faildBlock();
//        }
//    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory orderNums]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)myContract{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeBackground;
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (obj[@"0"] != nil) {
            [_dataDic setObject:obj[@"0"] forKey:@"4"];
        }
        if (obj[@"2"] != nil) {
            [_dataDic setObject:obj[@"2"] forKey:@"5"];
        }
        [self myDelivery];
    }];
//    [handler setDidFailed:^(DZRequestMananger *manager) {
//        [HudUtils showMessage:@"请求异常，请稍后重试"];
//        if (_faildBlock) {
//            _faildBlock();
//        }
//    }];
    DZRequestParams *params = [DZRequestParams new];
    DZRequestMananger *manager = [DZRequestMananger new];
    [manager setUrlString:[DZURLFactory contractNums]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
- (void)myDelivery{
    DZResponseHandler *handler = [DZResponseHandler new];
    handler.type = HZRequestManangerTypeBackground;
    DZRequestMananger *manager = [DZRequestMananger new];
    [handler setDidSuccess:^(DZRequestMananger *manager, id obj) {
        if (obj[@"4"] != nil) {
            [_dataDic setObject:obj[@"4"] forKey:@"6"];
        }
        if (obj[@"3"] != nil) {
            [_dataDic setObject:obj[@"3"] forKey:@"7"];
        }
        if (_successBlock) {
            _successBlock(_dataDic);
        }
    }];
//    [handler setDidFailed:^(DZRequestMananger *manager) {
//        [HudUtils showMessage:@"请求异常，请稍后重试"];
//        if (_faildBlock) {
//            _faildBlock();
//        }
//    }];
    DZRequestParams *params = [DZRequestParams new];
    [manager setUrlString:[DZURLFactory deliveryNums]];
    [manager setParams:[params dicParams]];
    [manager setHandler:handler];
    [manager post];
}
@end
