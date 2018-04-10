//
//  UIImage+resizable.m
//  DZJY
//
//  Created by wangaiguo on 2018/4/10.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "UIImage+resize.h"

@implementation UIImage (resize)
+ (UIImage *)resizableImage{
    UIImage *image = [UIImage imageNamed:@"框框"];
    image =  [image resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 3, 3)];
    return image;
}
@end
