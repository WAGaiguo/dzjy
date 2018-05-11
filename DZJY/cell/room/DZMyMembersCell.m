//
//  DZMyMembersCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyMembersCell.h"
#import "DZCityModel.h"

@implementation DZMyMembersCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 0, SCREEN_WIDTH - 14, 49)];
        backView.backgroundColor = UIWhiteColor;
        [self addSubview:backView];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, backView.height - ONE_PIXEL, SCREEN_WIDTH - 14, ONE_PIXEL)];
        lineView.backgroundColor = UISeperatorColor;
        [backView addSubview:lineView];
        
        _titleLeftLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 120, 48)];
        _titleLeftLabel.textColor = [UIColor colorWithHex:@"555555"];
        _titleLeftLabel.font = [UIFont systemFontOfSize:14];
        [backView addSubview:_titleLeftLabel];
        
        _titleRightLabel = [[UILabel alloc]initWithFrame:CGRectMake(_titleRightLabel.right - 60, 0, backView.width - _titleRightLabel.right + 50, 48)];
        _titleRightLabel.textAlignment = NSTextAlignmentRight;
        _titleRightLabel.font = [UIFont systemFontOfSize:14];
        _titleRightLabel.textColor = UI333333Color;
        [backView addSubview:_titleRightLabel];
        
    }
    return self;
}
- (void)setAccountContent:(NSIndexPath *)indexPath{
    NSLog(@"%@", _dic);
    switch (indexPath.row) {
        case 0:
            _titleLeftLabel.text = @"会员编号";
            _titleRightLabel.text = _dic[@"membNumb"];
            break;
        case 1:
            _titleLeftLabel.text = @"公司全称";
            _titleRightLabel.text = _dic[@"compFullName"];
            break;
        case 2:
            _titleLeftLabel.text = @"手机号码";
            _titleRightLabel.text = _dic[@"contactMobile"];
            break;
        case 3:
            _titleLeftLabel.text = @"用户名";
            _titleRightLabel.text = _dic[@"userName"];
            break;
        case 4:
            _titleLeftLabel.text = @"会员等级";
            _titleRightLabel.text = _dic[@"memebGrade"];
            break;
        case 5:
            _titleLeftLabel.text = @"注册时间";
            _titleRightLabel.text = _dic[@"regTime"];
            break;
        default:
            break;
    }
}
- (void)setCompanyContent:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:
            _titleLeftLabel.text = @"公司全称";
            _titleRightLabel.text = [_dic[@"compFullName"] description];
            break;
        case 2:
            _titleLeftLabel.text = @"英文全称";
            _titleRightLabel.text = [self isNull:_dic[@"compEnName"]]?@"":_dic[@"compEnName"];
            break;
        case 3:
            _titleLeftLabel.text = @"法人代表";
            _titleRightLabel.text = [_dic[@"legalPerson"] description];
            break;
        case 4:
            _titleLeftLabel.text = @"企业类型";
            [self companyType:_dic[@"enpType"]];
            break;
        case 5:
            _titleLeftLabel.text = @"经营模式";
            [self manageType:[_dic[@"operMode"] description]];
            break;
        case 6:
            _titleLeftLabel.text = @"主营产品";
            _titleRightLabel.text = [self isNull:_dic[@"mainProduct"]]?@"":_dic[@"mainProduct"];
            break;
        case 7:
            _titleLeftLabel.text = @"证件类型";
            _titleRightLabel.text = [_dic[@""] description];
            break;
        case 8:
            _titleLeftLabel.text = @"证件号码";
            _titleRightLabel.text = [_dic[@""] description];
            break;
        case 9:
            _titleLeftLabel.text = @"公司地址";
            _titleRightLabel.text = [DZCityModel prov:_dic[@"compAreaLists"][0] city:_dic[@"compAreaLists"][1] dist:_dic[@"compAreaLists"][2]];
            break;
        case 10:
            _titleLeftLabel.text = @"详细地址";
            _titleRightLabel.text = [_dic[@"address"] description];
            break;
        case 11:
            _titleLeftLabel.text = @"社会统一信息代码";
            _titleRightLabel.text = [_dic[@""] description];
            break;
        case 12:
            _titleLeftLabel.text = @"公司简介";
            _titleRightLabel.text = [self isNull:_dic[@"compProfile"]]?@"":[_dic[@"compProfile"] description];
            break;
        default:
            break;
    }
}
- (void)setConnectContent:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            _titleLeftLabel.text = @"联系人";
            _titleRightLabel.text = [_dic[@"contactName"] description];
            break;
        case 1:
            _titleLeftLabel.text = @"手机号";
            _titleRightLabel.text = [_dic[@"contactMobile"] description];
            break;
        case 2:
            _titleLeftLabel.text = @"固定电话";
            _titleRightLabel.text = [self isNull:_dic[@"contactTel"]]?@"" : [_dic[@"contactTel"] description];
            break;
        case 3:
            _titleLeftLabel.text = @"电子邮箱";
            _titleRightLabel.text = [self isNull:_dic[@"contactEmail"]]?@"":[_dic[@"contactEmail"] description];
            break;
        case 4:
            _titleLeftLabel.text = @"传真";
            _titleRightLabel.text = [self isNull:_dic[@"contactFac"]]?@"":[_dic[@"contactFac"] description];
            break;
        case 5:
            _titleLeftLabel.text = @"网址";
            _titleRightLabel.text = [self isNull:_dic[@"website"]]?@"":[_dic[@"website"] description];
            break;
        default:
            break;
    }
}
/**
 *  企业类型
 **/
