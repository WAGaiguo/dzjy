//
//  DZMyMembersCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/2.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMyMembersCell.h"

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
        
        _titleRightLabel.text = @"阿里巴巴阿里巴巴";
    }
    return self;
}
- (void)setAccountContent:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            _titleLeftLabel.text = @"会员编号";
            break;
        case 1:
            _titleLeftLabel.text = @"公司全称";
            break;
        case 2:
            _titleLeftLabel.text = @"手机号码";
            break;
        case 3:
            _titleLeftLabel.text = @"用户名";
            break;
        case 4:
            _titleLeftLabel.text = @"会员等级";
            break;
        case 5:
            _titleLeftLabel.text = @"注册时间";
            break;
        default:
            break;
    }
}
- (void)setCompanyContent:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:
            _titleLeftLabel.text = @"公司全称";
            break;
        case 2:
            _titleLeftLabel.text = @"英文全称";
            break;
        case 3:
            _titleLeftLabel.text = @"法人代表";
            break;
        case 4:
            _titleLeftLabel.text = @"企业类型";
            break;
        case 5:
            _titleLeftLabel.text = @"经营模式";
            break;
        case 6:
            _titleLeftLabel.text = @"主营产品";
            break;
        case 7:
            _titleLeftLabel.text = @"证件类型";
            break;
        case 8:
            _titleLeftLabel.text = @"证件号码";
            break;
        case 9:
            _titleLeftLabel.text = @"法人代表";
            break;
        case 10:
            _titleLeftLabel.text = @"公司地址";
            break;
        case 11:
            _titleLeftLabel.text = @"详细地址";
            break;
        case 12:
            _titleLeftLabel.text = @"社会统一信息代码";
            break;
        case 13:
            _titleLeftLabel.text = @"公司简介";
            break;
        default:
            break;
    }
}
- (void)setConnectContent:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            _titleLeftLabel.text = @"联系人";
            break;
        case 1:
            _titleLeftLabel.text = @"手机号";
            break;
        case 2:
            _titleLeftLabel.text = @"固定电话";
            break;
        case 3:
            _titleLeftLabel.text = @"电子邮箱";
            break;
        case 4:
            _titleLeftLabel.text = @"传真";
            break;
        case 5:
            _titleLeftLabel.text = @"地址";
            break;
        default:
            break;
    }
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
