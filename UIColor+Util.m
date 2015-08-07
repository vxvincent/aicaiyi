//
//  UIColor+Util.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/8.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+(UIColor *)textGrayColor
{
    
    return [UIColor lightGrayColor];
}
#pragma mark - theme colors

+ (UIColor *)themeColor
{
//    return [UIColor colorWithRed:230.0/255 green:65.0/255 blue:71.0/255 alpha:1.0];
    return [UIColor redColor];
}

+ (UIColor *)nameColor
{
    return [UIColor colorWithHex:0x087221];
}

@end
