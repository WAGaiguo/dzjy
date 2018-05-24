//
//  DZURLFactory.h
//  DZJY
//
//  Created by wangaiguo on 2018/4/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZURLFactory : NSObject
FOUNDATION_EXPORT NSString *const DZBaseUrl;
FOUNDATION_EXPORT NSString *const DZCommonUrl;

+ (NSString *)login;
+ (NSString *)logout;
+ (NSString *)homeList;

// 修改注册手机号
+ (NSString *)mobileUpdateFirst;
+ (NSString *)mobileUpdateSecond;
+ (NSString *)mobileGetCode;


// 地址相关
+ (NSString *)addressList;
+ (NSString *)addressInsert;
+ (NSString *)addressDelete;
+ (NSString *)addressGet;
+ (NSString *)addressUpdate;
+ (NSString *)addressDefault;

// 发票相关
+ (NSString *)invoiceList;
+ (NSString *)invoiceUpdate;
+ (NSString *)invoiceInsert;
+ (NSString *)invoiceDelete;
+ (NSString *)invoiceDefault;
+ (NSString *)invoiceUpdateInit;

// 站内信
+ (NSString *)messageList;  //站内信列表
+ (NSString *)messageUpdate;//查看站内信 更新站内信已读、未读标志
+ (NSString *)messageNums;  //站内信未读数量

// 我的积分
+ (NSString *)pointsList;
+ (NSString *)pointsSumCount;

// 我的资金
+ (NSString *)fundInfo;
+ (NSString *)fundList;

// 关注
+ (NSString *)attentionList;
+ (NSString *)attentionAdd;
+ (NSString *)attentionCancel;

// 我的合同
+ (NSString *)contractList;
+ (NSString *)contractAbnormalList; //合同异常
+ (NSString *)contractNums;

// 我的交收
+ (NSString *)deliveryList;
+ (NSString *)deliveryGoodsList; //验货异议
+ (NSString *)deliveryTicketList; //验票异议
+ (NSString *)deliveryNums;

// 提单
+ (NSString *)ladingList;

// 会员信息
+ (NSString *)memberInfo;

// 修改登录密码
+ (NSString *)pwdChange;
+ (NSString *)getCode; // 获取手机验证码
+ (NSString *)phoneChangeFirst; //手机验证码修改手机号
+ (NSString *)phoneChangeSecond; //修改手机号

// 订单
+ (NSString *)orderList;
+ (NSString *)orderDetail;
+ (NSString *)orderGet; //订单加载
+ (NSString *)orderConfirm; //确认订单
+ (NSString *)orderSubmit; //提交订单
+ (NSString *)orderCheck; //订单查看
+ (NSString *)orderNums;

// 求购
+ (NSString *)boughtList;
+ (NSString *)boughtDetail;
+ (NSString *)boughtNums;

+ (NSString *)search;

@end
