//
//  DZMessageCell.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/1.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZMessageCell.h"
#import "NSDate+Format.h"


@interface DZMessageCell(){
    UIView *backV;
    UIView *redV;
}
@end

@implementation DZMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _isFolder = NO;
        [self setBackgroundColor:UIBackgroundColor];
        [self afterView];
    }
    return self;
}

- (void)afterView{
    backV = [[UIView alloc]initWithFrame:CGRectMake(7, 7, SCREEN_WIDTH - 14, 77)];
    backV.backgroundColor = UIWhiteColor;
    [self addSubview:backV];
    
    _imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"消息1"]];
    _imageV.left = 15;
    _imageV.centerY = 38.5;
    [backV addSubview:_imageV];
    
    redV = [[UIView alloc]initWithFrame:CGRectMake(_imageV.width - 10, 0, 10, 10)];
    redV.backgroundColor = UIRedColor;
    redV.layer.masksToBounds = YES;
    redV.layer.cornerRadius = 5;
    [_imageV addSubview:redV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 11, 18, backV.width - 93, 18)];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = UITitleColor;
    [backV addSubview:_titleLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.left, _titleLabel.bottom + 10, _titleLabel.width, 15)];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textColor = UISubTitleColor;
    [backV addSubview:_timeLabel];
    
    _imageFolder = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"message_展开"]];
    _imageFolder.top = _timeLabel.top;
    _imageFolder.right = backV.width - 10;
    _imageFolder.width = _imageFolder.height = 13;
    _imageFolder.contentMode = UIViewContentModeScaleAspectFit;
    [backV addSubview:_imageFolder];
    
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(_timeLabel.left, _timeLabel.bottom + 12, SCREEN_WIDTH - 100, 0)];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.textColor = [UIColor colorWithHex:@"666666"];
    _contentLabel.numberOfLines = 0;
    [backV addSubview:_contentLabel];
    
}

//- (void)test{
//    _titleLabel.text = @"标题标题";
//    _timeLabel.text = @"2018-03-45";
//}

- (void)setIsFolder:(BOOL)isFolder{
    _isFolder = isFolder;
    if (isFolder) {
        _imageFolder.image = [UIImage imageNamed:@"message_收起"];
        _contentLabel.height = _model.height;
        backV.height = 77 + _model.height + 10;
    } else {
        _imageFolder.image = [UIImage imageNamed:@"message_展开"];
        _contentLabel.height = 0;
        backV.height = 77;
    }
}

- (void)setIsRed:(BOOL)isRed{
    _isRed = isRed;
    if (isRed) {
        redV.hidden = YES;
    }else{
        redV.hidden = NO;
    }
}

- (void)setContent:(DZMessageModel *)content{
    _model = content;
    _contentLabel.text = content.content;
    _titleLabel.text = content.title;
    _timeLabel.text = [NSDate timestampToTime:content.time];
    _isFolder = content.isFolder;
    if ([content.readFlag isEqualToString:@"1"]) {
        [self setIsRed:YES];
    }else{
        [self setIsRed:NO];
    }
}
@end

@implementation DZMessageCell2

@end
