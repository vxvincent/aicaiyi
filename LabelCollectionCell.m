//
//  LabelCollectionCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/7/4.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "LabelCollectionCell.h"

@implementation LabelCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _items = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];

        CGFloat height = 30;
        CGFloat width = self.frame.size.width/7;
        self.backgroundColor = grayBackgroud;
        for (int i = 0; i < 7; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
//            label = [[UILabel alloc] initWithFrame:frame];
            label.backgroundColor = grayBackgroud;
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = _items[i];
            [self addSubview:label];
            
        }
    }
    return self;
}


@end
