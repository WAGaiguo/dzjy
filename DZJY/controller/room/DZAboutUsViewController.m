//
//  DZAboutUsViewController.m
//  DZJY
//
//  Created by wangaiguo on 2018/5/6.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "DZAboutUsViewController.h"
#import "DZWebViewController.h"

@interface DZAboutUsViewController (){
    UIView *backHeaderV;
}

@end

@implementation DZAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"关于我们"];
    [self setHeaderBackGroud:YES];
    [self setBackEnabled:YES];
    backHeaderV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP)];
    [self.tableView setTableHeaderView:backHeaderV];
    [self configUI];
}
- (void)configUI{
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    logo.center = CGPointMake(SCREEN_WIDTH/2.0, 50);
    [backHeaderV addSubview:logo];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(21, logo.bottom + 30, SCREEN_WIDTH - 36, 0)];
    label.numberOfLines = 0;
    [backHeaderV addSubview:label];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = UI666666Color;
    label.attributedText = [self TitleColor:@"“菜盟盟”山东寿光大宗蔬菜电子交易平台，由寿光百胜菜盟电子商务科技有限公司在寿光市委市政府的关心和推动下，在中国（寿光）国际蔬菜博览会和寿光市蔬菜协会的支持下，聚合寿光蔬菜生产企业和专合组织，引领我国大宗蔬菜由传统的线下交易向互联网上交易转变，实现交易信息化、交易产品标准化、交易质量可追溯、交易信用可保障、交易风险可控制，促进我国蔬菜产业走向利益向产地和销地延伸、交易成本向中间大幅下降、交易产品向品牌高端促进发展。\n\n平台以交易为核心，聚合蔬菜产业资源，形成专业的蔬菜产业互联网平台，为蔬菜产业提供产地管理支撑、交易支撑、物流支撑、金蓉服务支撑，将平台打造为全国蔬菜产业综合服务平台。实现一二三产业融合发展，实现寿光蔬菜产业转型升级，实现质量兴农、绿色兴农、品牌强农！"];
    [label sizeToFit];
    
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(7, label.bottom + 25, SCREEN_WIDTH - 14, 80)];
    backV.backgroundColor = UIWhiteColor;
    [backHeaderV addSubview:backV];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(11, 10, SCREEN_WIDTH - 36, 20)];
    label1.font = [UIFont systemFontOfSize:13];
    label1.textColor = UITitleColor;
    label1.text = @"客服热线：400-0000-000";
    [backV addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(11, label1.bottom, SCREEN_WIDTH - 36, 20)];
    label2.font = [UIFont systemFontOfSize:13];
    label2.textColor = UITitleColor;
    label2.text = @"客服邮箱：service@caimm.com.cn";
    [backV addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(11, label2.bottom, SCREEN_WIDTH - 36, 20)];
    label3.font = [UIFont systemFontOfSize:13];
    label3.textColor = UITitleColor;
    label3.text = @"当前版本：v 1.0.0";
    [backV addSubview:label3];
    
    
    UILabel *underlineLabel = [[UILabel alloc] initWithFrame:(CGRectMake(10, backV.bottom + 50, 95, 20))];
    underlineLabel.textColor = UICommonColor;
    underlineLabel.centerX = SCREEN_WIDTH/2.0;
    underlineLabel.font = [UIFont systemFontOfSize:14];
    underlineLabel.textAlignment = NSTextAlignmentCenter;
    NSString *textStr = @"《用户协议》";
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
    underlineLabel.attributedText = attribtStr;
    [backHeaderV addSubview:underlineLabel];
    underlineLabel.userInteractionEnabled = YES;
    [underlineLabel bk_whenTapped:^{
        DZWebViewController *webV = [DZWebViewController new];
        webV.nativeContent = @"agreement.html";
        webV.navigationTitle = @"用户协议";
        [self.navigationController pushViewController:webV animated:YES];
    }];
    
    UILabel *copyRightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, underlineLabel.bottom + 7, SCREEN_WIDTH, 20)];
    copyRightLabel.font = [UIFont systemFontOfSize:12];
    copyRightLabel.textColor = UISubTitleColor;
    copyRightLabel.textAlignment = NSTextAlignmentCenter;
    copyRightLabel.text = @"CopyRight @ 菜盟萌 2018";
    [backHeaderV addSubview:copyRightLabel];
}

- (NSMutableAttributedString *)TitleColor:(NSString *)text{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName value:UICommonColor range:NSMakeRange(0, 5)];
    return str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
