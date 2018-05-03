//
//  UIColor+Instance.m
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import "UIColor+Instance.h"




@implementation UIColor (Instance)
UIColor* RGBCOLORA(int r,int g,int b,float a){
    return [UIColor RGBColor:r green:g blue:b alpha:a];
}

UIColor* RGBCOLOR(int r,int g,int b){
    return RGBCOLORA(r, g, b, 1.0);
}

+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue
{
    return [UIColor RGBColor:red green:green blue:blue alpha:1.0];
}
+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue alpha:(float)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
+ (UIColor *)randomColor
{
    int r = arc4random()%255;
    int g = arc4random()%255;
    int b = arc4random()%255;
    return RGBCOLOR(r, g, b);
}

+ (UIColor  *)colorWithHex:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

+ (UIColor *)darkGrayColor{
    return [UIColor colorWithHex:@"3C3C3C"];
}
+ (UIColor *)grayColor{
    return [UIColor colorWithHex:@"6E6E6E"];
}
+ (UIColor *)lightGrayColor{
    return [UIColor colorWithHex:@"999999"];
}

+ (UIColor *)backgroundColor{
    return [UIColor colorWithHex:@"F3F3F3"];
}
+ (UIColor *)seperatorColor{
    return [UIColor colorWithHex:@"E5E5E5"];
}
+ (UIColor *)themeBlueColor{
    return [UIColor whiteColor];
}
+ (UIColor *)orangeColor{
    return [UIColor colorWithHex:@"F5A623"];
}
+ (UIColor *)strongColor{
    return [UIColor colorWithHex:@"C81414"];
}
+ (UIColor *)weakColor{
    return [UIColor colorWithHex:@"45B172"];
}
+ (UIColor *)titleColor{
    return [UIColor colorWithHex:@"3C3C3C"];
}
+ (UIColor *)sixColor{
    return [UIColor colorWithHex:@"666666"];
}
+ (UIColor *)threeColor{
    return [UIColor colorWithHex:@"333333"];
}
+ (UIColor *)nineColor{
    return [UIColor colorWithHex:@"999999"];
}
+ (UIColor *)fiveColor{
    return [UIColor colorWithHex:@"555555"];
}
@end
