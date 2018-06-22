//
//  DZOrderBuyView.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/16.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZOrderBuyView.h"
#import <PPNumberButton.h>
#import "UIToolbar+Builder.h"
#import "NSString+Common.h"

@interface DZOrderBuyView()
{
    UIView *_backgroudV;
    UIView *_backContentV;
    PPNumberButton *_numberButton;
}
@end

@implementation DZOrderBuyView

-(instancetype)init{
    self = [super init];
    if (self){
        [self setWidth:SCREEN_WIDTH];
        [self setHeight:SCREEN_HEIGHT];
        _backgroudV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backgroudV.backgroundColor = UIBlackColor;
        _backgroudV.alpha = 0.5;
        [_backgroudV bk_whenTapped:^{
            [self setSelfHiden];
        }];
        [self addSubview:_backgroudV];
        [self afterView];
    }
    return self;
}
- (void)afterView{
    _backContentV = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 350, SCREEN_WIDTH, 350)];
    _backContentV.backgroundColor = UIWhiteColor;
    [self addSubview:_backContentV];
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(13, -13, 113, 113)];
    _imageV.layer.masksToBounds = YES;
    _imageV.layer.cornerRadius = 5.0f;
    [_backContentV addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.right + 10, 25, SCREEN_WIDTH - 136, 32)];
    _titleLabel.textColor = UITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.numberOfLines = 2;
    [_backContentV addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.textColor = UICommonColor;
    _priceLabel.width = 200;
    _priceLabel.left = _titleLabel.left;
    _priceLabel.height = 18;
    _priceLabel.top = _titleLabel.bottom + 13;
    _priceLabel.font = [UIFont systemFontOfSize:12];
    [_backContentV addSubview:_priceLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, _imageV.bottom + 15, SCREEN_WIDTH, ONE_PIXEL)];
    lineView.backgroundColor = UISeperatorColor;
    [_backContentV addSubview:lineView];
    
    _numsTopLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, lineView.bottom + 30, 100, 15)];
    _numsTopLabel.textColor = RGBCOLOR(85, 85, 85);
    _numsTopLabel.font = [UIFont systemFontOfSize:13];
    _numsTopLabel.text = @"可购买量";
    [_backContentV addSubview:_numsTopLabel];
    
    _numsBottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, _numsTopLabel.bottom + 10, SCREEN_WIDTH/2.0, 14)];
    _numsBottomLabel.textColor = RGBCOLOR(171, 169, 169);
    _numsBottomLabel.font = [UIFont systemFontOfSize:12];
    [_backContentV addSubview:_numsBottomLabel];
    
    
    UIImageView *rightCloseV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"按钮-关"]];
    rightCloseV.top = 4;
    rightCloseV.right = SCREEN_WIDTH - 13;
    [_backContentV addSubview:rightCloseV];
    rightCloseV.userInteractionEnabled = YES;
    [rightCloseV bk_whenTapped:^{
        [self setSelfHiden];
    }];
    
    DZOrderBuyBtnView *orderBtn = [[DZOrderBuyBtnView alloc]initWithFrame:CGRectMake(0, 350 - 47, SCREEN_WIDTH, 47)];
    [_backContentV addSubview:orderBtn];
    [orderBtn setTapBlcok:^{
        if (_tapBuyBlock) {
            _tapBuyBlock(_numberButton.currentNumber);
        }
    }];
    
    _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(SCREEN_WIDTH - 200, lineView.bottom + 20, 150, 32)];
    _numberButton.shakeAnimation = YES;
//    _numberButton.minValue = 1;
//    _numberButton.maxValue = 10;
    _numberButton.increaseTitle = @"+";
    _numberButton.decreaseTitle = @"-";
    _numberButton.borderColor = UISeperatorColor;
    [_backContentV addSubview:_numberButton];
    [_numberButton setResultBlock:^(PPNumberButton *ppBtn, CGFloat number, BOOL increaseStatus) {
    }];
    [_numberButton.textField setInputAccessoryView:[UIToolbar inputAccessoryView]];
    WEAK_SELF
    [_numberButton.textField setBk_didBeginEditingBlock:^(UITextField *textField) {
        [UIView animateWithDuration:0.33 animations:^{
            [me setBottom:SCREEN_HEIGHT - 100];
        }];
    }];
    [_numberButton.textField setBk_didEndEditingBlock:^(UITextField *textField) {
        [UIView animateWithDuration:0.33 animations:^{
            [me setBottom:SCREEN_HEIGHT];
        }];
    }];
    
    _unitLabel = [[UILabel alloc]initWithFrame:CGRectMake(_numberButton.right + 10, _numberButton.top, 40, 32)];
    _unitLabel.font = [UIFont systemFontOfSize:13];
    _unitLabel.textColor = UITitleColor;
    [_backContentV addSubview:_unitLabel];
    
    
//    _unitLabel.text = @"箱";
//    _imageV.backgroundColor = UICyanColor;
//    _titleLabel.text = @";aewjfoiajefiejwfiji";
//    _priceLabel.text = @"￥55";
}
- (void)setSelfHiden{
    [MAIN_WINDOW endEditing:YES];
    [UIView animateWithDuration:0.33 animations:^{
        [_backContentV setTop:SCREEN_HEIGHT];
        _backgroudV.alpha = 0;
    } completion:^(BOOL finished) {
        [self setHidden:YES];
    }];
}
- (void)animation{
    [self setHidden:NO];
    [_backContentV setTop:SCREEN_HEIGHT];
    _backgroudV.alpha = 0;
//    [UIView animateWithDuration:0.33 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        [_backContentV setTop:SCREEN_HEIGHT - 350];
//    } completion:^(BOOL finished) {
//        [_backgroudV setAlpha:0.5];
//    }];
    [UIView animateWithDuration:0.33 animations:^{
        [_backContentV setTop:SCREEN_HEIGHT - 350];
        [_backgroudV setAlpha:0.5];
    } completion:^(BOOL finished) {

    }];
}
- (NSMutableAttributedString *)priceStr:(NSString *)priceStr unitStr:(NSString *)unitStr{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@元/%@",priceStr,unitStr]];
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:NSMakeRange(0, priceStr.length)];
    return attString;
}
- (void)setContentDic:(NSDictionary *)dic{
    _titleLabel.text = [[dic objectForKey:@"commName"]description];
    
    NSString *unitString = @"kg";
    if (dic[@"measUnitName"] != nil) {
        unitString = dic[@"measUnitName"];
    } else {
        unitString = dic[@"measUnit"];
    }
    _priceLabel.attributedText = [self priceStr:[dic[@"basePrice"]description] unitStr:unitString];
    _numsBottomLabel.text = [NSString stringWithFormat:@"库存：%@%@",[NSString formateString: dic[@"listCount"]], unitString];
    _unitLabel.text = [NSString formateString: unitString];
    [_imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", DZCommonUrl, [dic objectForKey:@"fileUrl"]]]];
//    _numberButton.maxValue = [dic[@"listCount"] doubleValue];
}
@end

@implementation DZOrderBuyBtnView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"立即购买"]];
        _imageV.left = 0;
        _imageV.top = 0;
        _imageV.width = SCREEN_WIDTH;
        [self addSubview:_imageV];
        [self bk_whenTapped:^{
            if (_tapBlcok){
                _tapBlcok();
            }
        }];
    }
    return self;
}
@end
