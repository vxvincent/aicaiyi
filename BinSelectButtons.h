//
//  BinSelectButtons.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/10.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BinSelectButtons : UIView

-(instancetype)initWithFrame:(CGRect)frame withNsarray:(NSArray *) array withSpace:(CGFloat)space;

@property(strong,nonatomic) NSArray *array;
@property(strong,nonatomic) UIColor *yBackgroudColor;
@property(strong,nonatomic) UIColor *nBackgroudColor;
@property(strong,nonatomic) UIColor *yTextColor;
@property(strong,nonatomic) UIColor *nTextColor;
@end
