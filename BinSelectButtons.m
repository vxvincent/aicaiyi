//
//  BinSelectButtons.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/10.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "BinSelectButtons.h"

@interface BinSelectButtons ()

@end

@implementation BinSelectButtons


-(instancetype)initWithFrame:(CGRect)frame withNsarray:(NSArray *) array withSpace:(CGFloat)space
{
    self = [super initWithFrame:frame];
    if (self) {
        _yBackgroudColor = [UIColor colorWithRed:255.f/255 green:160.f/255 blue:0 alpha:1];
    }
    return self;
}

-(void)initView
{
    
    
}



-(void)setYBackgroudColor:(UIColor *)yBackgroudColor
{
    if (!_yBackgroudColor) {
        _yBackgroudColor = [UIColor colorWithRed:255.f/255 green:160.f/255 blue:0 alpha:1];
    } else {
        _yBackgroudColor = yBackgroudColor;
    }
}

-(void)setNBackgroudColor:(UIColor *)nBackgroudColor
{
    if (!_nBackgroudColor) {
        _nBackgroudColor = [UIColor whiteColor];
    }
}
-(void)setNTextColor:(UIColor *)nTextColor
{
    if (!_nBackgroudColor) {
        _nBackgroudColor = [UIColor whiteColor];
    }

}

-(void)setYTextColor:(UIColor *)yTextColor
{
    if (!_yTextColor) {
        
    }
}
@end