- (void)companyType:(NSString *)strIntger{
    NSDictionary *dataDic = @{@"0":@"外资企业",
                              @"1":@"中外合资经营企业",
                              @"2":@"私营独资企业",
                              @"3":@"国有企业",
                              @"4":@"其它",
                              @"5":@"私营合伙企业",
                              @"6":@"私营有限责任公司",
                              @"7":@"私营股份有限责任公司",
                              @"8":@"集体企业",
                              @"9":@"股份合作企业",
                              @"10":@"有限责任公司（国有独资或控股）",
                              @"11":@"其他有限责任公司",
                              @"12":@"股份有限公司",
                              @"13":@"其他内资企业",
                              @"14":@"合资经营企业（港或澳，台）",
                              @"15":@"合作经营企业（港或澳，台）",
                              @"16":@"港，澳，台商独资经营企业",
                              @"17":@"港，澳，台商投资股份有限公司",
                              @"18":@"中外合作经营企业",
                              @"19":@"外商投资股份有限公司",
                              @"20":@"个体经营",
                              @"21":@"三来一补",
                              @"22":@"法人分支机构",
                              @"23":@"一人有限责任公司",
                              @"24":@"有限责任公司",
                              @"25":@"农民专业合作经济组织"
                              };
    if (strIntger.integerValue > 25) {
        _titleRightLabel.text = @""; return;
    }
    _titleRightLabel.text = dataDic[strIntger];
}
// 经营模式
- (void)manageType:(NSString *)str{
    if ([str isEqualToString:@"0"]) {
        _titleRightLabel.text = @"生产型";
    }else if ([str isEqualToString:@"1"]){
        _titleRightLabel.text = @"生产+销售";
    }else if ([str isEqualToString:@"2"]){
        _titleRightLabel.text = @"销售型";
    }
}
- (BOOL)isNull:(NSString *)str{
    if ([str isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}
@end

@implementation DZMyMembersLogoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(7, 0, SCREEN_WIDTH - 14, 87)];
        backView.backgroundColor = UIWhiteColor;
        [self addSubview:backView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 87)];
        label.textColor = [UIColor colorWithHex:@"555555"];
        label.font = [UIFont systemFontOfSize:14];
        label.text = @"公司logo";
        [backView addSubview:label];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, backView.height - ONE_PIXEL, SCREEN_WIDTH - 14, ONE_PIXEL)];
        lineView.backgroundColor = UISeperatorColor;
        [backView addSubview:lineView];
        
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        _imageV.right = backView.width - 14;
        _imageV.centerY = 44;
        [backView addSubview:_imageV];
        _imageV.layer.masksToBounds = YES;
        _imageV.layer.borderWidth = ONE_PIXEL;
        _imageV.layer.borderColor = [UIColor colorWithHex:@"eeeeee"].CGColor;
    }
    return self;
}
@end
