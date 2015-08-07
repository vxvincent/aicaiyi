//
//  ClassCollectionCell.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/24.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "ClassCollectionCell.h"

@implementation ClassCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        _image.backgroundColor = [UIColor clearColor];
        _image.image  = [UIImage imageNamed:@"shang_w"];
        [self addSubview:_image];
    }
    return self;
}

@end
