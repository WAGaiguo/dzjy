//
//  DZURLFactory.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZURLFactory.h"

/*
     线上部署环境
 */
//NSString * const DZBaseUrl = @"http://192.168.20.5";
//NSString * const DZCommonUrl = @"http://192.168.20.11/";

/*
 *  测试部署环境
 */
NSString * const DZBaseUrl = @"http://192.168.20.243";
NSString * const DZCommonUrl = @"http://192.168.20.243/sr/";

/*
     本地部署环境
 */
//NSString * const DZBaseUrl = @"http://192.168.20.5";
//NSString * const DZCommonUrl = @"http://192.168.20.11/";

@implementation DZURLFactory
+ (NSString *)baseUrl{
    return DZBaseUrl;
}
+ (NSString *)absulteString: (NSString *)url{
    return [NSString stringWithFormat:@"%@%@",DZBaseUrl,url];
}
+ (NSString *)login{
    return [self absulteString:@"/security/login"];
}
+ (NSString *)logout{
    return [self absulteString:@"/security/w/logout"];
}
+ (NSString *)homeList{
    return [self absulteString:@"/synth/searchApp"];
}


+ (NSString *)addressList{
    return [self absulteString:@"/memb/w/address/list"];
}
+ (NSString *)addressInsert{
    return [self absulteString:@"/memb/w/address/insert"];
}
+ (NSString *)addressDelete{
    return [self absulteString:@"/memb/w/address/delete"];
}
+ (NSString *)addressGet{
    return [self absulteString:@"/memb/w/address/get"];
}
+ (NSString *)addressUpdate{
    return [self absulteString:@"/memb/w/address/update"];
}
+ (NSString *)addressDefault{
    return [self absulteString:@"/memb/w/address/setDefault"];
}

+ (NSString *)invoiceList{
    return [self absulteString:@"/memb/w/invo/list"];
}
+ (NSString *)invoiceUpdate{
    return [self absulteString:@"/memb/w/app/invo/update"];
}
+ (NSString *)invoiceInsert{
    return [self absulteString:@"/memb/w/app/invo/insert"];
}
+ (NSString *)invoiceDelete{
    return [self absulteString:@"/memb/w/invo/delete"];
}
+ (NSString *)invoiceUpdateInit{
    return [self absulteString:@"/memb/w/app/invo/updateInit"];
}
+ (NSString *)invoiceDefault{
    return [self absulteString:@"/memb/w/invo/default"];
}
// 站内信
+ (NSString *)messageList{
    return [self absulteString:@"/memb/w/mess/list"];
}
+ (NSString *)messageUpdate{
    return [self absulteString:@"/memb/w/mess/update"];
}
// 积分
+ (NSString *)pointsList{
    return [self absulteString:@"/memb/w/integ/list"];
}
+ (NSString *)pointsSumCount{
    return [self absulteString:@"/memb/w/integ/sumCount"];
}
// 资金
+ (NSString *)fundInfo{
    return [self absulteString:@"/pay/w/yeepay/acc/getAccInfo"];
}
+ (NSString *)fundList{
    return [self absulteString:@"/pay/w/reveDisbDetails/listByMemb"];
}
// 关注
+ (NSString *)attentionList{
    return [self absulteString:@"/synth/w/supplyAttention/list"];
}
+ (NSString *)attentionAdd{
    return [self absulteString:@"/synth/w/supplyAttention/add"];
}
+ (NSString *)attentionCancel{
    return [self absulteString:@"/synth/w/supplyAttention/cancel"];
}
+ (NSString *)searchWantToBuy{
    return [self absulteString:@"/searchWantToBuy"];
}
+ (NSString *)hotSuppliseList{
    return [self absulteString:@"/w/listingInformation/getHotSuppliseList"];
}
+ (NSString *)search{
    return [self absulteString:@"synth/w/listingInformation/search"];
}
+ (NSString *)getFileByName{
    return [self absulteString:@"synth/w/listingInformation/search"];
}

@end
