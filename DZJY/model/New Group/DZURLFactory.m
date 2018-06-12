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
+ (NSString *)getFileByName{
    return [self absulteString:@"/conf/w/goods/list"];
}
+ (NSString *)mobileUpdateFirst{
    return [self absulteString:@"/memb/w/mobile/update/appFirstStep"];
}
+ (NSString *)mobileUpdateSecond{
    return [self absulteString:@"/memb/w/mobile/update"];
}
+ (NSString *)mobileGetCode{
    return [self absulteString:@"/security/mobile/valCode/create"];
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
+ (NSString *)messageNums{
    return [self absulteString:@"/memb/w/app/mess/unReadCount"];
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
    return [self absulteString:@"/pay/w/reveDisbDetails/list"];
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
// 合同
+ (NSString *)contractList{
    return [self absulteString:@"/prumt/w/cont/list"];
}
+ (NSString *)contractAbnormalList{
    return [self absulteString:@"/prumt/w/cont/app/contTermiList"];
}
+ (NSString *)contractNums{
    return [self absulteString:@"/prumt/w/cont/list/num"];
}
// 交收
+ (NSString *)deliveryList{
    return [self absulteString:@"/prumt/w/cont/deliv/list"];
}
+ (NSString *)deliveryGoodsList{
    return [self absulteString:@"/prumt/w/exaCom/diss/list"];
}
+ (NSString *)deliveryTicketList{
    return [self absulteString:@"/prumt/w/exaInvo/diss/list"];
}
+ (NSString *)deliveryNums{
    return [self absulteString:@"/prumt/w/cont/deliv/list/num"];
}
// 提单
+ (NSString *)ladingList{
    return [self absulteString:@"/prumt/w/take/comm/list"];
}

+ (NSString *)memberInfo{
    return [self absulteString:@"/memb/w/info/get"];
}
// 密码修改
+ (NSString *)pwdChange{
    return [self absulteString:@"/security/w/user/pwd/update"];
}
// 获取手机验证码
+ (NSString *)getCode{
    return [self absulteString:@"/security/mobile/valCode/create"];
}
// 手机号修改
+ (NSString *)phoneChangeFirst{
    return [self absulteString:@"/memb/w/mobile/update/byMobile"];
}
+ (NSString *)phoneChangeSecond{
    return [self absulteString:@"/memb/w/mobile/update"];
}
// 订单
+ (NSString *)orderList{
    return [self absulteString:@"/prumt/w/ord/list"];
}
+ (NSString *)orderDetail{
    return [self absulteString:@"/synth/w/listingInformation/get"];
}
+ (NSString *)orderGet{
    return [self absulteString:@"/sale/w/placeOrder/get"];
}
+ (NSString *)orderConfirm{
    return [self absulteString:@"/synth/w/supplierDetails/get"];
}
+ (NSString *)orderSubmit{
    return [self absulteString:@"/prumt/w/placeOrder/add"];
}
+ (NSString *)orderCheck{
    return [self absulteString:@"/sale/w/placeOrder/getOrderInfo"];
}
+ (NSString *)orderNums{
    return [self absulteString:@"/prumt/w/ord/list/num"];
}
// 求购
+ (NSString *)boughtList{
    return [self absulteString:@"/prumt/w/wtb/app/list"];
}
+ (NSString *)boughtDetail{
    return [self absulteString:@"/prumt/w/wtb/info"];
}
+ (NSString *)boughtNums{
    return [self absulteString:@"/prumt/w/wtb/app/recom/num"];
}
// 搜索
+ (NSString *)search{
    return [self absulteString:@"/synth/w/listingInformation/search"];
}
+ (NSString *)searchSpecification{
    return [self absulteString:@"/conf/attribute/set/forGidList"];
}
// 我的客户
+ (NSString *)clientMember{
    return [self absulteString:@"/memb/w/direct/list"];
}
+ (NSString *)clientDeal{
    return [self absulteString:@"/memb/w/trans/membList"];
}

// 挂牌详情展示 HTML链接
+ (NSString *)homeListDetail:(NSString *)detailId{
    return [NSString stringWithFormat:@"%@id=%@",[self absulteString:@"/detail/?"], detailId];
}

@end
